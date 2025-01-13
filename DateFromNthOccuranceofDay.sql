-- Nth Occurance of the Day From Date Given Date 2025-01-1 1st Sunday is 2025-01-12 3rd Sunday is 2025-01-26 


DECLARE @Date DATE = '2025-01-10';
DECLARE @N INT = 3;

WITH DAYSNEED AS (
SELECT CASE WHEN  DATEPART(DW,@Date) <> 1 THEN   8-DATEPART(DW,@Date) 
            WHEN  DATEPART(DW,@Date) = 1 THEN 7
				  END AS DaysNeedForNextSunday
 )
 
 SELECT  DATEADD(DD,DaysNeedForNextSunday+((@N-1)*7),@Date) FROM DAYSNEED
