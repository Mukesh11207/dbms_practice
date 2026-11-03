SELECT e.emp_id
FROM Employee e
INNER JOIN Works_On w
ON e.emp_id = w.emp_id
INNER JOIN Project p
ON w.project_id = p.project_id
WHERE p.dept_id = 10

INTERSECT

SELECT emp_id
FROM Employee
WHERE dept_id = 10;