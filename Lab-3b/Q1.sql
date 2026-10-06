-- Write a query to display DEPTNO and the number of employees in each department, using
-- COUNT(*) and GROUP BY. Order the result by employee count in descending order.

SELECT DEPTNO, COUNT(*) AS total_employees
from employee
GROUP BY DEPTNO
ORDER BY total_employees DESC;