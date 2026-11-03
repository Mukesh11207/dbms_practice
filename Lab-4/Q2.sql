/*Exercise 2 - ‘CASE’ Statement
Write a procedure dept_full_name(IN p_dept_id VARCHAR(10)) that uses a CASE statement (not
IF) to print the full, friendly description of a department code — e.g. 'CSE' → 'Computer Science
and Engineering'. Include a default/ELSE branch for an unrecognized code.*/

DELIMITER //
CREATE PROCEDURE dept_full_name(IN p_dept_id VARCHAR(10))
BEGIN
    CASE p_dept_id

    WHEN 'CSE' THEN
        SELECT 'Computer Science and Engineering' AS Department;
    WHEN 'ECE' THEN
        SELECT 'Electronics and Communication Engineering' AS Department;
    WHEN 'ME' THEN
        SELECT 'MECHANICAL ENGINEERING' AS Department;
    WHEN 'CIVIL' THEN
        SELECT 'Civil Engineering' AS Department;
    ELSE
        SELECT 'UNKNOWN DEPARTMENT' AS Department;
    
    END CASE;
END//
DELIMITER;








