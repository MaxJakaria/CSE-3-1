CREATE DATABASE IF NOT EXISTS lab1_trigger;
use lab1_trigger;

CREATE TABLE IF NOT EXISTS students(
    students_id INT AUTO_INCREMENT PRIMARY KEY,
    name text NOT NULL,
    dept text NOT NULL
);

CREATE TABLE IF NOT EXISTS students_log(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    students_id INT,
    action text NOT NULL,
    action_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_student_insert
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO students_log (students_id, action, action_time) 
    VALUES (NEW.students_id, 'INSERTED', NOW());
END;
//

DELIMITER ;

TRUNCATE TABLE students;
TRUNCATE TABLE students_log;

INSERT INTO students ( name, dept ) VALUES(
     'Jakaria', 'CSE'
);

SELECT * FROM students;
SELECT * FROM students_log;