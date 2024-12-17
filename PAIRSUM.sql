Create Table Measurements(measurement_id int,measurement_value float,measurement_time datetime)


insert into Measurements values (131233,1109.51,'07/10/2022 09:00:00'),(135211,1662.74,'07/10/2022 11:00:00'),(523542,1246.24,'07/10/2022 13:15:00')
,(143562,1124.50,'07/11/2022 15:00:00') , (346462,1234.14,'07/11/2022 16:45:00')


SELECT * FROM Measurements

WITH ODDEVENFLAG AS (

SELECT measurement_id,measurement_value,measurement_time,Case when measurement_id%2 = 0 then 'EVEN'
                                                                    ELSE 'ODD'  
																	END AS FLAG

FROM Measurements

) SELECT CAST(measurement_time as DATE) AS measurement_Day , SUM (CASE WHEN FLAG = 'EVEN' THEN measurement_value END) AS EVEN_SUM
,SUM (CASE WHEN FLAG = 'ODD' THEN Measurement_Value END ) AS ODD_SUM


FROM ODDEVENFLAG Group by CAST(measurement_time AS DATE)







