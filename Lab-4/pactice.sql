select dept_id,avg(e.salary) as avg_salary
from employee
group by dept_id
having avg_salary > 60000


select emp_id,emp_name,salary
from employee
where salary > (select avg(salary)
                from employee);



select emp_id,emp_name
from employee
where salary = (select MAX(salary)
                from employee);


select emp_id,emp_name
from employee
where dept_id = 10;

select emp_id
from employee
except
select emp_id
from Works_on;

create view salary_6 as 
select emp_id,emp_name
from employee
where salary > 60000;

create view cse_view as 
select emp_id,emp_name,dept_id,salary
from employee
where dept_id = 10
with check option;

drop function if exists dept_avg_salary(p_dept_id INT)
returns decimal(10,2)
deterministic
reads sql data 
begin
    declare avg_salary decimal(10,2);

    select avg(salary)
    into avg_salary
    from employee
    where dept_id = p_dept_id;

    return avg_salary;
end//


delimiter//

create procedure list_employees(IN dept_id INT)
BEGIN
    declare done INT default FALSE;
    declare v_mame varchar(50);
    declare v_salary as decimal(10,2);

    declare emp_cursor cursor for
        select emp_name,salary
        from employee
        where dept_id = p_dept_id;

    declare continue handler for not found
        set done = true;
    open emp_cursor;

    read_loop : LOOP 
    fetch emp_cursor into v_name,v_salary;
    if done then
        leave read_loop
    end IF
    select v_name as name,v_salary as result
    end LOOP
    close emp_cursor;
end//

create procedure before_salary
before insert on employee
for each row
BEGIN
    if NEW.salary < 0 then
        signal sqlstate = 45000
        set Message_text = 'salary cant be negative';
    end if;
end//
delimiter ;


select d.dept_name,count(*) as no_of_employees,avg(e.salary) as avg_salary
from employee e join department d ON
e.dept_id = d.dept_id
group by dept_id,dept_name
having avg_salary > 55000;