/*Exercise 3 - ‘WHILE’ Loop
Write a procedure print_multiplication_table(IN p_num INT) that uses a WHILE loop to print the
multiplication table of p_num from 1 to 10 (use a temporary table or SELECT statements to display
each line, since MySQL has no DBMS_OUTPUT.PUT_LINE).*/

DELIMITER //
DROP PROCEDURE IF EXISTS print_multiplication_table;
CREATE PROCEDURE print_multiplication_table(IN p_num INT)
BEGIN
    declare v_counter INT DEFAULT 1;
    declare v_output TEXT DEFAULT "";
    WHILE v_counter <= 10 DO
        SET v_output = CONCAT(v_output,p_num, ' x ',v_counter, ' = ',p_num * v_counter,'\n');
        SET v_counter = v_counter + 1;
    END WHILE;
    SELECT v_output as Result;
END//
DELIMITER ;