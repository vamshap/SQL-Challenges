
create table numbers (n int);
insert into numbers values (1),(2),(3),(4),(5)
insert into numbers values (9)



WITH CTE AS (

SELECT n, 1 as num_Cn From numbers
union all 
SELECT n, num_Cn + 1 from CTE where num_Cn + 1 < = n
)

SELECT * FROM CTE ORDER BY n
