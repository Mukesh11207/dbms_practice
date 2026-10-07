-- Write a query using GROUP BY and HAVING to list only those departments that have more than 2
-- employees. Display DNAME and the employee count.

SELECT D.DNAME,COUNT(*) AS total_employees
FROM EMPLOYEE E JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO
HAVING COUNT(*) > 2;