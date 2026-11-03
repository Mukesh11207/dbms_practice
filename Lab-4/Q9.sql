/*Exercise 9 - ‘AFTER UPDATE’ Trigger (Audit Logging)
Write a trigger after_salary_update that fires after a row in employee is updated, and — only when
salary has actually changed — inserts a row into salary_audit recording emp_id, the old salary
(OLD.salary), the new salary (NEW.salary), and the current timestamp (NOW()).
Test it by calling your raise_salary procedure from Exercise 6, then SELECT * FROM salary_audit;
to confirm the change was logged automatically - this is the key trigger property: it fires on the
event, without being called explicitly*/

DELIMITER //
CREATE TRIGGER after_salary_update
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
    DROP TEMPORARY TABLE IF EXISTS salary_audit;
    CREATE TEMPORARY TABLE salary_audit(
        emp_id INT,
        old_salary INT,
        new_salary INT,
        changed_on TEXT
    );
    IF NEW.salary <> OLD.salary THEN
        INSERT INTO salary_audit VALUES (NEW.emp_id,OLD.salary,NEW.salary,NOW());
    END IF;
END//
DELIMITER ;