CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;

CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    published_year INT,
    price DECIMAL(8, 2)
);

CREATE TABLE IF NOT EXISTS members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    membership_type ENUM('regular', 'premium') DEFAULT 'regular'
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    due_date DATE,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES books (book_id),
    FOREIGN KEY (member_id) REFERENCES members (member_id)
);

-- 01_________________________________
SELECT genre, COUNT(*) as books, AVG(price) as avg_price
FROM books
GROUP BY
    genre
ORDER BY books DESC;

-- 02_________________________________
SELECT
    title,
    author,
    published_year,
    price
FROM books
WHERE
    published_year < 2000
ORDER BY published_year, price DESC;

-- 03_________________________________
SELECT m.member_id, m.first_name, m.last_name, COUNT(l.loan_id) AS borrowed_count
FROM members m
    JOIN loans l ON m.member_id = l.member_id
GROUP BY
    m.member_id
HAVING
    COUNT(l.loan_id) > (
        SELECT AVG(loan_count)
        FROM (
                SELECT COUNT(loan_id) AS loan_count
                FROM loans l2
                    JOIN members m2 ON l2.member_id = m2.member_id
                WHERE
                    m2.membership_type = 'premium'
                GROUP BY
                    m2.member_id
            ) AS sub_table
    );

-- 04_________________________________
SELECT book_id, title, author, genre
FROM books
WHERE
    title LIKE 'The%'
    AND SUBSTRING_INDEX(LOWER(author), ' ', -1) LIKE '%o%'
    AND genre LIKE '%n';

-- 05_________________________________
SELECT b.title AS "Book Title", CONCAT(
        m.last_name, ', ', m.first_name
    ) AS "Member Name", l.due_date AS "Due Date", DATEDIFF(CURDATE(), l.due_date) as "Days Overdue"
FROM members m
    JOIN loans l ON m.member_id = l.member_id
    JOIN books b ON l.book_id = b.book_id
WHERE
    l.return_date IS NULL
    AND l.due_date < CURDATE()
    AND b.price > 10
ORDER BY "Days Overdue" DESC;