﻿CREATE DATABASE PROJECTTESTS
DROP DATABASE PROJECTTESTS

CREATE DATABASE PROJECTTEST5


CREATE PROCEDURE createAllTables
AS
BEGIN
DECLARE @USER_TABLE varchar(max)=''
DECLARE @SYSTEMADMIN_TABLE varchar(max)=''
DECLARE @Sports_Association_Manager_TABLE varchar(max)=''


DECLARE @MANAGER_TABLE varchar(max)=''
DECLARE @MANAGER_REFERENCE_STADIUM varchar(max)=''
DECLARE @Stadiums_TABLE varchar(max)=''

DECLARE @REPRESENTIVE_TABLE varchar(max)=''
DECLARE @CLUBS_TABLE varchar(max)=''
DECLARE @REPRESENTIVE_REFERENCE varchar(max)=''


DECLARE @Matches_TABLE varchar(max)=''
DECLARE @FANS_TABLE varchar(max)=''
DECLARE @TICKETS_TABLE varchar(max)=''

DECLARE @REQUESTS_TABLE varchar(max)=''

SET @USER_TABLE = 
'CREATE TABLE USERS
(
	USERNAME varchar(20) PRIMARY KEY,
	PASSWORD varchar(20)
);'
EXEC (@USER_TABLE)

SET @SYSTEMADMIN_TABLE = 
'CREATE TABLE SYSTEMADMIN 
(
	ID INT IDENTITY PRIMARY KEY,
	USERNAME varchar(20),
	NAME varchar(20),
	CONSTRAINT FK_username_SYSTEMADMIN FOREIGN KEY (USERNAME) REFERENCES users ON UPDATE CASCADE
);'
EXEC (@SYSTEMADMIN_TABLE)

SET @Sports_Association_Manager_TABLE = 
'CREATE TABLE Sports_Association_Manager
(
	ID INT IDENTITY PRIMARY KEY,
	USERNAME varchar(20),
	NAME varchar(20),
	CONSTRAINT FK_username_ASS_MANAGER FOREIGN KEY (USERNAME) REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE
);'
EXEC (@Sports_Association_Manager_TABLE)

SET @MANAGER_TABLE = 
'CREATE TABLE Manager
(
	ID INT IDENTITY PRIMARY KEY,
	STADIUM_ID INT,
	USERNAME varchar(20),
	NAME varchar(20),
	CONSTRAINT FK_username_MANAGER FOREIGN KEY (USERNAME) REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE
);'
EXEC (@MANAGER_TABLE)

SET @Stadiums_TABLE = 
'CREATE TABLE STADIUM
(
	ID INT IDENTITY PRIMARY KEY,
	MANAGER_ID INT,
	NAME varchar(20),
	CAPACITY INT,
	LOCATION varchar(20),
	STATUS BIT,
	CONSTRAINT FK_manager_STADIUM FOREIGN KEY (MANAGER_ID) REFERENCES MANAGER(ID)
);'
EXEC (@STADIUMS_TABLE)

SET @MANAGER_REFERENCE_STADIUM = 
'ALTER TABLE MANAGER
ADD CONSTRAINT FK_STADIUM_MANAGER FOREIGN KEY (STADIUM_ID) REFERENCES STADIUM(ID) ON DELETE CASCADE;'
EXEC (@MANAGER_REFERENCE_STADIUM);

SET @REPRESENTIVE_TABLE = 
'CREATE TABLE CLUB_Representive 
(
	ID INT IDENTITY PRIMARY KEY,
	CLUB_ID INT,
	NAME varchar(20),
	USERNAME varchar(20),
	CONSTRAINT FK_username_REPRE FOREIGN KEY (USERNAME) REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE
);'

EXEC (@REPRESENTIVE_TABLE)

SET @CLUBS_TABLE = 
'
CREATE TABLE Clubs
(
	ID INT IDENTITY PRIMARY KEY,
	RepresentiveID INT ,
	LOCATION varchar(20),
	NAME varchar(20),
	CONSTRAINT FK_Representive_CLUBS FOREIGN KEY (RepresentiveID) REFERENCES CLUB_Representive
);'
 
EXEC (@CLUBS_TABLE)

SET @REPRESENTIVE_REFERENCE = 
'ALTER TABLE CLUB_Representive
ADD CONSTRAINT FK_CLUB FOREIGN KEY (CLUB_ID) REFERENCES Clubs(ID) ON DELETE CASCADE;'

EXEC (@REPRESENTIVE_REFERENCE)

SET @Matches_TABLE =
'CREATE TABLE MATCHES
(
	ID INT IDENTITY PRIMARY KEY,
	StadiumId INT ,
	HOST_CLUB_ID INT ,
	CLUB_2_ID INT ,
	starting_time DATETIME,
	ending_time DATETIME,
	CONSTRAINT FK_STADIUM_MATCHES FOREIGN KEY (StadiumId) REFERENCES STADIUM ON DELETE CASCADE,
	CONSTRAINT FK_CLUB_1_ID FOREIGN KEY (HOST_CLUB_ID) REFERENCES CLUBS ON DELETE CASCADE,
	CONSTRAINT FK_CLUB_2_ID FOREIGN KEY (CLUB_2_ID) REFERENCES CLUBS
);'

EXEC (@Matches_TABLE)

SET @FANS_TABLE = 
'CREATE TABLE FANS
(
	NATIONAL_ID INT PRIMARY KEY,
	USERNAME varchar(20),
	NAME varchar(20),
	BIRTHDATE DATE,
	age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(BIRTHDATE)),
	ADDRESS varchar(20),
	PHONE INT,
	STATUS BIT
	CONSTRAINT FK_username_FANS FOREIGN KEY (USERNAME) REFERENCES users ON UPDATE CASCADE ON DELETE CASCADE
);'

EXEC (@FANS_TABLE)

--TICKETS TABLE
SET @TICKETS_TABLE = 
'CREATE TABLE TICKET
(
	ID INT IDENTITY PRIMARY KEY,
	STATUS BIT,
	MATCH_ID INT ,
	FAN_ID INT,
	CONSTRAINT FK_MATCH_TICKETS FOREIGN KEY (MATCH_ID) REFERENCES MATCHES(ID) ON DELETE CASCADE,
	CONSTRAINT FK_FAN_ID FOREIGN KEY (FAN_ID) REFERENCES FANS
);'

EXEC (@TICKETS_TABLE)

SET @REQUESTS_TABLE = 
'CREATE TABLE REQUESTS
(
	ID INT IDENTITY PRIMARY KEY,
	CLUB_REPRESENTIVE_ID INT,
	STADIUM_MANAGER_ID INT,
	MATCH_ID INT,
	STATUS BIT,
	CONSTRAINT FK_REPRESENTIVE_REQUESTS FOREIGN KEY (CLUB_REPRESENTIVE_ID) REFERENCES CLUB_Representive,
	CONSTRAINT FK_MANAGER_REQUESTS FOREIGN KEY (STADIUM_MANAGER_ID) REFERENCES MANAGER,
	CONSTRAINT FK_MATCH_REQUESTS FOREIGN KEY (MATCH_ID) REFERENCES MATCHES(ID) ON DELETE CASCADE
);'
 
EXEC (@REQUESTS_TABLE)
END

--DROP ALL TABLES
CREATE PROC dropAllTables
AS
BEGIN

ALTER TABLE SYSTEMADMIN
DROP CONSTRAINT FK_username_SYSTEMADMIN;-- REMOVE SYSTEM ADMIN FOREIGN KEY

ALTER TABLE Sports_Association_Manager
DROP CONSTRAINT FK_username_ASS_MANAGER;

ALTER TABLE Manager
DROP CONSTRAINT FK_username_MANAGER;

ALTER TABLE STADIUM
DROP CONSTRAINT FK_manager_STADIUM;

ALTER TABLE MANAGER
DROP CONSTRAINT FK_STADIUM_MANAGER;

ALTER TABLE CLUB_Representive
DROP CONSTRAINT FK_username_REPRE;


ALTER TABLE CLUBS
DROP CONSTRAINT FK_Representive_CLUBS;

ALTER TABLE CLUB_Representive
DROP CONSTRAINT FK_CLUB;

ALTER TABLE MATCHES
DROP CONSTRAINT FK_STADIUM_MATCHES;

ALTER TABLE MATCHES
DROP CONSTRAINT FK_CLUB_1_ID;

ALTER TABLE MATCHES
DROP CONSTRAINT FK_CLUB_2_ID;

ALTER TABLE FANS
DROP CONSTRAINT FK_username_FANS;


ALTER TABLE TICKET
DROP CONSTRAINT FK_MATCH_TICKETS;

ALTER TABLE TICKET
DROP CONSTRAINT FK_FAN_ID;


DROP TABLE IF EXISTS REQUESTS
DROP TABLE IF EXISTS TICKET
DROP TABLE IF EXISTS FANS
DROP TABLE IF EXISTS MATCHES
DROP TABLE IF EXISTS CLUBS
DROP TABLE IF EXISTS USERS
DROP TABLE IF EXISTS SYSTEMADMIN
DROP TABLE IF EXISTS CLUB_Representive
DROP TABLE IF EXISTS Sports_Association_Manager
DROP TABLE IF EXISTS MANAGER
DROP TABLE IF EXISTS STADIUM
END

--clearAllTables
CREATE PROC clearAllTables
AS
BEGIN
EXEC dropAllTables
EXEC createAllTables
END

--allAssocManagers
CREATE VIEW allAssocManagers AS
SELECT USERNAME AS 'USERNAME',NAME AS'NAME' FROM Sports_Association_Manager

--allClubRepresentatives
CREATE VIEW allClubRepresentatives AS
SELECT R.USERNAME AS 'USERNAME',R.NAME AS 'NAME',C.NAME AS 'CLUB NAME' FROM CLUB_Representive R,Clubs C
WHERE C.ID = R.CLUB_ID

--allStadiumManagers
CREATE VIEW allStadiumManagers AS
SELECT M.USERNAME AS 'USER NAME',M.NAME 'NAME',S.NAME AS 'STADIUM NAME' FROM MANAGER M,STADIUM S
WHERE M.STADIUM_ID = S.ID

--allFans
CREATE VIEW allFans AS 
SELECT F.NAME AS 'NAME',F.NATIONAL_ID AS 'NATIONAL ID',F.BIRTHDATE AS 'BIRTH DATE',F.STATUS AS 'STATUS' FROM FANS F

--allMatches
CREATE VIEW allMatches AS
SELECT C1.NAME AS 'FIRST CLUB NAME' ,C2.NAME AS 'SECOND CLUB NAME',C3.NAME AS 'HOST',M.starting_time FROM MATCHES M,Clubs C1,Clubs C2,Clubs C3
WHERE C1.ID = M.HOST_CLUB_ID AND C2.ID = M.CLUB_2_ID AND C3.ID = M.HOST_CLUB_ID

--allTickets
CREATE VIEW allTickets AS
SELECT C1.NAME AS 'FIRST CLUB NAME' ,C2.NAME AS 'SECOND CLUB NAME',S.NAME AS 'STADIUM NAME',M.starting_time AS 'STARTING TIME'
FROM TICKET T,MATCHES M,CLUBS C1,CLUBS C2,STADIUM S,REQUESTS R
WHERE T.MATCH_ID = M.ID AND C1.ID = M.HOST_CLUB_ID AND C2.ID = M.CLUB_2_ID AND R.MATCH_ID = M.ID AND R.STADIUM_MANAGER_ID = S.MANAGER_ID

--allCLubs
CREATE VIEW allCLubs AS
SELECT C.NAME AS 'CLUB NAME',C.LOCATION AS 'CLUB LOCATION' FROM CLUBS C

--allStadiums
CREATE VIEW allStadiums AS 
SELECT S.NAME AS 'STADIUM NAME',S.LOCATION AS 'STADIUM LOCATION',S.CAPACITY AS 'STADIUM CAPACITY',S.STATUS AS 'STADIUM STATUS'
FROM STADIUM S

--allRequests
CREATE VIEW allRequests AS
SELECT R.CLUB_REPRESENTIVE_ID AS 'CLUB REPRESENTIVE',M.NAME AS 'STADIUM MANAGER NAME',R.STATUS AS 'REQUEST STATUS'
FROM REQUESTS R,Manager M
WHERE R.STADIUM_MANAGER_ID = M.ID

--addAssociationManager
CREATE PROC addAssociationManager
@NAME VARCHAR(20),
@USERNAME VARCHAR(20),
@PASSWORD VARCHAR(20)
AS
INSERT INTO USERS (USERNAME,PASSWORD)VALUES(@USERNAME,@PASSWORD)
INSERT INTO Sports_Association_Manager(USERNAME,NAME) VALUES(@USERNAME , @NAME)

--ADDNEWMATCH
CREATE PROC addNewMatch
@FIRST_CLUB_NAME VARCHAR(20),
@SECOND_CLUB_NAME VARCHAR(20),
@HOST_CLUB_NAME VARCHAR(20),
@DATE_TIME DATETIME
AS
DECLARE @FIRST_CLUB_ID INT
DECLARE @SECOND_CLUB_ID INT
DECLARE @HOST_CLUB_ID INT
DECLARE @HOST_REP_CLUB_ID INT
DECLARE @MATCH_ID INT

SELECT @FIRST_CLUB_ID = C.ID FROM Clubs C WHERE C.NAME = @FIRST_CLUB_NAME
SELECT @SECOND_CLUB_ID = C1.ID FROM Clubs C1 WHERE C1.NAME = @SECOND_CLUB_NAME
SELECT @HOST_CLUB_ID = C2.ID, @HOST_REP_CLUB_ID = C2.RepresentiveID FROM Clubs C2 WHERE C2.NAME = @HOST_CLUB_NAME


IF(@HOST_CLUB_ID = @FIRST_CLUB_ID)
BEGIN
INSERT INTO MATCHES(HOST_CLUB_ID,CLUB_2_ID,starting_time) VALUES(@HOST_CLUB_ID,@SECOND_CLUB_ID,@DATE_TIME)
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOST_CLUB_ID AND CLUB_2_ID = @SECOND_CLUB_ID
INSERT INTO REQUESTS(CLUB_REPRESENTIVE_ID,MATCH_ID) VALUES(@HOST_REP_CLUB_ID,@MATCH_ID)
END
ELSE
BEGIN
INSERT INTO MATCHES(HOST_CLUB_ID,CLUB_2_ID,starting_time) VALUES(@HOST_CLUB_ID,@FIRST_CLUB_ID,@DATE_TIME)
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOST_CLUB_ID AND CLUB_2_ID = @FIRST_CLUB_ID
INSERT INTO REQUESTS(CLUB_REPRESENTIVE_ID,MATCH_ID) VALUES(@HOST_REP_CLUB_ID,@MATCH_ID)
END

--DELETEMATCH
CREATE PROC deleteMatch 
@FIRST_CLUB_NAME VARCHAR(20),
@SECOND_CLUB_NAME VARCHAR(20),
@HOST_CLUB_NAME VARCHAR(20)
AS
BEGIN
DECLARE @FIRST_CLUB_ID INT
DECLARE @SECOND_CLUB_ID INT
DECLARE @HOST_CLUB_ID INT
DECLARE @HOST_REP_CLUB_ID INT
DECLARE @STADIUM_ID INT
DECLARE @STADIUM_MANAGER_ID INT

SELECT @FIRST_CLUB_ID = ID FROM Clubs WHERE NAME = @FIRST_CLUB_NAME
SELECT @SECOND_CLUB_ID = ID FROM Clubs WHERE NAME = @SECOND_CLUB_NAME
SELECT @HOST_CLUB_ID = ID FROM CLUBS WHERE NAME = @HOST_CLUB_NAME

IF(@HOST_CLUB_ID = @FIRST_CLUB_ID)
BEGIN
DELETE FROM MATCHES WHERE (HOST_CLUB_ID = @HOST_CLUB_ID AND CLUB_2_ID = @SECOND_CLUB_ID)
END
ELSE
BEGIN
DELETE FROM MATCHES WHERE (HOST_CLUB_ID = @HOST_CLUB_ID AND CLUB_2_ID = @FIRST_CLUB_ID)
END
END

--clubsWithNoMatches
CREATE VIEW clubsWithNoMatches AS
SELECT C.NAME AS 'NAME' FROM Clubs C
LEFT OUTER JOIN MATCHES M ON (C.ID = M.HOST_CLUB_ID OR M.CLUB_2_ID = C.ID)
WHERE M.ID IS NULL

--deleteMatchesOnStadium
CREATE PROC deleteMatchesOnStadium
@STADIUM_NAME VARCHAR(20)
AS
DECLARE @STADIUM_ID INT
SELECT @STADIUM_ID = ID FROM STADIUM WHERE NAME = @STADIUM_NAME
DELETE FROM MATCHES WHERE StadiumId = @STADIUM_ID AND starting_time > GETDATE();

--addClub
CREATE PROC addClub
@CLUB_NAME varchar(20),
@LOCATION varchar(20)
AS
INSERT INTO CLUBS(NAME,LOCATION) VALUES(@CLUB_NAME,@LOCATION)


--addTicket
CREATE PROC addTicket
@HOST_CLUB varchar(20),
@COMPETING_CLUB varchar(20),
@STARTING_TIME DATETIME
AS
DECLARE @MATCH_ID INT
DECLARE @HOSTCLUB_ID INT

SELECT @HOSTCLUB_ID = ID FROM CLUBS WHERE NAME = @HOST_CLUB

SELECT @MATCH_ID = ID FROM MATCHES 
WHERE @HOSTCLUB_ID = HOST_CLUB_ID AND CLUB_2_ID = @COMPETING_CLUB
INSERT INTO TICKET(MATCH_ID) VALUES(@MATCH_ID)

--deleteClub
CREATE PROC deleteClub
@CLUB_NAME varCHAR(20)
AS
BEGIN
DELETE FROM CLUBS WHERE NAME = @CLUB_NAME
END

--addStadium
CREATE PROC addStadium
@STADIUM_NAME VARCHAR(20),
@LOCATION VARCHAR(20),
@CAPACITY INT
AS
BEGIN
INSERT INTO STADIUM (NAME,LOCATION,CAPACITY) VALUES (@STADIUM_NAME,@LOCATION,@CAPACITY)
END

--deleteStadium
CREATE PROC deleteStadium
@STADIUM_NAME VARCHAR(20)
AS
BEGIN
DELETE FROM STADIUM WHERE NAME = @STADIUM_NAME
END

--blockFan
CREATE PROC blockFan
@NATIONAL_ID BIGINT
AS
BEGIN
UPDATE FANS
SET STATUS = 1 WHERE NATIONAL_ID = @NATIONAL_ID
END

--unblockFan
CREATE PROC unblockFan
@NATIONAL_ID BIGINT
AS
BEGIN
UPDATE FANS
SET STATUS = 0 WHERE NATIONAL_ID = @NATIONAL_ID
END

--addRepresentative
CREATE PROC addRepresentative
@NAME VARCHAR(20),
@USERNAME VARCHAR(20),
@PASSWORD VARCHAR(20),
@CLUB_NAME VARCHAR(20)
AS
BEGIN
DECLARE @CLUB_ID INT
SELECT @CLUB_ID = ID FROM Clubs WHERE NAME = @CLUB_NAME

INSERT INTO USERS (USERNAME,PASSWORD)VALUES(@USERNAME,@PASSWORD)
INSERT INTO CLUB_Representive(CLUB_ID,NAME,USERNAME) VALUES(@CLUB_ID,@NAME,@USERNAME)

DECLARE @REP_ID INT
SELECT @REP_ID = ID FROM CLUB_Representive WHERE USERNAME = @USERNAME

UPDATE Clubs
SET RepresentiveID = @REP_ID WHERE ID = @CLUB_ID
END

--viewAvailableStadiumsOn
CREATE FUNCTION viewAvailableStadiumsOn
(@DATETIME DATETIME)
RETURNS @RETURN TABLE (NAME VARCHAR(20),location VARCHAR(20),capacity INT)
AS
BEGIN

DECLARE @TempTable table
(
	NAME VARCHAR(20),
	location VARCHAR(20),
	capacity INT
)
INSERT INTO @TempTable
SELECT S.NAME,S.LOCATION,S.CAPACITY FROM STADIUM S
LEFT OUTER JOIN MATCHES M ON S.ID = M.StadiumId
WHERE (M.StadiumId IS NULL OR M.starting_time <> @DATETIME) AND S.STATUS = 1

INSERT INTO @RETURN(NAME,location,capacity)
SELECT NAME,LOCATION,CAPACITY FROM @TempTable
RETURN 
END

--addHostRequest
CREATE PROC addHostRequest
@CLUBNAME VARCHAR(20),
@STADIUM_NAME VARCHAR(20),
@DATETIME DATETIME
AS
BEGIN
DECLARE @HOST_ID INT
DECLARE @CLUB_REPRESENTIVE_ID INT
DECLARE @STADIUM_MANAGER_ID INT
DECLARE @MATCH_ID INT

SELECT @CLUB_REPRESENTIVE_ID = RepresentiveID,@HOST_ID = ID FROM Clubs WHERE @CLUBNAME = NAME
SELECT @STADIUM_MANAGER_ID = MANAGER_ID FROM STADIUM WHERE @STADIUM_NAME = NAME
SELECT @MATCH_ID = ID FROM MATCHES WHERE @DATETIME = starting_time AND HOST_CLUB_ID = @HOST_ID

INSERT INTO REQUESTS(CLUB_REPRESENTIVE_ID,STADIUM_MANAGER_ID,MATCH_ID) VALUES(@CLUB_REPRESENTIVE_ID,@STADIUM_MANAGER_ID,@MATCH_ID)
END

--allUnassignedMatches
CREATE FUNCTION allUnassignedMatches
(@HOST_CLUB_NAME VARCHAR(20))
RETURNS @RETURN TABLE (COMPETING_CLUB_NAME VARCHAR(20),STARTING_TIME DATETIME)
AS
BEGIN

DECLARE @TempTable table
(
	COMPETING_CLUB_NAME VARCHAR(20),
	STARTING_TIME DATETIME
)

INSERT INTO @TempTable
SELECT C2.NAME,M.starting_time FROM MATCHES M
INNER JOIN Clubs C ON C.ID = M.HOST_CLUB_ID
INNER JOIN Clubs C2 ON C2.ID = M.CLUB_2_ID
INNER JOIN REQUESTS R ON R.MATCH_ID = M.ID
WHERE (R.STADIUM_MANAGER_ID IS NULL AND C.NAME = @HOST_CLUB_NAME)

INSERT INTO @RETURN(COMPETING_CLUB_NAME,STARTING_TIME)
SELECT COMPETING_CLUB_NAME,STARTING_TIME FROM @TempTable
RETURN 
END

--addStadiumManager
CREATE PROC addStadiumManager
@NAME VARCHAR(20),
@STADIUM_NAME VARCHAR(20),
@USERNAME VARCHAR(20),
@PASSWORD VARCHAR(20)
AS 
BEGIN
DECLARE @STADIUM_ID INT
DECLARE @MANAGER_ID INT
SELECT @STADIUM_ID = ID FROM STADIUM WHERE NAME = @STADIUM_NAME
INSERT INTO USERS VALUES(@USERNAME,@PASSWORD)
INSERT INTO Manager(NAME,USERNAME,STADIUM_ID) VALUES(@NAME,@USERNAME,@STADIUM_ID)
SELECT @MANAGER_ID = ID FROM Manager WHERE USERNAME = @USERNAME
UPDATE STADIUM
SET MANAGER_ID = @MANAGER_ID WHERE NAME = @STADIUM_NAME
END

--allPendingRequests
CREATE FUNCTION allPendingRequests
(@STADIUM_MANAGER_NAME VARCHAR(20))
RETURNS @RETURN TABLE (HOST_CLUB VARCHAR(20),COMPETING_CLUB VARCHAR(20),STARTING_TIME DATETIME)
AS
BEGIN

DECLARE @TempTable table
(
	HOST_CLUB VARCHAR(20),
	COMPETING_CLUB VARCHAR(20),
	STARTING_TIME DATETIME
)

INSERT INTO @TempTable
SELECT C.NAME,C1.NAME,M.starting_time FROM MATCHES M
INNER JOIN Clubs C ON C.ID = M.HOST_CLUB_ID
INNER JOIN Clubs C1 ON C1.ID = M.CLUB_2_ID
INNER JOIN REQUESTS R ON R.CLUB_REPRESENTIVE_ID = C.RepresentiveID
INNER JOIN Manager MAN ON MAN.ID = R.STADIUM_MANAGER_ID
WHERE (MAN.NAME = @STADIUM_MANAGER_NAME AND R.STATUS IS NULL)

INSERT INTO @RETURN(HOST_CLUB,COMPETING_CLUB,STARTING_TIME)
SELECT HOST_CLUB,COMPETING_CLUB,STARTING_TIME FROM @TempTable
RETURN 
END

--acceptRequest
CREATE PROC acceptRequest
@STADIUM_MANAGER_NAME VARCHAR(20),
@HOST_NAME VARCHAR(20),
@COMPETING_CLUB_NAME VARCHAR(20),
@DATETIME DATETIME
AS
BEGIN
DECLARE @STADIUM_MANAGER_ID INT
DECLARE @HOSTING_CLUB_ID INT
DECLARE @COMPETING_CLUB_ID INT
DECLARE @MATCH_ID INT

SELECT @STADIUM_MANAGER_ID = ID FROM Manager WHERE NAME = @STADIUM_MANAGER_NAME
SELECT @HOSTING_CLUB_ID = ID FROM CLUBS WHERE NAME = @HOST_NAME
SELECT @COMPETING_CLUB_ID = ID FROM CLUBS WHERE NAME = @COMPETING_CLUB_NAME
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOSTING_CLUB_ID AND CLUB_2_ID = @COMPETING_CLUB_ID AND starting_time = @DATETIME

UPDATE REQUESTS
SET STATUS = 1 WHERE MATCH_ID = @MATCH_ID AND STADIUM_MANAGER_ID = @STADIUM_MANAGER_ID

END

--rejectRequest
CREATE PROC rejectRequest
@STADIUM_MANAGER_NAME VARCHAR(20),
@HOST_NAME VARCHAR(20),
@COMPETING_CLUB_NAME VARCHAR(20),
@DATETIME DATETIME
AS
BEGIN
DECLARE @STADIUM_MANAGER_ID INT
DECLARE @HOSTING_CLUB_ID INT
DECLARE @COMPETING_CLUB_ID INT
DECLARE @MATCH_ID INT

SELECT @STADIUM_MANAGER_ID = ID FROM Manager WHERE NAME = @STADIUM_MANAGER_NAME
SELECT @HOSTING_CLUB_ID = ID FROM CLUBS WHERE NAME = @HOST_NAME
SELECT @COMPETING_CLUB_ID = ID FROM CLUBS WHERE NAME = @COMPETING_CLUB_NAME
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOSTING_CLUB_ID AND CLUB_2_ID = @COMPETING_CLUB_ID AND starting_time = @DATETIME

UPDATE REQUESTS
SET STATUS = 0 WHERE MATCH_ID = @MATCH_ID AND STADIUM_MANAGER_ID = @STADIUM_MANAGER_ID

END

--addFan
CREATE PROC addFan
@NAME VARCHAR(20),
@NATIONAL_ID_NUMBER VARCHAR(20),
@BIRTHDATE DATETIME,
@ADDRESS VARCHAR(20),
@PHONE_NUMBER INT
AS
BEGIN
INSERT INTO FANS(NATIONAL_ID,NAME,BIRTHDATE,ADDRESS,PHONE,STATUS) VALUES (@NATIONAL_ID_NUMBER,@NAME,@BIRTHDATE,@ADDRESS,@PHONE_NUMBER,0)
END

--upcomingMatchesOfClub
CREATE FUNCTION upcomingMatchesOfClub
(@CLUB_NAME VARCHAR(20))
RETURNS @RETURN TABLE (CLUB_NAME VARCHAR(20),COMPETING_CLUB VARCHAR(20),STARTING_TIME DATETIME,STADIUM VARCHAR(20))
AS
BEGIN

DECLARE @TempTable table
(
	CLUB_NAME VARCHAR(20),
	COMPETING_CLUB VARCHAR(20),
	STARTING_TIME DATETIME,
	STADIUM VARCHAR(20)
)

INSERT INTO @TempTable
SELECT C.NAME,C2.NAME,M.starting_time,S.NAME FROM MATCHES M
INNER JOIN CLUBS C ON C.ID = M.HOST_CLUB_ID OR C.ID = M.CLUB_2_ID
INNER JOIN CLUBS C2 ON C2.ID = M.HOST_CLUB_ID OR C2.ID = M.CLUB_2_ID
INNER JOIN CLUBS C3 ON C3.ID = M.HOST_CLUB_ID
INNER JOIN REQUESTS R ON R.CLUB_REPRESENTIVE_ID = C3.RepresentiveID
INNER JOIN Manager MAN ON MAN.ID = R.STADIUM_MANAGER_ID
INNER JOIN STADIUM S ON S.ID = MAN.STADIUM_ID
WHERE C.NAME = @CLUB_NAME

INSERT INTO @RETURN(CLUB_NAME,COMPETING_CLUB,STARTING_TIME,STADIUM)
SELECT * FROM @TempTable
RETURN 
END

--availableMatchesToAttend
CREATE FUNCTION availableMatchesToAttend
(@DATETIME DATETIME)
RETURNS @RETURN TABLE (HOST_CLUB VARCHAR(20),COMPETING_CLUB VARCHAR(20),STARTING_TIME DATETIME,STADIUM VARCHAR(20))
AS
BEGIN

DECLARE @TempTable table
(
	CLUB_NAME VARCHAR(20),
	COMPETING_CLUB VARCHAR(20),
	STARTING_TIME DATETIME,
	STADIUM VARCHAR(20)
)

INSERT INTO @TempTable
SELECT C.NAME,C2.NAME,M.starting_time,S.NAME FROM MATCHES M
INNER JOIN CLUBS C ON C.ID = M.HOST_CLUB_ID 
INNER JOIN CLUBS C2 ON C2.ID = M.CLUB_2_ID
INNER JOIN REQUESTS R ON R.CLUB_REPRESENTIVE_ID = C.RepresentiveID
INNER JOIN Manager MAN ON MAN.ID = R.STADIUM_MANAGER_ID
INNER JOIN STADIUM S ON S.ID = MAN.STADIUM_ID
INNER JOIN TICKET T ON T.MATCH_ID = M.ID
WHERE M.starting_time > @DATETIME AND T.STATUS = 0

INSERT INTO @RETURN(HOST_CLUB,COMPETING_CLUB,STARTING_TIME,STADIUM)
SELECT * FROM @TempTable
RETURN 
END

--purchaseTicket
CREATE PROC purchaseTicket
@NATIONAL_ID INT,
@HOST_CLUB_NAME VARCHAR(20),
@COMPETING_CLUB_NAME VARCHAR(20),
@DATETIME DATETIME
AS
BEGIN
DECLARE @MATCH_ID INT
DECLARE @HOST_ID INT
DECLARE @COMPETING_CLUB_ID INT

SELECT @HOST_ID = ID FROM CLUBS WHERE NAME = @HOST_CLUB_NAME
SELECT @COMPETING_CLUB_ID = ID FROM CLUBS WHERE NAME = @COMPETING_CLUB_NAME
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOST_ID AND CLUB_2_ID = @COMPETING_CLUB_ID AND starting_time = @DATETIME

UPDATE TOP (1) TICKET 
SET FAN_ID = @NATIONAL_ID WHERE MATCH_ID = @MATCH_ID
END

--updateMatchHost
CREATE PROC updateMatchHost
@HOST_CLUB_NAME VARCHAR(20),
@COMPETING_CLUB_NAME VARCHAR(20),
@DATETIME DATETIME
AS
BEGIN
DECLARE @MATCH_ID INT
DECLARE @HOST_ID INT
DECLARE @COMPETING_CLUB_ID INT
DECLARE @REQUEST_ID INT
DECLARE @COMPETING_CLUB_REP_ID INT

SELECT @HOST_ID = ID FROM CLUBS WHERE NAME = @HOST_CLUB_NAME
SELECT @COMPETING_CLUB_ID = ID,@COMPETING_CLUB_REP_ID = RepresentiveID FROM CLUBS WHERE NAME = @COMPETING_CLUB_NAME
SELECT @MATCH_ID = ID FROM MATCHES WHERE HOST_CLUB_ID = @HOST_ID AND CLUB_2_ID = @COMPETING_CLUB_ID AND starting_time = @DATETIME

UPDATE REQUESTS
SET CLUB_REPRESENTIVE_ID = @COMPETING_CLUB_REP_ID WHERE MATCH_ID = @MATCH_ID

UPDATE MATCHES
SET HOST_CLUB_ID = @COMPETING_CLUB_ID WHERE @MATCH_ID = ID

UPDATE MATCHES
SET CLUB_2_ID = @HOST_ID WHERE @MATCH_ID = ID

END

--INSERTINTO
CREATE PROC INSERTINTO
AS
BEGIN
--USERS
INSERT INTO USERS VALUES('YOUSSEF','123456')
INSERT INTO USERS VALUES('MOHAMED','123456')
INSERT INTO USERS VALUES('MAHMOUD','123456')
INSERT INTO USERS VALUES('HUSSEIN','123456')
INSERT INTO USERS VALUES('HATHOUT','123456')
INSERT INTO USERS VALUES('EMERAH','123456')

--SYSTEMADMIN
INSERT INTO SYSTEMADMIN VALUES('YOUSSEF','YOUSSEF')

--Sports_Association_Manager		
INSERT INTO Sports_Association_Manager VALUES('MOHAMED','MOHAMED')
INSERT INTO Sports_Association_Manager VALUES('MAHMOUD','MAHMOUD')

--STADIUM
EXEC addStadium 'CAMP','BARCELONA','90000'
EXEC addStadium 'SANTIAGO','MADRID','80000'
EXEC addStadium 'ALLIANZ ARENA','BAYERN','70000'

--MANAGER
EXEC addStadiumManager  'AHMED','CAMP','AHMED','123456'
EXEC addStadiumManager  'RONALDO','SANTIAGO','RONALDO','123456'
EXEC addStadiumManager  'MESSI','ALLIANZ ARENA','MESSI','123456'

--CLUBS
EXEC addClub 'BARCELONA','BARCELONA'
EXEC addClub 'REAL MADRID','REAL MADRID'
EXEC addClub 'BAYERN','BAYERN'
EXEC addClub 'JUVENTUS','MILAN'
EXEC addClub 'MAN UNITED','MAN UNITED'
EXEC addClub 'MAN CITY','MAN UNITED'

--REPRESENTIVE
EXEC addRepresentative 'LEWA','LEWA','123456','REAL MADRID'
EXEC addRepresentative 'AMR','AMR','123456','BARCELONA'
EXEC addRepresentative 'IBRAHIM','IBRAHIM','123456','BAYERN'
EXEC addRepresentative 'SEIF','SEIF','123456','MAN UNITED'
EXEC addRepresentative 'ABDO','ABDO','123456','MAN CITY'
EXEC addRepresentative 'MOHY','MOHY','123456','JUVENTUS'

--matches
EXEC addNewMatch 'BARCELONA','REAL MADRID','BARCELONA','2022/10/15';
EXEC addNewMatch 'BAYERN','BARCELONA','BARCELONA','2020/11/16';
EXEC addNewMatch 'BARCELONA','MAN UNITED','BARCELONA','2021/9/17';
EXEC addNewMatch 'MAN UNITED','REAL MADRID','REAL MADRID','2019/10/18';
EXEC addNewMatch 'BAYERN','JUVENTUS','BAYERN','2022/10/19';
EXEC addNewMatch 'MAN CITY','JUVENTUS','JUVENTUS','2023/7/10'
EXEC addNewMatch 'REAL MADRID','BAYERN','REAL MADRID','2022/10/21'
EXEC addNewMatch 'REAL MADRID','JUVENTUS','JUVENTUS','2023/10/22'

END

EXEC deleteMatchesOnStadium 'SANTIAGO'


EXEC addTicket 'BARCELONA','REAL MADRID','2022/10/15'
SELECT * FROM allMatches
SELECT * FROM REQUESTS