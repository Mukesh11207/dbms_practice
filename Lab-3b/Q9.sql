/*Write a query using GROUP BY and HAVING on the result of Question 7/8 to list only
those projects whose total allotted hours exceed 30.*/
SELECT P.PROJNAME,COALESCE(SUM(W.HOURS_ALLOTTED),0) AS total_hours
FROM WORKS_ON W RIGHT JOIN PROJECT P ON W.PROJNO = P.PROJNO
GROUP BY P.PROJNO
HAVING total_hours > 30;