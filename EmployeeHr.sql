CREATE TABLE swipe (
 employee_id INT,
 activity_type VARCHAR(10),
 activity_time datetime
);






INSERT INTO swipe (employee_id, activity_type, activity_time) VALUES
(1, 'login', '2024-07-23 08:00:00'),
(1, 'logout', '2024-07-23 12:00:00'),
(1, 'login', '2024-07-23 13:00:00'),
(1, 'logout', '2024-07-23 17:00:00'),
(2, 'login', '2024-07-23 09:00:00'),
(2, 'logout', '2024-07-23 11:00:00'),
(2, 'login', '2024-07-23 12:00:00'),
(2, 'logout', '2024-07-23 15:00:00'),
(1, 'login', '2024-07-24 08:30:00'),
(1, 'logout', '2024-07-24 12:30:00'),
(2, 'login', '2024-07-24 09:30:00'),
(2, 'logout', '2024-07-24 10:30:00');


With FirstLogin AS 

(

SELECT Employee_id ,Activity_type,Activity_time, case when activity_type = 'Login' THEN LEAD(Activity_time,1,activity_time) OVER (Partition by employee_id,DATEPART(dd,activity_time) Order by activity_time)
                       --  when activity_type = 'Logout' THEN LEAD(Activity_time,1,activity_time) OVER (Partition by employee_id,DATEPART(dd,activity_time) Order by activity_time)
						 END AS FirstLoginLogout
                   ,MIN(activity_time) OVER (Partition by Employee_id,DatePart(dd,Activity_time ) ORDER BY Activity_time ) AS MINTIme
 				   ,MAX(Activity_time) OVER (Partition by Employee_id,DatePart(dd,Activity_time ) ORDER BY Activity_time DESC ) AS MAXTIME
				   					 				  				  				 
FROM Swipe )

SELECT Employee_ID,Sum(DATEDIFF(hh,activity_time,FirstLoginLogout)),CAST(Activity_time AS Date),DATEDIFF(hh,MINTIme,MAXTIME) FROM FirstLogin 
GROUP BY employee_id , CAST (Activity_time AS DATE) ,DATEDIFF(hh,MINTIme,MAXTIME)













