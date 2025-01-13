-- Write a Query to Find the PersonID with Name And NoofFreinds and Total Score of his Friends 



CREATE TABLE [dbo].[Friend](
	[PersonID] [float] NULL,
	[FriendID] [float] NULL
) ON [PRIMARY]
GO



Create Table dbo.Person (PersonID int, Name VARCHAR(100), Score INT )

Insert into Person VALUES (1,'Alice',88) , (2,'Bob',11) , (3,'Davis',27) , (4,'Tara',45) , (5,'John',63)

GO


SELECT * FROM dbo.Person


WITH PersonAndFreinds AS (
SELECT F.PersonID,P.Name,Count(1) AS NoofFriends FROM dbo.Friend F INNER JOIN dbo.Person P ON F.PersonID = P.PersonID Group By F.personID,P.Name

),
Friendscore AS (
SELECT F.PersonID,Sum(Score) AS Freindscore FROM dbo.Friend F LEFT JOIN dbo.Person P ON F.FriendID = P.PersonID  GROUP BY F.PersonID
)

SELECT PAF.PersonID,FRS.Freindscore FROM PersonAndFreinds PAF LEFT join Friendscore FRS ON PAF.PersonID = FRS.personID WHERE Freindscore > 100







