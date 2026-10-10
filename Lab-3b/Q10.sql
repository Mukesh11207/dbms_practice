/*Write a single query that joins DEPARTMENT and EMPLOYEE, groups by department, and uses
HAVING to list only those departments whose total salary expense (SUM(SALARY)) exceeds 100000.
Display DNAME, employee count and total salary expense, sorted by total salary expense in descending
order.
• As a final check, add department LEGAL to your mental trace and explain why it can never satisfy
the HAVING condition, regardless of which join type you used.*/

SELECT D.DNAME,COUNT(*) AS employee_count,SUM(E.SALARY) AS total_salary_expense
FROM DEPARTMENT D JOIN EMPLOYEE E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO
HAVING SUM(SALARY) > 100000
ORDER BY total_salary_expense DESC;