/*Write a query that joins WORKS_ON and PROJECT and uses GROUP BY to display each project's
name (PNAME) along with the total hours allotted to it (SUM(HOURS_ALLOTTED)). Do NOT use
HAVING here yet — first observe that TALENT PORTAL does not appear, and explain why in your
record.*/
SELECT P.PROJNAME AS PNAME,SUM(W.HOURS_ALLOTTED) AS total_hours
FROM WORKS_ON W JOIN PROJECT P ON P.PROJNO = W.PROJNO
GROUP BY P.PROJNAME;