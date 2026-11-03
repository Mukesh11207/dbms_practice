/*Exercise 4 - ‘REPEAT’ Loop
Write a procedure count_down(IN p_start INT) that uses a REPEAT ... UNTIL loop (MySQL's
equivalent of PL/SQL's basic LOOP...EXIT WHEN, since it always runs the body at least once) to
count down from p_start to 1.*/

DELIMITER //
Drop procedure if exists count_down;
create procedure count_down(IN p_start INT)
begin
	drop table if exists countdown_result;
    create table countdown_result(
		number int);
    repeat 
		insert into countdown_result values(p_start);
        set p_start = p_start - 1;
    until p_start = 0
    end repeat;
    select * from countdown_result;
end //

delimiter ;