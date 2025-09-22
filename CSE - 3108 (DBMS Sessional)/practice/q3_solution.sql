-- =======================================================================
-- CLEANUP (Optional: safe to run multiple times)
-- This will remove old triggers and tables before re-creating them.
-- =======================================================================
DROP TRIGGER IF EXISTS trg_update_order_status;
DROP TRIGGER IF EXISTS trg_update_stock;
DROP TRIGGER IF EXISTS trg_check_stock_before_insert;
DROP TRIGGER IF EXISTS trg_log_salary_change;

DROP TABLE IF EXISTS Salary_Audit;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Orders;


-- =======================================================================
-- PROBLEM 1: Orders Table + Trigger
-- Requirement:
--  If delivery_date is updated (to non-NULL), and order_status is 'Pending',
--  then automatically change order_status to 'Delivered'.
-- =======================================================================

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders ( 
    order_id INT PRIMARY KEY AUTO_INCREMENT, 
    customer_id INT, 
    order_status VARCHAR(20), 
    order_date DATE, 
    delivery_date DATE 
);

-- Create trigger (BEFORE UPDATE to modify NEW row directly)
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS trg_update_order_status
BEFORE UPDATE ON Orders
FOR EACH ROW
BEGIN
    -- If delivery_date gets a value AND status was 'Pending',
    -- then set order_status = 'Delivered'
    IF NEW.delivery_date IS NOT NULL
       AND (OLD.delivery_date IS NULL OR OLD.delivery_date <> NEW.delivery_date)
       AND OLD.order_status = 'Pending' THEN
        SET NEW.order_status = 'Delivered';
    END IF;
END$$
DELIMITER ;

-- --------------------------
-- Test Problem 1
-- --------------------------
-- Insert sample Pending order
INSERT INTO Orders (customer_id, order_status, order_date) 
VALUES (101, 'Pending', CURDATE()),
       (102, 'Pending', CURDATE()),
       (103, 'Pending', CURDATE());

-- Before update: should show all rows with 'Pending'
SELECT 'Before update' AS step, order_id, customer_id, order_status, order_date, delivery_date
FROM Orders;

-- Update delivery_date for all rows → Trigger should set status = 'Delivered'
UPDATE Orders
SET delivery_date = CURDATE() + INTERVAL 3 DAY
WHERE order_status = 'Pending';

-- After update: should show all rows with 'Delivered'
SELECT 'After update' AS step, order_id, customer_id, order_status, order_date, delivery_date
FROM Orders;



-- =======================================================================
-- PROBLEM 2: Products & Sales Tables + Stock Update Trigger
-- Requirement:
--  When a new sale is inserted, automatically decrease stock_quantity
--  for the corresponding product. Also, optionally prevent sale if stock
--  is insufficient.
-- =======================================================================

-- Create Products table
CREATE TABLE IF NOT EXISTS Products ( 
    product_id INT PRIMARY KEY AUTO_INCREMENT, 
    product_name VARCHAR(100), 
    stock_quantity INT 
);

-- Create Sales table
CREATE TABLE IF NOT EXISTS Sales ( 
    sale_id INT PRIMARY KEY AUTO_INCREMENT, 
    product_id INT, 
    quantity_sold INT, 
    sale_date DATE 
);

-- AFTER INSERT trigger → decrease stock
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS trg_update_stock
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE product_id = NEW.product_id
      AND stock_quantity >= NEW.quantity_sold;
    -- NOTE: If stock is insufficient, this UPDATE does nothing.
END$$
DELIMITER ;

-- BEFORE INSERT trigger (Optional) → block sale if stock not enough
DELIMITER $$
CREATE TRIGGER trg_check_stock_before_insert
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    DECLARE curr_stock INT;
    SELECT stock_quantity INTO curr_stock FROM Products WHERE product_id = NEW.product_id;

    IF curr_stock IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product not found';
    ELSEIF curr_stock < NEW.quantity_sold THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock';
    END IF;
END$$
DELIMITER ;

-- --------------------------
-- Test Problem 2
-- --------------------------
-- Insert Products
INSERT INTO Products (product_name, stock_quantity) 
VALUES ('Laptop', 10), ('Mouse', 10);

-- Before sales: should show Laptop=10, Mouse=20
SELECT 'Before sales' AS step, product_id, product_name, stock_quantity FROM Products;

-- Insert valid sales (within stock)
INSERT INTO Sales (product_id, quantity_sold, sale_date)
VALUES (1, 3, CURDATE()), (2, 5, CURDATE());

-- After sales: should show Laptop=7, Mouse=15
SELECT 'After sales' AS step, product_id, product_name, stock_quantity FROM Products;

-- Uncomment to test insufficient stock (will raise error because of BEFORE INSERT trigger)
-- INSERT INTO Sales (product_id, quantity_sold, sale_date) VALUES (1, 100, CURDATE());



-- =======================================================================
-- PROBLEM 3: Employees & Salary_Audit Tables + Trigger
-- Requirement:
--  When an employee's salary changes, log old and new salary into
--  Salary_Audit table for audit purposes.
-- =======================================================================

-- Create Employees table
CREATE TABLE IF NOT EXISTS Employees ( 
    employee_id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(100), 
    salary DECIMAL(10, 2) 
);

-- Create Salary_Audit table
CREATE TABLE IF NOT EXISTS Salary_Audit ( 
    audit_id INT PRIMARY KEY AUTO_INCREMENT, 
    employee_id INT, 
    old_salary DECIMAL(10, 2), 
    new_salary DECIMAL(10, 2), 
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- AFTER UPDATE trigger → log salary changes
DELIMITER $$
CREATE TRIGGER IF NOT EXISTS trg_log_salary_change
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    -- Only log if salary actually changed
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO Salary_Audit (employee_id, old_salary, new_salary)
        VALUES (NEW.employee_id, OLD.salary, NEW.salary);
    END IF;
END$$
DELIMITER ;

-- --------------------------
-- Test Problem 3
-- --------------------------
-- Insert Employees
INSERT INTO Employees (name, salary) 
VALUES ('Alice', 50000.00), ('Bob', 60000.00);

-- Before salary update: show original salaries
SELECT 'Before salary update' AS step, employee_id, name, salary FROM Employees;

-- Update salaries (trigger will log changes)
UPDATE Employees SET salary = 55000.00 WHERE employee_id = 1;
UPDATE Employees SET salary = 65000.00 WHERE employee_id = 2;

-- After update: show new salaries
SELECT 'After salary update' AS step, employee_id, name, salary FROM Employees;

-- Show audit log: should contain two records
SELECT 'Salary audit log' AS step, audit_id, employee_id, old_salary, new_salary, change_date
FROM Salary_Audit;
