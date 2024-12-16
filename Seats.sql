CREATE TABLE seats (
 id INT,
 student VARCHAR(10)
);

INSERT INTO seats VALUES 
(1, 'Amit'),
(2, 'Deepa'),
(3, 'Rohit'),
(4, 'Anjali'),
(5, 'Neha'),
(6, 'Sanjay'),
(7, 'Priya');

SELECT * FROM seats

WITH SSS AS (
SELECT ID, Student , CASE WHEN ID % 2 <> 0 THEN LEAD(ID,1,NULL) OVER (ORDER BY ID )
            WHEN ID % 2 = 0  THEN LAG(ID,1,NULL) OVER ( ORDER BY ID )
			END AS SA
 FROM seats
 )

 SELECT ID,Student,CASE WHEN SA IS NOT NULL THEN SA 
                         WHEN SA IS NULL THEN ID END FROM SSS 







