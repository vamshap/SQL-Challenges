
-- Identify the Total NumberofVisits By a Person,MostVisited Floor By a Person , Resources Used by a Person

CREATE TABLE Entries ( 
[name] varchar(20),
[address] varchar(20),
[email] varchar(20),
[floor] int,
[resources] varchar(10));

INSERT INTO Entries 
VALUES ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')



WITH 
NameandFloor AS (SELECT DISTINCT [Name],[Floor] FROM Entries ),

NumberofVisits AS (
SELECT name,Count(1) As NoofVisits FROM Entries Group By name
),
MostVisitFloor AS(
SELECT name,[Floor],Count([Floor]) AS MostVisitedFloor FROM Entries Group By Name,[Floor])
,Machines AS (
SELECT name , STRING_AGG([resources],',') AS Resources FROM Entries GROUP BY Name
)

SELECT NF.Name, NF.Floor,NV.NoofVisits,MVF.MostVisitedFloor,MC.Resources FROM NameandFloor NF LEFT JOIN NumberofVisits NV ON NF.name = NV.Name 
                                                            LEFT JOIN MostVisitFloor MVF ON NF.Name = MVF.name AND NF.floor = MVF.floor
															LEFT JOIN Machines MC ON NF.name = MC.name






















