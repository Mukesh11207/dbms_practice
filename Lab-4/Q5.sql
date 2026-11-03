/*Exercise 5 - Cursor with a Loop
Write a procedure list_students_in_dept(IN p_dept_id VARCHAR(10)) that declares a cursorover
SELECT name, marks FROM student WHERE dept_id = p_dept_id, then uses a loop with a
CONTINUE HANDLER FOR NOT FOUND to fetch and process each row one at a time (e.g.,
insert each student's name and marks into a temporary results table), until the cursor is exhausted.
Close the cursor at the end.*/
DELIMITER //
DROP PROCEDURE IF EXISTS list_students_in_dept;
CREATE PROCEDURE list_students_in_dept(IN p_dept_id VARCHAR(10))
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE v_name VARCHAR(50);
    DECLARE v_marks INT;

    DECLARE cur CURSOR FOR
        SELECT name,marks
        FROM student
        WHERE dept_id = p_dept_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;
    
    DROP TEMPORARY TABLE IF EXISTS temp_results;
    CREATE TEMPORARY TABLE temp_results(
        student_name VARCHAR(50),
        marks INT
    );

    OPEN cur;
    read_loop : LOOP
        FETCH cur INTO v_name,v_marks;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO temp_results VALUES (v_name,v_marks);
    END LOOP;
    CLOSE cur;

    SELECT * FROM temp_results;
END//
DELIMITER ;

