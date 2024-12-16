
Create Table Employee (Employee_ID INT , Department_ID INT, Primary_Flag Varchar(100) )

INSERT INTO Employee (employee_id, department_id, primary_flag)
VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');



WITH C AS (SELECT Employee_ID,COUNT(1) AS CNT  FROM Employee GROUP BY Employee_ID ) ,

FLA AS (
SELECT E.Employee_ID ,E.Department_ID , CASE WHEN  C.CNT > 1 AND Primary_Flag = 'Y' THEN 'YY'
                            WHEN  C.CNT = 1 AND Primary_Flag = 'N' THEN  'YN'
							ELSE 'N' END AS FLAG

FROM Employee E Inner Join C ON E.Employee_ID = C.Employee_ID
)

SELECT * FROM FLA WHERE FLA.FLAG = 'YY' OR FLA.FLAG = 'YN'








