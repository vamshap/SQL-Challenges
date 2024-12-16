create table students(sname varchar(50), sid varchar(50), marks int)


insert into students values('A','X',75),('A','Y',75),('A','Z',80),('B','X',90),('B','Y',91),('B','Z',75)


WITH C AS (
SELECT * , ROW_NUMBER() OVER (PARTITION BY sname ORDER BY Marks DESC ) AS M  FROM students

)

SELECT sname , sum(marks) FROM C WHERE M <=2 GROUP BY Sname