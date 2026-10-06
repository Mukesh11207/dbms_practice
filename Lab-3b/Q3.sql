-- Write a query to display each JOB title along with the total salary expense for that job
-- (SUM(SALARY)) and the number of employees holding it (COUNT(*)), using GROUP BY JOB.

SELECT JOB,SUM(SALARY) AS total_expense,COUNT(*) AS total_employees
FROM EMPLOYEE
GROUP BY JOB;