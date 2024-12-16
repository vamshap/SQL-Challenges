
WITH OVERSALARY  AS (SELECT AVG(Salary) AS SALA FROM emp) ,
 
DEP AS ( 
Select DISTINCT Department_ID,AVG(Salary) OVER (Partition by Department_ID ORDER BY Department_ID ) AS AVE  From emp  

) SELECT D.Department_ID,D.AVE FROM DEP D CROSS APPLY OVERSALARY WHERE D.AVE < OVERSALARY.SALA