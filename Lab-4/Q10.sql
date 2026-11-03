/*Write a trigger before_department_delete that fires before a row is deleted from department, and
blocks the delete (SIGNAL SQLSTATE '45000') if any student still belongs to that department — i.e., enforce a RESTRICT-style rule at the trigger level rather than relying only on the foreign key
constraint.
Test it by trying to delete 'CSE' (should be blocked, since students reference it) and then a
department with no students (should succeed).*/

DELIMITER //
DROP TRIGGER IF EXISTS before_department_delete;
CREATE TRIGGER before_department_delete
BEFORE DELETE ON DEPARTMENT
FOR EACH ROW
BEGIN
    DECLARE student_count INT;

    SELECT COUNT(*)
    INTO student_count
    FROM student
    WHERE dept_id = OLD.dept_id;

    IF student_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CANNOT DELETE DEPARTMENT';
    END IF;
END //
DELIMITER ;