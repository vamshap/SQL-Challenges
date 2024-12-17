Create Table UserTransactions (product_id int,user_id int,spend float,transaction_date datetime)


INSERT INTO UserTransactions VALUES (3673,123,68.90,'07/08/2022 12:00:00'),(9623,123,274.10,'07/08/2022 12:00:00'),(1467,115,19.90,'07/08/2022 12:00:00')
,(2513,159,25.00,'07/08/2022 12:00:00'),(1452,159,74.50,'07/10/2022 12:00:00')


WITH Lat AS (
SELECT *,RANK() OVER (Partition by User_ID ORDER BY transaction_Date DESC) AS RN FROM UserTransactions
)

SELECT user_id,transaction_date,Count(1)  FROM Lat WHERE RN = 1 GROUP BY user_id,transaction_date

