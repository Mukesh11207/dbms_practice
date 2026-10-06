-- Write a query that joins EMPLOYEE and DEPARTMENT and uses GROUP BY DNAME to display
-- each department name along with the average salary of its employees, rounded to two decimal places
-- using ROUND().

select D.DNAME,E.DEPTNO,ROUND(AVG(E.SALARY),2) AS avg_salary
FROM EMPLOYEE E JOIN DEPARTMENT D ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO;