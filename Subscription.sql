CREATE TABLE subscription_history (
 customer_id INT,
 marketplace VARCHAR(10),
 event_date DATE,
 event CHAR(1),
 subscription_period INT
);

INSERT INTO subscription_history VALUES (1, 'India', '2020-01-05', 'S', 6);
INSERT INTO subscription_history VALUES (1, 'India', '2020-12-05', 'R', 1);
INSERT INTO subscription_history VALUES (1, 'India', '2021-02-05', 'C', null);
INSERT INTO subscription_history VALUES (2, 'India', '2020-02-15', 'S', 12);
INSERT INTO subscription_history VALUES (2, 'India', '2020-11-20', 'C', null);
INSERT INTO subscription_history VALUES (3, 'USA', '2019-12-01', 'S', 12);
INSERT INTO subscription_history VALUES (3, 'USA', '2020-12-01', 'R', 12);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-01-10', 'S', 6);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-09-10', 'R', 3);
INSERT INTO subscription_history VALUES (4, 'USA', '2020-12-25', 'C', null);
INSERT INTO subscription_history VALUES (5, 'UK', '2020-06-20', 'S', 12);
INSERT INTO subscription_history VALUES (5, 'UK', '2020-11-20', 'C', null);
INSERT INTO subscription_history VALUES (6, 'UK', '2020-07-05', 'S', 6);
INSERT INTO subscription_history VALUES (6, 'UK', '2021-03-05', 'R', 6);
INSERT INTO subscription_history VALUES (7, 'Canada', '2020-08-15', 'S', 12);
INSERT INTO subscription_history VALUES (8, 'Canada', '2020-09-10', 'S', 12);
INSERT INTO subscription_history VALUES (8, 'Canada', '2020-12-10', 'C', null);
INSERT INTO subscription_history VALUES (9, 'Canada', '2020-11-10', 'S', 1);

WITH Stat AS (

SELECT customer_id,marketplace,event,ROW_NUMBER() OVER ( Partition by Customer_ID,MarketPlace ORDER BY event_date DESC ) AS L FROM subscription_history WHERE 
event_date <= CAST( '2020-12-31' AS DATE )
)

SELECT count(1) FROM Stat WHERE L = 1 AND event <> 'C'



