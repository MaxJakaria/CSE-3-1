USE lab_q2_q3_university_db;

DELIMITER//

CREATE Procedure IF NOT EXISTS GetTopStudentsByDepartment (IN dept_id INT)
BEGIN

SELECT s.student_id, s.name, g.subject, g.grade
FROM
    students AS s
    JOIN departments AS d ON s.department_id = d.department_id
    JOIN grades AS g ON s.student_id = g.student_id
    WHERE d.department_id = dept_id
    AND (
      SELECT g2.subject, Max(g2.grade)
      FROM students AS s2 RIGHT JOIN grades AS g2
      ON s2.student_id = g2.student_id
      WHERE s2.department_id = department_id
      GROUP BY g2.subject
    );
 END//

DELIMITER;

CALL `GetTopStudentsByDepartment` (101);