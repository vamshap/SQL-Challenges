DROP TABLE Stock

Create Table Stock ( Stock_id VARCHAR(10),[date] date, price float ) 

Insert into Stock VALUES ('A','2024-01-01',100),('A','2024-01-02',105),('A','2024-01-03',104) , ('B','2024-01-01',200) , ('B','2024-01-02',200) , ('B','2024-01-03',201)


SELECT  Stock_id,price,CASE WHEN PRICE >LAG(price,1,Null) OVER (partition by Stock_ID ORDER BY Date ) THEN 'UP'
                            WHEN PRICE < LAG(price,1,Null) OVER (partition by Stock_ID ORDER BY Date ) THEN 'DOWN'
							WHEN PRICE = LAG(price,1,Null) OVER (partition by Stock_ID ORDER BY Date )  THEN 'SAME'
							END AS LEVEL

FROM Stock