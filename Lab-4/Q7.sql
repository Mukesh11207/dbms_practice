/*Write a function dept_avg_marks(p_dept_id VARCHAR(10)) RETURNS DECIMAL(5,2)
DETERMINISTIC READS SQL DATA that returns the average marks of all students in the given
department. Unlike a procedure, this function must be usable directly inside a query — demonstrate
it with:
SELECT dept_id, dept_avg_marks(dept_id) AS avg_marks FROM department;*/

DELIMITER //
DROP FUNCTION IF EXISTS dept_avg_marks;
CREATE FUNCTION dept_avg_marks(p_dept_id VARCHAR(10))
RETURNS DECIMAL(5,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_avg DECIMAL(5,2);

    SELECT AVG(MARKS)
    INTO v_avg
    FROM student
    WHERE dept_id = p_dept_id;

    RETURN v_avg;
END//
DELIMITER ;