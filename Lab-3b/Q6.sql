-- Write a query to display, for every department, the highest-paid and lowest-paid employee's salary
-- using MAX() and MIN() together with GROUP BY. Also display the difference between the two as
-- SALARY_RANGE.

SELECT DEPTNO,MAX(SALARY) AS highest_salary,MIN(SALARY) AS lowest_salary,MAX(SALARY) - MIN(SALARY) AS salary_range
FROM EMPLOYEE
GROUP BY DEPTNO;
