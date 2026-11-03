SELECT e.emp_id,
       e.emp_name,
       e.salary,
       e.dept_id
FROM Employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employee e2
    WHERE e2.dept_id = e.dept_id
);
Find the total number of hours worked on each project.
SELECT p.project_name,
       SUM(w.hours) AS total_hours
FROM Project p
INNER JOIN Works_On w
ON p.project_id = w.project_id
GROUP BY p.project_id, p.project_name
HAVING SUM(w.hours) > 30;

Q45. Find employees who work on a project belonging to the same department as the employee.
SELECT DISTINCT e.emp_id,
       e.emp_name
FROM Employee e
INNER JOIN Works_On w
ON e.emp_id = w.emp_id
INNER JOIN Project p
ON w.project_id = p.project_id
WHERE e.dept_id = p.dept_id;