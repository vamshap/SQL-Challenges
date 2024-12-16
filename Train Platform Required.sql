CREATE TABLE train_arrivals (
 train_id INT,
 arrival_time DATETIME -- Correct type for storing date and time
);

CREATE TABLE train_departures (
 train_id INT,
 departure_time DATETIME -- Correct type for storing date and time
);

INSERT INTO train_arrivals (train_id, arrival_time) VALUES
(1, '2024-11-17 08:00'),
(2, '2024-11-17 08:05'),
(3, '2024-11-17 08:05'),
(4, '2024-11-17 08:10'),
(5, '2024-11-17 08:10'),
(6, '2024-11-17 12:15'),
(7, '2024-11-17 12:20'),
(8, '2024-11-17 12:25'),
(9, '2024-11-17 15:00'),
(10, '2024-11-17 15:00'),
(11, '2024-11-17 15:00'),
(12, '2024-11-17 15:06'),
(13, '2024-11-17 20:00'),
(14, '2024-11-17 20:10');

INSERT INTO train_departures (train_id, departure_time) VALUES
(1, '2024-11-17 08:15'),
(2, '2024-11-17 08:10'),
(3, '2024-11-17 08:20'),
(4, '2024-11-17 08:25'),
(5, '2024-11-17 08:20'),
(6, '2024-11-17 13:00'),
(7, '2024-11-17 12:25'),
(8, '2024-11-17 12:30'),
(9, '2024-11-17 15:05'),
(10, '2024-11-17 15:10'),
(11, '2024-11-17 15:15'),
(12, '2024-11-17 15:15'),
(13, '2024-11-17 20:15'),
(14, '2024-11-17 20:15');

WITH CTE AS (
SELECT TD.train_id,TA.arrival_time,TD.departure_time FROM train_departures TD Left Join train_arrivals TA
          ON TD.train_id = TA.train_id
),CA AS (
SELECT C.train_id AS CtrainID,C.arrival_time AS CArrivalTIme,C.departure_time AS CdepartureTIme,D.train_id AS DTrainID,D.arrival_time AS DarrivalTime
,D.departure_time AS DdepartureTIme

FROM CTE C CROSS JOIN CTE D WHERE C.train_id <> D.train_id AND

((C.departure_time BETWEEN D.arrival_time AND D.departure_time) OR (D.arrival_time) >= C.arrival_time AND D.departure_time <= C.departure_time)

)

, PLAT AS (
SELECT Count(CtrainID) AS CT FROM CA 

Group by CtrainID  

) SELECT MAX(CT) FROM PLAT












