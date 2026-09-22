savepoint before_hike;
update employee
set salary = salary*1.05;
rollback to before_hike;