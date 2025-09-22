USE lab_q2_q3_university_db;
DELIMITER $$

CREATE PROCEDURE IF NOT EXISTS GetTopStudentsByDepartment(IN dept_id INT)
BEGIN
    SELECT s.student_id, s.name, g.subject, g.grade
    FROM Students s
    JOIN Departments d ON s.department_id = d.department_id
    JOIN Grades g ON s.student_id = g.student_id
    WHERE s.department_id = dept_id
      AND g.grade = (
          SELECT MAX(g2.grade)
          FROM Grades g2
          JOIN Students s2 ON g2.student_id = s2.student_id
          WHERE s2.department_id = dept_id
            AND g2.subject = g.subject
      )
    ORDER BY g.subject;
END $$

DELIMITER ;

CALL `GetTopStudentsByDepartment`(101);