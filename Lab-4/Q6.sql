/*Write a procedure raise_salary(IN p_emp_id INT, IN p_pct DECIMAL(5,2), OUT p_new_salary
DECIMAL(10,2)) that:
1. Increases the given employee's salary by p_pct percent in the employee table.
2. Returns the updated salary through the OUT parameter p_new_salary.
Call it using CALL raise_salary(1, 10, @newsal); SELECT @newsal; and verify the update.*/

DELIMITER //
DROP PROCEDURE IF EXISTS raise_salary;
CREATE PROCEDURE raise_salary(IN p_emp_id INT,IN p_pct DECIMAL(5,2),
OUT p_new_salary DECIMAL(10,2))
BEGIN
    UPDATE EMPLOYEE
    SET salary = salary + (salary * p_pct/100)
    WHERE emp_id = p_emp_id;

    SELECT salary
    INTO p_new_salary
    FROM EMPLOYEE
    WHERE emp_id = p_emp_id;

END//
DELIMITER ;