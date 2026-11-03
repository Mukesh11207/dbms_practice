/* Exercise 1 - ‘IF ... ELSEIF ... ELSE’ (Control Structure)
Write a stored procedure get_grade(IN p_roll INT) that looks up a student's marks from the student
table and prints their grade using IF/ELSEIF/ELSE:
● marks ≥ 90 → 'A', ≥ 75 → 'B', ≥ 50 → 'C', else → 'Fail'.
Call it for roll numbers 101 and 104 and observe the output
*/

DELIMITER //

CREATE PROCEDURE get_grade(IN p_roll INT)
BEGIN   
    DECLARE v_marks INT

    SELECT marks
    into v_marks
    from student
    where roll_no = p_roll;

    if v_marks >= 90 then
        select 'A' as grade
    ELSE IF v_marks >= 75 then
        select 'B' as grade
    ELSE IF v_marks >= 50 then
        select 'C' as grade
    ELSE   
        select 'Fail' as grade
    END IF 
END //
DELIMITER ;