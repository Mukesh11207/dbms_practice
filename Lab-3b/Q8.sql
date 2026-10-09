/*Modify the previous query to use a RIGHT OUTER JOIN (or LEFT OUTER JOIN with table order
swapped) instead of an INNER JOIN, so that every project appears at least once. TALENT PORTAL
should now appear with a total of 0 or NULL hours — use COALESCE() or IFNULL() to display it as 0
instead of NULL.*/

SELECT P.PROJNAME AS PNAME,COALESCE(SUM(W.HOURS_ALLOTTED),0) AS total_hours
FROM WORKS_ON W RIGHT JOIN PROJECT P ON W.PROJNO = P.PROJNO
GROUP BY P.PROJNAME; 