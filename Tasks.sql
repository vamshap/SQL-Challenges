create table tasks (
date_value date,
state varchar(10)
);

insert into tasks values ('2019-01-01','success'),('2019-01-02','success'),('2019-01-03','success'),('2019-01-04','fail')
,('2019-01-05','fail'),('2019-01-06','success')


WITH RW AS (
SELECT * , DATEADD(DAY,-1*ROW_NUMBER() OVER (Partition by state ORDER BY date_Value),date_value) as NTILEDATE FROM tasks

)

SELECT state,MIN(date_value),MAX(Date_value),NTILEDATE FROM RW GROUP BY State,NTILEDATE