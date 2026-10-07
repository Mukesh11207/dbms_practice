-- Write a query using GROUP BY and HAVING to list job titles whose average salary exceeds 50000.
-- Display JOB and the average salary, sorted by average salary in descending order.

SELECT JOB,ROUND(AVG(SALARY),2) AS avg_salary
FROM EMPLOYEE
GROUP BY JOB
HAVING AVG(SALARY) > 50000
ORDER BY AVG(SALARY) DESC;