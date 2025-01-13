Create Table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


With Team_1 AS (
SELECT Team_1,Count(Team_1) Over (Partition By Team_1 ORder by Team_1) AS MatT1  FROM icc_world_cup Group By Team_1
),
Team_2 AS (
SELECT Team_2,Count(Team_2) Over (Partition By Team_2 ORder by Team_2) AS MATT2 FROM icc_world_cup Group By Team_2
),
Win AS (
SELECT Winner , Count(1) AS WinMat FROM icc_world_cup Group By Winner 
)

SELECT T1.Team_1 ,(T1.MatT1 + ISNULL(T2.MATT2,0)) AS Matches_Played ,ISNULL(WinMat,0)AS Matches_Win , ((T1.MatT1 + ISNULL(T2.MATT2,0)) - ISNULL(WinMat,0)) AS Matches_Lost
FROM Team_1 T1 
LEFT JOIN Team_2 T2 ON T1.Team_1 = T2.Team_2 
LEFT JOIN Win W ON T1.Team_1 = W.Winner

