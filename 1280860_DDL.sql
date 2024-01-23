--Name: Mohiuddin
--CS/SCSL/58/01
--ID: 1280860
--Project: Blood Bank

--Create Database on BloodBank
USE master
GO
IF DB_ID('BloodBank') IS NOT NULL
	DROP DATABASE BloodBank
GO
CREATE DATABASE BloodBank
ON (
	Name = 'BloodBank_Data_1',
	FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BloodBank_Data_1.mdf',
	Size = 50MB,
	MaxSize = 100MB,
	FileGrowth = 5%
)
LOG ON (
	Name = 'BloodBank_Log_1',
	FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BloodBank_Log_1.ldf',
	Size = 5MB,
	MaxSize = 25MB,
	FileGrowth = 2MB
);
GO 


USE BloodBank
GO
IF OBJECT_ID('BloodGroups') IS NOT NULL
	DROP TABLE BloodGroups
GO
CREATE TABLE BloodGroups 
(
    BGroupID INT PRIMARY KEY NOT NULL,
    GroupName VARCHAR(4) NOT NULL
);

GO

IF OBJECT_ID('Donors') IS NOT NULL
	DROP TABLE Donors
GO
	CREATE TABLE Donors 
	(
		DonorID  INT PRIMARY KEY NOT NULL,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Age INT NOT NULL,
		Gender VARCHAR(15) NOT NULL,
		BGroupID INT REFERENCES BloodGroups(BGroupID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
		ContactNumber VARCHAR(15) NOT NULL,
		Email VARCHAR(40) NOT NULL,
		MedicalReport VARCHAR(20) NOT NULL CHECK (MedicalReport IN('Satisfactory','Not Satisfactory')),
		HemoglobinLevel DECIMAL(4,2) NOT NULL,
		BloodPressure VARCHAR(10) NOT NULL,
		DonarState VARCHAR(25) NOT NULL,
		DonarAddress VARCHAR(255) NOT NULL
	);
GO

--practice alter table
ALTER TABLE Donors
ADD LastDonationDate DATE DEFAULT '2023-03-26' NOT NULL

IF OBJECT_ID('Patients') IS NOT NULL
    DROP TABLE Patients
GO

CREATE TABLE Patients 
(
    PatientID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(15) NOT NULL,
    BGroupID INT REFERENCES BloodGroups(BGroupID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
	Disease VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(15) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    PatientState VARCHAR(25) NOT NULL,
    PatientAddress VARCHAR(255) NOT NULL,
    MedicalHistory VARCHAR(MAX) NULL,
	HemoglobinLevel DECIMAL(4,2) NOT NULL,
	BloodPressure VARCHAR(10) NOT NULL
);

GO

IF OBJECT_ID('BloodBanks') IS NOT NULL
    DROP TABLE BloodBanks
GO

CREATE TABLE BloodBanks 
(
    BloodBankID INT PRIMARY KEY NOT NULL,
    BloodBankName VARCHAR(50) NOT NULL,
	BloodBankAddress VARCHAR(100) NOT NULL,
	BloodBankContact VARCHAR (14) NOT NULL
);
GO


IF OBJECT_ID('BloodStocks') IS NOT NULL
	DROP TABLE BloodStocks
GO
CREATE TABLE BloodStocks 
(
	StockID INT PRIMARY KEY NOT NULL,
	BGroupID INT REFERENCES BloodGroups(BGroupID) NOT NULL,
	QuantityInMilliliters INT NOT NULL,
	ExpiryDate DATE NOT NULL,
	DonorID  INT REFERENCES Donors(DonorID) NOT NULL
);
GO

IF OBJECT_ID('CrossMatch') IS NOT NULL
	DROP TABLE CrossMatch
GO
CREATE TABLE CrossMatch
(
    CrossMatchID INT PRIMARY KEY,
    PatientID INT REFERENCES Patients(PatientID) NOT NULL,
    DonorID INT REFERENCES Donors(DonorID) NOT NULL,
    StockID INT REFERENCES BloodStocks(StockID) NOT NULL,
    CrossMatchResult VARCHAR(50) NOT NULL,
    CrossMatchDate DATE NOT NULL,
    Remarks TEXT,
    CONSTRAINT UC_CrossMatch UNIQUE (PatientID, DonorID, StockID) -- Ensure unique combination
);
GO

IF OBJECT_ID('BloodDonations')IS NOT NULL
	DROP TABLE BloodDonations
GO
CREATE TABLE BloodDonations
(
	DonationID INT PRIMARY KEY NOT NULL,
	DonorID  INT REFERENCES Donors(DonorID) NOT NULL,
	PatientID INT REFERENCES Patients(PatientID) NOT NULL,
	DonationDateTime DATE NOT NULL,
	BGroupID INT REFERENCES BloodGroups(BGroupID) NOT NULL,
	QuantityInMilliliters INT NOT NULL

);
GO

--Write Alter query for the CrossMatch Table
ALTER TABLE CrossMatch
ADD CrossMatchCost MONEY DEFAULT 1450 NOT NULL
GO
-- JUSTIFY ALTER QUERY
SELECT * FROM CrossMatch
GO

--Write query for deleting a column from a table

BEGIN TRY
    IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CrossMatch' AND COLUMN_NAME = 'CrossMatchCost')
    BEGIN
        ALTER TABLE CrossMatch
        DROP COLUMN CrossMatchCost;
        PRINT 'Column CrossMatchCost has been dropped successfully.';
    END
    ELSE
    BEGIN
        RAISERROR ('Column CrossMatchCost does not exist in table CrossMatch.', 16, 1);
    END
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH
GO

--QUERY TO DELET A TABLE USING DROP TABLE METHOD
IF OBJECT_ID('BloodDonations')IS NOT NULL
	DROP TABLE BloodDonations
GO

--QUERY TO add a non clustered index
BEGIN TRY
    IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('BloodDonations') AND name = 'IX_NonClusteredIndexName')
    BEGIN
        CREATE NONCLUSTERED INDEX IX_NonClusteredIndexName
        ON BloodDonations(DonorID)

        PRINT 'Non-clustered index IX_NonClusteredIndexName created successfully.';
    END
    ELSE
    BEGIN
        RAISERROR ('Non-clustered index IX_NonClusteredIndexName already exists on table BloodDonations.', 16, 1);
    END
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH
GO

--justify nonclustered index
sp_helpindex BloodDonations

--CREATE CTE
WITH DonorSummary AS
(
    SELECT 
        b.DonorID, 
        FirstName + ' ' + LastName as DonorName, 
        DonarAddress,  
        DonarState, 
        ContactNumber, 
        Gender, 
        Age, 
        GroupName, 
        LastDonationDate
    FROM 
        BloodStocks AS b 
        JOIN Donors AS d ON b.DonorID = d.DonorID
        JOIN BloodGroups AS bg ON b.BGroupID = bg.BGroupID
),
TopDonors AS
(
    SELECT 
        DonorID, 
        DonorName, 
        DonarState
    FROM 
        DonorSummary
    ORDER BY LastDonationDate DESC
    OFFSET 0 ROWS FETCH FIRST 3 ROWS ONLY
)
SELECT 
    DonorName, 
    DonarState, 
    GroupName, 
    ContactNumber
FROM 
    DonorSummary
WHERE 
    EXISTS (
        SELECT 1
        FROM TopDonors
        WHERE DonorSummary.DonorID = TopDonors.DonorID
    );


--create a updatable view for donors table
CREATE VIEW DonorsView
AS
SELECT DonorID, FirstName, LastName, Age, Gender, BGroupID 
FROM Donors

--create read only view
CREATE VIEW AvgCrossMatch
AS
select CrossMatchID, AVG(CrossMatchCost) as AVGcost 
from CrossMatch
group by CrossMatchID
GO

--create encrypted view
CREATE VIEW EncryptedView WITH ENCRYPTION
AS
SELECT 
    DonorID,
    FirstName + ' ' + LastName as DonorName,
    Gender,
    GroupName,
    ContactNumber
FROM 
    Donors as d
JOIN 
    BloodGroups as b ON d.BGroupID = b.BGroupID;


--CREATE stored procedure using parameter

CREATE PROCEDURE GetDonorsByState
    @DonarState NVARCHAR(50)
AS
BEGIN
    SELECT 
        d.DonorID,
        CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
        d.Gender,
        b.GroupName,
        d.ContactNumber
    FROM 
        Donors AS d
    JOIN 
        BloodGroups AS b ON d.BGroupID = b.BGroupID
    WHERE 
        d.DonarState = @DonarState;
END;

--CREATE stored procedure using Output parameter
CREATE PROC spDonorsDetailsByState
    @state varchar(10) OUTPUT
AS
SELECT DonorID, FirstName, LastName, DonarState, GroupName, ContactNumber
FROM Donors AS d
JOIN BloodGroups AS b ON d.BGroupID = b.BGroupID
WHERE d.DonarState = @state

-- PROCEDURE FOR INSERT UPDATE DELETE AND OUTOUT PARAMETER

Alter PROC InsertUpdateDeleteOutput
    @Functionality varchar(10) = '',
    @BloodBankID int = NULL,
    @BloodBankName varchar(50) = NULL,
    @BloodBankAddress varchar(100) = NULL,
    @BloodBankContact varchar(20) = NULL,
    @Count int output
AS 
BEGIN
    BEGIN TRY
        IF @Functionality = 'SELECT'
            SELECT * FROM BloodBanks

        IF @Functionality = 'INSERT'
        BEGIN
            INSERT INTO BloodBanks 
            VALUES (@BloodBankID, @BloodBankName, @BloodBankAddress, @BloodBankContact)
        END

        IF @Functionality = 'UPDATE'
        BEGIN
            UPDATE BloodBanks
            SET BloodBankName = @BloodBankName
            WHERE BloodBankID = @BloodBankID
        END

        IF @Functionality = 'DELETE'
        BEGIN
            DELETE FROM BloodBanks
            WHERE BloodBankID = @BloodBankID
        END

        SET @Count = @@ROWCOUNT
    END TRY
    BEGIN CATCH
        -- Handle the error as needed
        PRINT 'Error: ' + ERROR_MESSAGE();
        SET @Count = -1; -- Set @Count to a specific value indicating an error
    END CATCH
END

---------------- Working On Trigger -------------------

--- Create table for Donors Archive
IF OBJECT_ID('DonorsArchive') IS NOT NULL
	DROP TABLE DonorsArchive
GO
	CREATE TABLE DonorsArchive 
	(
		DonorID  INT PRIMARY KEY NOT NULL,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Age INT NOT NULL,
		Gender VARCHAR(15) NOT NULL,
		BGroupID INT REFERENCES BloodGroups(BGroupID) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
		ContactNumber VARCHAR(15) NOT NULL,
		Email VARCHAR(40) NOT NULL,
		MedicalReport VARCHAR(20) NOT NULL CHECK (MedicalReport IN('Satisfactory','Not Satisfactory')),
		HemoglobinLevel DECIMAL(4,2) NOT NULL,
		BloodPressure VARCHAR(10) NOT NULL,
		DonarState VARCHAR(25) NOT NULL,
		DonarAddress VARCHAR(255) NOT NULL,
		LastDonationDate date
	);
GO

--- Create after trigger, whenever a donors deleted from Donors table it will autometically inserted into DonorsArchive Table
Create TRIGGER trDonorArchiveAfterDeletedFromDonors
ON Donors
AFTER DELETE
AS
BEGIN
	BEGIN TRY
		INSERT INTO DonorsArchive (DonorID,  FirstName, LastName, Age, Gender, BGroupID, ContactNumber, Email, MedicalReport, 
		HemoglobinLevel, BloodPressure, DonarState, DonarAddress, LastDonationDate)

		SELECT  DonorID,  FirstName, LastName, Age, Gender, BGroupID, ContactNumber, Email, MedicalReport, 
		HemoglobinLevel, BloodPressure, DonarState, DonarAddress, LastDonationDate
		FROM deleted;

		PRINT 'Data was Archived in DonorArchive Table'
	END TRY
	BEGIN CATCH
		RAISERROR('Operation Faild!',16,1)
	END CATCH

END;
GO


--INSTEAD TRIGGER FOR INSERT, UPDATE, DELETE WITH VIEW TABLE AvgCrossMatch
IF OBJECT_ID('InsteadOfTrigger_AgbCrossMatch', 'TR') IS NOT NULL
    DROP TRIGGER InsteadOfTrigger_AgbCrossMatch;

GO
CREATE TRIGGER InsteadOfTrigger_AgbCrossMatch
ON AvgCrossMatch -- VIEW TABLE
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO CrossMatch values (806, 401, 305, 604, 'Incompatible', GETDATE(), 'Cross-match failed', 1500)
		UPDATE CrossMatch 
		SET CrossMatchCost = 1600
		WHERE CrossMatchID in (select CrossMatchID from inserted)

        PRINT 'INSERT or UPDATE operation not allowed on the AvgCrossMatch view.';
    END
    ELSE
    BEGIN
        DELETE FROM CrossMatch
        WHERE CrossMatchID IN (SELECT CrossMatchID FROM deleted);
    END
END;

---------------Working On Functions----------------
--scaler function

CREATE FUNCTION fnDonorsCountByState(@DonorState varchar(50))
RETURNS INT
AS
BEGIN
    DECLARE @TotalDonors INT;

    SELECT @TotalDonors = COUNT(DonorID)
    FROM Donors
    WHERE DonarState = @DonorState;

    RETURN @TotalDonors;
END;

-- Create a table-valued function for Donors
CREATE FUNCTION dbo.fnGetDonorsByState
(
    @DonorState varchar(50)
)
RETURNS TABLE
AS
RETURN (
    SELECT 
        DonorID,
        FirstName,
        LastName,
        DonarAddress,
        DonarState,
        ContactNumber,
        Gender,
        Age,
        BGroupID,
        LastDonationDate
    FROM 
        Donors
    WHERE 
        DonarState = @DonorState
);
GO

-- Create a multi-statement table-valued function for Donors and BloodStocks
CREATE FUNCTION dbo.fnGetDonorsAndBloodStocksByState
(
    @DonorState varchar(50)
)
RETURNS @ResultTable TABLE
(
    DonorID INT,
    DonorName NVARCHAR(100),
    DonarState NVARCHAR(50),
    ContactNumber NVARCHAR(20),
    Gender NVARCHAR(10),
    Age INT,
    GroupName NVARCHAR(50),
    LastDonationDate DATE,
    BloodStockID INT,
    BloodGroup NVARCHAR(10),
    Quantity INT,
    ExpiryDate DATE
)
AS
BEGIN
    INSERT INTO @ResultTable
    SELECT
        d.DonorID,
        CONCAT(d.FirstName, ' ', d.LastName) AS DonorName,
        d.DonarState,
        d.ContactNumber,
        d.Gender,
        d.Age,
        bg.GroupName,
        d.LastDonationDate,
        bs.StockID,
        bg.GroupName,
        bs.QuantityInMilliliters,
        bs.ExpiryDate
    FROM 
        Donors AS d
    JOIN 
        BloodStocks AS bs ON d.DonorID = bs.DonorID
    JOIN 
        BloodGroups AS bg ON bs.BGroupID = bg.BGroupID
    WHERE 
        d.DonarState = @DonorState;

    RETURN;
END;
GO

