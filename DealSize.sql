Create Table Deals(employee_id int,deal_size int)

Insert into Deals  VALUES (101,400000),(101,300000),(201,500000),(301,500000);


Create Table Sales_Quota(employee_id int,Quota int)

Insert into Sales_Quota VALUES (101,500000),(201,400000),(301,600000)


WITH Deal AS (

SELECT Employee_id AS EmployeeID , SUM (Deal_Size) AS DealSize FROM Deals Group by employee_id )


SELECT D.employeeid AS EmpID, CASE WHEN D.Dealsize >= SQ.Quota THEN 'Yes'
                                    ELSE 'NO'
									END AS Made_Quota

FROM Deal D INNER JOIN Sales_Quota SQ ON D.employeeid = SQ.employee_id GROUP BY D.employeeid,DealSize,SQ.Quota



