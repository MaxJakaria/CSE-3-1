CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- Create students table
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    enrollment_year INT,
    major VARCHAR(50),
    gpa DECIMAL(3,2),
    credits_earned INT,
    graduation_date DATE,
    is_active BOOLEAN
);

-- Insert dummy data
INSERT INTO students VALUES
(1001, 'Emily', 'Johnson', 'emily.johnson@university.edu', 2021, 'Computer Science', 3.78, 94, '2024-05-15', TRUE),
(1002, 'Michael', 'Williams', 'michael.w@email.com', 2019, 'Biology', 3.45, 120, '2023-05-20', FALSE),
(1003, 'Sarah', 'Smith', 'sarah.smith@gmail.com', 2021, 'Mathematics', 3.92, 75, '2025-05-18', TRUE),
(1004, 'David', 'Brown', 'david.brown@university.edu', 2021, 'Physics', 3.21, 90, '2024-05-15', FALSE),
(1005, 'Jessica', 'Davis', 'jessica.d@email.com', 2022, 'Computer Science', 3.65, 45, '2026-05-17', TRUE),
(1006, 'Robert', 'Miller', 'robert.miller@university.edu', 2021, 'Chemistry', 2.98, 60, '2025-05-18', FALSE),
(1007, 'Jennifer', 'Wilson', 'jennifer.w@gmail.com', 2019, 'Biology', 3.33, 124, '2023-05-20', TRUE),
(1008, 'Thomas', 'Moore', 'thomas.moore@email.com', 2021, 'Mathematics', 3.87, 96, '2024-05-15', FALSE),
(1009, 'Lisa', 'Taylor', 'lisa.t@university.edu', 2022, 'Psychology', 3.54, 42, '2026-05-17', TRUE),
(1010, 'Daniel', 'Anderson', 'daniel.a@gmail.com', 2021, 'Computer Science', 3.76, 68, '2025-05-18', FALSE),
(1011, 'Michelle', 'Thomas', 'michelle.thomas@email.com', 2019, 'English', 3.12, 128, '2023-05-20', TRUE),
(1012, 'Christopher', 'Jackson', 'chris.jackson@university.edu', 2021, 'Physics', 3.45, 92, '2024-05-15', FALSE),
(1013, 'Amanda', 'White', 'amanda.white@gmail.com', 2022, 'Biology', 3.21, 48, '2026-05-17', TRUE),
(1014, 'Matthew', 'Harris', 'matthew.h@email.com', 2021, 'Computer Science', 3.99, 72, '2025-05-18', FALSE),
(1015, 'Laura', 'Martin', 'laura.martin@university.edu', 2021, 'Economics', 2.87, 88, '2024-05-15', TRUE),
(1016, 'Kevin', 'Thompson', 'kevin.t@gmail.com', 2019, 'History', 3.56, 122, '2023-05-20', FALSE),
(1017, 'Nicole', 'Garcia', 'nicole.g@email.com', 2022, 'Mathematics', 3.78, 50, '2026-05-17', TRUE),
(1018, 'Andrew', 'Martinez', 'andrew.martinez@university.edu', 2021, 'Computer Science', 3.65, 64, '2025-05-18', FALSE),
(1019, 'Stephanie', 'Robinson', 'stephanie.r@gmail.com', 2021, 'Biology', 3.42, 95, '2024-05-15', TRUE),
(1020, 'Ryan', 'Clark', 'ryan.clark@email.com', 2019, 'Physics', 3.67, 126, '2023-05-20', FALSE),
(1021, 'Rachel', 'Rodriguez', 'rachel.r@university.edu', 2022, 'Psychology', 3.23, 52, '2026-05-17', TRUE),
(1022, 'James', 'Lewis', 'james.lewis@gmail.com', 2021, 'Computer Science', 3.88, 70, '2025-05-18', FALSE),
(1023, 'Megan', 'Lee', 'megan.lee@email.com', 2020, 'Chemistry', 3.15, 91, '2024-05-15', TRUE),
(1024, 'Joshua', 'Walker', 'joshua.w@university.edu', 2019, 'Mathematics', 3.72, 130, '2023-05-20', FALSE),
(1025, 'Rebecca', 'Hall', 'rebecca.hall@gmail.com', 2022, 'English', 3.45, 55, '2026-05-17', TRUE),
(1026, 'John', 'Allen', 'john.allen@email.com', 2021, 'Computer Science', 3.91, 66, '2025-05-18', FALSE),
(1027, 'Samantha', 'Young', 'samantha.y@university.edu', 2020, 'Economics', 2.95, 89, '2024-05-15', TRUE),
(1028, 'Nathan', 'Hernandez', 'nathan.h@gmail.com', 2019, 'Biology', 3.28, 125, '2023-05-20', FALSE),
(1029, 'Hannah', 'King', 'hannah.king@email.com', 2022, 'Physics', 3.62, 47, '2026-05-17', TRUE),
(1030, 'Brandon', 'Wright', 'brandon.w@university.edu', 2021, 'Computer Science', 3.79, 71, '2025-05-18', FALSE),
(1031, 'Oliver', 'Scott', 'oliver.scott@university.edu', 2018, 'Computer Science', 3.44, 132, '2022-05-20', TRUE),
(1032, 'Sophia', 'Green', 'sophia.green@email.com', 2019, 'Biology', 3.18, 118, '2023-05-20', FALSE),
(1033, 'Ethan', 'Adams', 'ethan.adams@gmail.com', 2021, 'Mathematics', 3.71, 88, '2024-05-15', TRUE),
(1034, 'Olivia', 'Nelson', 'olivia.nelson@university.edu', 2021, 'Physics', 2.92, 64, '2025-05-18', FALSE),
(1035, 'Liam', 'Baker', 'liam.baker@gmail.com', 2022, 'Chemistry', 3.56, 40, '2026-05-17', TRUE),
(1036, 'Emma', 'Perez', 'emma.perez@university.edu', 2019, 'History', 3.22, 121, '2023-05-20', FALSE),
(1037, 'Noah', 'Carter', 'noah.carter@gmail.com', 2021, 'Economics', 2.98, 92, '2024-05-15', TRUE),
(1038, 'Isabella', 'Mitchell', 'isabella.mitchell@email.com', 2021, 'English', 3.47, 70, '2025-05-18', FALSE),
(1039, 'Mason', 'Perez', 'mason.perez@university.edu', 2022, 'Computer Science', 3.84, 55, '2026-05-17', TRUE),
(1040, 'Ava', 'Roberts', 'ava.roberts@gmail.com', 2018, 'Mathematics', 3.65, 128, '2022-05-20', FALSE),
(1041, 'Logan', 'Hall', 'logan.hall@university.edu', 2019, 'Biology', 3.33, 119, '2023-05-20', TRUE),
(1042, 'Mia', 'Young', 'mia.young@gmail.com', 2021, 'Physics', 3.78, 95, '2024-05-15', FALSE),
(1043, 'Lucas', 'Hernandez', 'lucas.h@university.edu', 2021, 'Psychology', 3.29, 72, '2025-05-18', TRUE),
(1044, 'Charlotte', 'King', 'charlotte.king@gmail.com', 2022, 'Economics', 2.75, 46, '2026-05-17', FALSE),
(1045, 'Elijah', 'Wright', 'elijah.w@university.edu', 2019, 'Chemistry', 3.58, 120, '2023-05-20', TRUE),
(1046, 'Amelia', 'Lopez', 'amelia.lopez@email.com', 2021, 'Computer Science', 3.91, 92, '2024-05-15', FALSE),
(1047, 'Benjamin', 'Hill', 'benjamin.hill@university.edu', 2021, 'Mathematics', 3.52, 66, '2025-05-18', TRUE),
(1048, 'Harper', 'Scott', 'harper.s@gmail.com', 2022, 'English', 3.12, 48, '2026-05-17', FALSE),
(1049, 'Alexander', 'Adams', 'alex.adams@university.edu', 2018, 'Physics', 3.67, 135, '2022-05-20', TRUE),
(1050, 'Ella', 'Torres', 'ella.torres@gmail.com', 2019, 'Psychology', 3.49, 118, '2023-05-20', FALSE),
(1051, 'William', 'Gray', 'william.gray@university.edu', 2021, 'History', 2.95, 98, '2024-05-15', TRUE),
(1052, 'Grace', 'Ramirez', 'grace.r@email.com', 2021, 'Computer Science', 3.82, 74, '2025-05-18', FALSE),
(1053, 'Henry', 'Flores', 'henry.flores@university.edu', 2022, 'Biology', 3.25, 50, '2026-05-17', TRUE),
(1054, 'Chloe', 'Rivera', 'chloe.rivera@gmail.com', 2018, 'Mathematics', 3.95, 136, '2022-05-20', FALSE),
(1055, 'Jack', 'Cooper', 'jack.cooper@university.edu', 2019, 'Chemistry', 3.42, 115, '2023-05-20', TRUE),
(1056, 'Zoe', 'Reed', 'zoe.reed@gmail.com', 2021, 'Economics', 2.88, 80, '2024-05-15', FALSE),
(1057, 'Sebastian', 'Gomez', 'seb.gomez@university.edu', 2021, 'English', 3.68, 69, '2025-05-18', TRUE),
(1058, 'Aria', 'Ward', 'aria.ward@university.edu', 2022, 'Physics', 3.73, 53, '2026-05-17', FALSE),
(1059, 'Daniel', 'Morgan', 'daniel.morgan@gmail.com', 2018, 'Computer Science', 3.15, 140, '2022-05-20', TRUE),
(1060, 'Scarlett', 'Brooks', 'scarlett.b@university.edu', 2019, 'History', 3.36, 125, '2023-05-20', FALSE),
(1061, 'Oliver', 'Bryant', 'oliver.bryant2021@university.edu', 2021, 'Computer Science', 3.77, 92, '2024-05-15', TRUE),
(1062, 'Avery', 'Nguyen', 'avery.nguyen2021@university.edu', 2021, 'Mathematics', 3.58, 85, '2024-05-15', FALSE),
(1063, 'Jackson', 'Rivera', 'jackson.rivera2021@university.edu', 2021, 'Physics', 3.44, 88, '2024-05-15', TRUE),
(1064, 'Lily', 'Cruz', 'lily.cruz2021@university.edu', 2021, 'Biology', 3.66, 91, '2024-05-15', FALSE),
(1065, 'Carter', 'Long', 'carter.long2021@university.edu', 2021, 'Chemistry', 3.25, 80, '2024-05-15', TRUE),
(1066, 'Zoe', 'Hughes', 'zoe.hughes2021@university.edu', 2021, 'English', 3.32, 82, '2024-05-15', FALSE),
(1067, 'Levi', 'Jenkins', 'levi.jenkins2021@university.edu', 2021, 'History', 3.41, 89, '2024-05-15', TRUE),
(1068, 'Nora', 'Fisher', 'nora.fisher2021@university.edu', 2021, 'Economics', 3.53, 93, '2024-05-15', FALSE),
(1069, 'Owen', 'Stevens', 'owen.stevens2021@university.edu', 2021, 'Psychology', 3.39, 86, '2024-05-15', TRUE),
(1070, 'Ella', 'Bryan', 'ella.bryan2021@university.edu', 2021, 'Computer Science', 3.85, 95, '2024-05-15', FALSE),
(1071, 'Mila', 'Spencer', 'mila.spencer2021@university.edu', 2021, 'Mathematics', 3.72, 90, '2024-05-15', TRUE),
(1072, 'Eli', 'Wheeler', 'eli.wheeler2021@university.edu', 2021, 'Physics', 3.36, 83, '2024-05-15', FALSE),
(1073, 'Layla', 'Dunn', 'layla.dunn2021@university.edu', 2021, 'Biology', 3.59, 89, '2024-05-15', TRUE),
(1074, 'Wyatt', 'Perkins', 'wyatt.perkins2021@university.edu', 2021, 'Chemistry', 3.28, 81, '2024-05-15', FALSE),
(1075, 'Sofia', 'Berry', 'sofia.berry2021@university.edu', 2021, 'English', 3.43, 87, '2024-05-15', TRUE),
(1076, 'Gabriel', 'Arnold', 'gabriel.arnold2021@university.edu', 2021, 'History', 3.47, 92, '2024-05-15', FALSE),
(1077, 'Hazel', 'Lawson', 'hazel.lawson2021@university.edu', 2021, 'Economics', 3.34, 84, '2024-05-15', TRUE),
(1078, 'Julian', 'Hansen', 'julian.hansen2021@university.edu', 2021, 'Psychology', 3.61, 90, '2024-05-15', FALSE),
(1079, 'Aurora', 'Warren', 'aurora.warren2021@university.edu', 2021, 'Computer Science', 3.69, 94, '2024-05-15', TRUE),
(1080, 'Mateo', 'Boone', 'mateo.boone2021@university.edu', 2021, 'Mathematics', 3.55, 88, '2024-05-15', FALSE),
(1081, 'Riley', 'McCoy', 'riley.mccoy2021@university.edu', 2021, 'Physics', 3.42, 87, '2024-05-15', TRUE),
(1082, 'Hannah', 'Stokes', 'hannah.stokes2021@university.edu', 2021, 'Biology', 3.63, 92, '2024-05-15', FALSE),
(1083, 'Luke', 'Gill', 'luke.gill2021@university.edu', 2021, 'Chemistry', 3.27, 82, '2024-05-15', TRUE),
(1084, 'Chloe', 'Barker', 'chloe.barker2021@university.edu', 2021, 'English', 3.35, 85, '2024-05-15', FALSE),
(1085, 'Isaac', 'Hunter', 'isaac.hunter2021@university.edu', 2021, 'History', 3.50, 90, '2024-05-15', TRUE),
(1086, 'Victoria', 'Webb', 'victoria.webb2021@university.edu', 2021, 'Economics', 3.38, 83, '2024-05-15', FALSE),
(1087, 'Anthony', 'Watts', 'anthony.watts2021@university.edu', 2021, 'Psychology', 3.45, 89, '2024-05-15', TRUE),
(1088, 'Penelope', 'Graham', 'penelope.graham2021@university.edu', 2021, 'Computer Science', 3.81, 96, '2024-05-15', FALSE),
(1089, 'Caleb', 'Ford', 'caleb.ford2021@university.edu', 2021, 'Mathematics', 3.64, 91, '2024-05-15', TRUE),
(1090, 'Luna', 'Holmes', 'luna.holmes2021@university.edu', 2021, 'Physics', 3.49, 89, '2024-05-15', FALSE),
(1091, 'Omar', 'Morrison', 'omar.morrison2021@university.edu', 2021, 'Biology', 3.60, 92, '2024-05-15', TRUE),
(1092, 'Maya', 'Cole', 'maya.cole2021@university.edu', 2021, 'Chemistry', 3.33, 84, '2024-05-15', FALSE),
(1093, 'Evan', 'Bailey', 'evan.bailey2021@university.edu', 2021, 'English', 3.41, 87, '2024-05-15', TRUE),
(1094, 'Leah', 'Foster', 'leah.foster2021@university.edu', 2021, 'History', 3.46, 90, '2024-05-15', FALSE),
(1095, 'Connor', 'Howard', 'connor.howard2021@university.edu', 2021, 'Economics', 3.35, 88, '2024-05-15', TRUE),
(1096, 'Ellie', 'Woods', 'ellie.woods2021@university.edu', 2021, 'Psychology', 3.42, 85, '2024-05-15', FALSE),
(1097, 'Leo', 'James', 'leo.james2021@university.edu', 2021, 'Computer Science', 3.74, 94, '2024-05-15', TRUE),
(1098, 'Nina', 'Hughes', 'nina.hughes2021@university.edu', 2021, 'Mathematics', 3.59, 90, '2024-05-15', FALSE),
(1099, 'Ryan', 'Perry', 'ryan.perry2021@university.edu', 2021, 'Physics', 3.46, 87, '2024-05-15', TRUE),
(1100, 'Zara', 'Fisher', 'zara.fisher2021@university.edu', 2021, 'Biology', 3.61, 91, '2024-05-15', FALSE);



-- 01
SELECT * FROM students;

--02
SELECT s.first_name, s.last_name, s.email
FROM students as s;

--03
SELECT student_id, first_name, major, gpa
FROM students
WHERE gpa > 3.5 
AND  (
    is_active = TRUE 
    AND major = 'Computer Science'
);

--04
SELECT student_id, first_name, gpa
FROM students
ORDER BY gpa DESC;

SELECT student_id, first_name, last_name, enrollment_year
FROM students
WHERE enrollment_year >= 2021
ORDER BY last_name;

--05
SELECT AVG(gpa) AS average_gpa, SUM(major = 'Biology') AS biology_count
FROM students;

--06
SELECT major, AVG(gpa) AS avg_gpa
FROM students
GROUP BY major
ORDER BY avg_gpa DESC;

SELECT enrollment_year, COUNT(*) AS students_enrolled
FROM students
GROUP BY enrollment_year
ORDER BY enrollment_year;

--07
SELECT major, AVG(gpa) as avg_gpa
FROM students
GROUP BY major
HAVING AVG(gpa) > 3.2;

SELECT enrollment_year, count(*) as students_enrolled
FROM students
GROUP BY enrollment_year
HAVING COUNT(*) > 50;

--08
SELECT student_id, last_name, credits_earned, enrollment_year
FROM students
WHERE credits_earned < 120
AND enrollment_year < 2020
AND is_active = TRUE;

SELECT student_id, last_name, gpa, major
FROM students
WHERE gpa BETWEEN 2.5 and 3.5
AND major IN ('Mathematics', 'Physics');

--09
SELECT student_id, last_name, email
FROM students
WHERE last_name LIKE 'Sm%'
OR email LIKE '%gmail.com%';

--10
SELECT student_id, last_name, graduation_date
FROM students
WHERE YEAR(graduation_date) = 2024;

SELECT student_id, last_name, enrollment_year
FROM students
WHERE (enrollment_year) <= YEAR(CURDATE()) - 4;

