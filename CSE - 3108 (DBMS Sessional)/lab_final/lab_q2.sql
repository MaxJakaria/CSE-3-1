-- Create a new database for Lab Question 2
CREATE DATABASE IF NOT EXISTS lab_q2_q3_university_db;
USE lab_q2_q3_university_db;
-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    age INT
);
-- Create Departments table
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
-- Create Grades table
CREATE TABLE IF NOT EXISTS Grades (
    student_id INT,
    subject VARCHAR(100),
    grade INT
);
--
--
INSERT INTO Students (student_id, name, department_id, age) VALUES
(1, 'Alice', 101, 21),
(2, 'Bob', 102, 22),
(3, 'Charlie', 101, 20),
(4, 'Diana', 103, 23),
(5, 'Eve', 102, 22),
(6, 'Frank', 104, 24);


INSERT INTO Departments (department_id, department_name) VALUES
(101, 'Computer Science'),
(102, 'Mechanical Eng.'),
(103, 'Civil Eng.'),
(104, 'Electrical Eng.');


INSERT INTO Grades (student_id, subject, grade) VALUES
(1, 'Databases', 85),
(2, 'Thermodynamics', 78),
(3, 'Algorithms', 92),
(4, 'Structures', 88),
(5, 'Robotics', 74),
(1, 'Networking', 89),
(3, 'Data Mining', 95);
--
--
--
-- 1. Write an SQL query to join the tables___________________
SELECT s.student_id,
    s.name,
    d.department_name,
    g.subject,
    g.grade
FROM students AS s,
    departments AS d,
    grades AS g
WHERE s.department_id = d.department_id
    AND s.student_id = g.student_id;
-- OR (Add JOIN keyword Replace WHERE with ON)
SELECT s.student_id,
    s.name,
    d.department_name,
    g.subject,
    g.grade
FROM students AS s
    JOIN departments AS d
    JOIN grades AS g ON s.department_id = d.department_id
    AND s.student_id = g.student_id;
--
-- 2. Modify the query to group results and find the total number of students
SELECT d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students
FROM Departments d
    LEFT JOIN Students s ON d.department_id = s.department_id
    RIGHT JOIN Grades g ON s.student_id = g.student_id
GROUP BY d.department_name;
--
-- 3. Further extend the query to order the results by total students
SELECT d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students
FROM departments As d
    LEFT JOIN students As s ON d.department_id = s.department_id
    RIGHT JOIN grades As g ON g.student_id = s.student_id
GROUP BY d.department_name
ORDER BY total_students DESC;
--
-- 4. Create an additional column for the highest grade and order appropriately
USE lab2_university;
SELECT d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    MAX(DISTINCT g.grade) AS highest_grade
FROM departments AS d
    LEFT JOIN students As s on d.department_id = s.department_id
    LEFT JOIN grades AS g ON s.student_id = g.student_id
GROUP BY d.department_name
ORDER BY total_students DESC,
    highest_grade DESC;