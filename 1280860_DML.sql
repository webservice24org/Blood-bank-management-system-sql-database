--Name: Mohiuddin
--CS/SCSL/58/01
--ID: 1280860
--Project: Blood Bank

USE BloodBank
GO

--Insert Data into BloodGroups Table
BEGIN TRY
    INSERT INTO BloodGroups(BGroupID, GroupName)
    VALUES 
    (101, 'A+'),
    (102, 'A-'),
	(103, 'B+'),
	(104, 'B-'),
	(105, 'AB+'),
    (106, 'AB-'),
	(107, 'O+'),
    (108, 'O-');

    PRINT 'Success: Records Were Inserted!';
END TRY
BEGIN CATCH
    PRINT 'Failure: Records Were Not Inserted!';
    PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ' : ' + ERROR_MESSAGE();
END CATCH;
GO

--Insert Data into Donors Table
BEGIN TRY
	INSERT INTO Donors (DonorID, FirstName, LastName, Age, Gender, BGroupID, ContactNumber, Email, MedicalReport, HemoglobinLevel, BloodPressure, DonarState, DonarAddress)
	VALUES
	(301, 'John', 'Doe', 25, 'Male', 101, '123-456-7890', 'john.doe@email.com', 'Satisfactory', 14.5, '120/80', 'Dhaka', '123 Main St'),
	(302, 'Jane', 'Smith', 30, 'Female', 102, '987-654-3210', 'jane.smith@email.com', 'Satisfactory', 12.5, '120/60', 'Cht', '456 Oak Ave'),
	(303, 'Bob', 'Johnson', 28, 'Male', 103, '555-555-5555', 'bob.johnson@email.com', 'Not Satisfactory', 11.5, '110/40', 'Raj', '789 Pine St'),
	(304, 'Alice', 'Williams', 35, 'Female', 104, '111-222-3333', 'alice.williams@email.com', 'Satisfactory', 14.5, '120/40', 'Ny', '987 Elm St'),
	(305, 'Doe', 'Williams', 35, 'Male', 105, '111-222-4455', 'doe.williams@email.com', 'Not Satisfactory', 13.5, '100/70', 'Ny', '987 Elm St'),
	(306,'John', 'Doe', 25, 'Male', 101, '123-456-7890', 'john.doe@email.com', 'Satisfactory', 14.5, '120/80', 'Dhaka', '123 Main St'),
	(307,'Alice', 'Smith', 30, 'Female', 102, '987-654-3210', 'alice.smith@email.com', 'Satisfactory', 12.0, '110/70', 'New York', '456 Oak St'),
	(308,'Bob', 'Johnson', 35, 'Male', 103, '555-123-4567', 'bob.johnson@email.com', 'Satisfactory', 15.2, '130/90', 'Los Angeles', '789 Pine St'),
	(309, 'Eva', 'Davis', 28, 'Female', 104, '111-222-3333', 'eva.davis@email.com', 'Not Satisfactory', 13.8, '125/85', 'Chicago', '567 Maple St'),
	(310,'Michael', 'Brown', 40, 'Male', 105, '999-888-7777', 'michael.brown@email.com', 'Not Satisfactory', 14.0, '128/82', 'Houston', '321 Birch St');

	PRINT 'Success: Records Inserted Successfully!';
END TRY
BEGIN CATCH
	PRINT 'Failure: An Error occured! Records were not inserted! ';
	PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(),1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

--Insert Data into Patients Table
BEGIN TRY
    INSERT INTO Patients (PatientID, FirstName, LastName, Age, Gender, BGroupID, Disease, ContactNumber, Email, PatientState, PatientAddress, MedicalHistory, HemoglobinLevel, BloodPressure)
    VALUES
    (401, 'John', 'Doe', 30, 'Male', 101, 'Fever', '123-456-7890', 'john.doe@email.com', 'DH', '123 Main St', NULL, 12.4, '120/80'),
    (402, 'Jane', 'Smith', 25, 'Female', 102, 'Headache', '987-654-3210', 'jane.smith@email.com', 'CH', '456 Oak Ave', NULL, 14.5, '120/70'),
    (403, 'Bob', 'Johnson', 40, 'Male', 103, 'Flu', '555-555-5555', 'bob.johnson@email.com', 'RJ', '789 Pine St', 'Previous surgeries', 10.5, '120/60'),
    (404, 'Alice', 'Williams', 35, 'Female', 104, 'Allergies', '111-222-3333', 'alice.williams@email.com', 'BG', '987 Elm St', 'Heart condition', 11.5, '120/40'),
    (405, 'Charlie', 'Brown', 28, 'Male', 105, 'Sprained ankle', '777-888-9999', 'charlie.brown@email.com', 'NY', '555 Maple St', NULL, 14.5, '120/60');

    PRINT 'Success: Records Inserted Successfully!';
END TRY
BEGIN CATCH
    PRINT 'Failure: An Error occurred! Records were not inserted! ';
    PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

--Insert Data into BloodBanks Table
BEGIN TRY
    INSERT INTO BloodBanks (BloodBankID, BloodBankName, BloodBankAddress, BloodBankContact)
    VALUES
    (501, 'City Blood Bank', '123 Main St', '123-456-7890'),
    (502, 'Community Blood Center', '456 Oak Ave', '987-654-3210'),
    (503, 'Metro Blood Services', '789 Pine St', '555-555-5555'),
    (504, 'Regional Blood Bank', '987 Elm St', '111-222-3333'),
    (505, 'Unity Blood Donors', '555 Maple St', '777-888-9999');

    PRINT 'Success: Records Inserted Successfully!';
END TRY
BEGIN CATCH
    PRINT 'Failure: An Error occurred! Records were not inserted! ';
    PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

--Insert Data into BloodStocks Table
BEGIN TRY
    INSERT INTO BloodStocks (StockID, BGroupID, QuantityInMilliliters, ExpiryDate, DonorID)
    VALUES
    (601, 101, 500, '2024-03-15', 301),
	(602, 102, 400, '2024-03-11', 302),
	(603, 104, 500, '2024-04-19', 303),
	(604, 102, 400, '2024-05-22', 304),
	(605, 103, 450, '2024-03-20', 305)
    PRINT 'Success: Records Inserted Successfully!';
END TRY
BEGIN CATCH
    PRINT 'Failure: An Error occurred! Records were not inserted! ';
    PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ': ' + ERROR_MESSAGE();
END CATCH;
GO

-- Insert values into CrossMatch table with error handling
BEGIN TRY
    INSERT INTO CrossMatch (CrossMatchID, PatientID, DonorID, StockID, CrossMatchResult, CrossMatchDate, Remarks)
    VALUES
    (801, 401, 301, 601, 'Compatible', '2024-01-15', 'Successful cross-match'),
    (802, 402, 302, 602, 'Incompatible', '2024-01-16', 'Cross-match failed'),
    (803, 403, 303, 603, 'Compatible', '2024-01-17', 'Successful cross-match'),
    (804, 404, 304, 604, 'Compatible', '2024-01-18', 'Successful cross-match'),
    (805, 405, 305, 605, 'Incompatible', '2024-01-19', 'Cross-match failed');
    
    SELECT 'Insertion successful' AS Status;
END TRY
BEGIN CATCH
    SELECT 
        'Insertion failed' AS Status,
        ERROR_MESSAGE() AS ErrorMessage,
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_LINE() AS ErrorLine;
END CATCH;
GO

-- Insert values into BloodDonations table with error handling
BEGIN TRY
	INSERT INTO BloodDonations (DonationID, DonorID, PatientID, DonationDateTime, BGroupID, QuantityInMilliliters)
	VALUES
	(701, 301, 401, GETDATE(), 101, 450),
	(702, 302, 402, GETDATE(), 103, 550),
	(703, 303, 403, GETDATE(), 104, 350),
	(704, 304, 404, GETDATE(), 102, 350),
	(705, 305, 405, GETDATE(), 101, 450)
	PRINT 'Success: Data inserted Successfully';
END TRY
BEGIN CATCH
	PRINT 'Failur: An Error Occured! Records Were not Inserted';
	PRINT 'Error: ' + CONVERT(VARCHAR, ERROR_NUMBER(), 1) + ':' + ERROR_MESSAGE();
END CATCH;
GO
--Retrive Data from BloodGroups Table
SELECT * FROM BloodGroups

--Retrive Data from Donors Table
SELECT * FROM Donors
GO

--Retrive Data from Patients Table
SELECT * FROM Patients
GO

--Retrive Data from BloodStocks Table
SELECT * FROM BloodStocks
GO

--Retrive Data from BloodBanks Table
SELECT * FROM BloodBanks
GO

--Retrive Data from CrossMatch Table
SELECT * FROM CrossMatch
GO

--Retrive Data from BloodDonations Table
SELECT * FROM BloodDonations
GO

--Retrive Only Male Donors
SELECT DonorID, FirstName, LastName, DonarState, Gender, ContactNumber 
FROM Donors
WHERE Gender = 'Male';
GO

--Retrive all Donors Whoes Blood Group A+/A- or any
SELECT DonorID, FirstName, LastName, DonarState, Gender, ContactNumber, GroupName
FROM Donors AS d
JOIN BloodGroups AS b
ON d.BGroupID = b.BGroupID
WHERE GroupName = 'A+'
GO

-- Retrive Donors by his/her state
SELECT DonorID, FirstName, LastName, DonarState, Gender, ContactNumber, GroupName
FROM Donors AS d
JOIN BloodGroups AS b
ON d.BGroupID = b.BGroupID
WHERE DonarState = 'cht'
GO

--Format string data using literal values from Donors table
SELECT DonorID, 
FirstName + ' ' + LastName as DonorName, 
DonarAddress  + ', ' +  DonarState as Address, 
ContactNumber, Gender, Age, GroupName
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID

--Uses of LEFT Function
SELECT DonorID, 
FirstName, LastName, 
LEFT(FirstName, 1) + LEFT(LastName, 1) as Initials,
DonarAddress  + ', ' +  DonarState as Address, 
ContactNumber, Gender, Age, GroupName
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID

--Calculate Blood Donation Days
SELECT 
    DonorID, 
    FirstName + ' ' + LastName as DonorName, 
    DonarAddress  + ', ' +  DonarState as Address, 
    ContactNumber, 
    Gender, 
    Age, 
    GroupName, 
	DATEDIFF(DAY, LastDonationDate, CAST(GETDATE() AS DATE)) as [Donated Before]
FROM 
    Donors as d
JOIN 
    BloodGroups as b ON d.BGroupID = b.BGroupID;

GO

--Find out a Patient by his/her id
SELECT PatientID, FirstName + ' ' + LastName as [Patient's Name], 
Age, Gender, 
PatientAddress + ', ' + PatientState as [Patient's Address],
HemoglobinLevel, BloodPressure, GroupName
FROM 
	Patients as p
JOIN
	BloodGroups as b
ON p.BGroupID=b.BGroupID
WHERE PatientID = 405;
GO

--Retrive last 3 Donors
SELECT TOP 3 DonorID, 
FirstName + ' ' + LastName as DonorName, 
DonarAddress  + ', ' +  DonarState as Address, 
ContactNumber, Gender, Age, GroupName
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID
ORDER BY DonorID DESC;
GO

--Uses of BETWEEN keyword JOINING TWO TABLES
SELECT DonorID, 
FirstName + ' ' + LastName as DonorName, 
DonarAddress  + ', ' +  DonarState as Address, 
ContactNumber, Gender, Age, GroupName, LastDonationDate
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID
WHERE LastDonationDate BETWEEN '2023-02-05' AND '2023-07-05'
ORDER BY DonorID ASC;
GO

--Uses of WilCard JOIN WITH CORRELATION NAMES
SELECT DonorID, 
FirstName + ' ' + LastName as DonorName, 
DonarAddress,  DonarState, 
ContactNumber, Gender, Age, GroupName, LastDonationDate
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID
WHERE LastName LIKE 'W[A-Y]%'
ORDER BY DonorID ASC;
GO

--user of group by and rollup clause
select DonarState,
count(DonorID) 
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID
where DonarState in ('Dhaka')
group by rollup(DonarState)
order by DonarState DESC
-- Show Donors from 4 to 8 / USES OF OFFSET AND FETCH NEXT
SELECT DonorID, 
FirstName + ' ' + LastName as DonorName, 
DonarAddress,  DonarState, 
ContactNumber, Gender, Age, GroupName, LastDonationDate
FROM Donors as d
JOIN BloodGroups as b
ON d.BGroupID=b.BGroupID
ORDER BY DonorID
OFFSET 3 ROWS
FETCH NEXT 5 ROWS ONLY

--justify nonclustered index
sp_helpindex BloodDonations

--justify updatable view
SELECT * FROM DonorsView

--justify read only view
SELECT * FROM AvgCrossMatch

--justify encrypted view
SELECT * FROM EncryptedView

--check stored procedure
EXEC GetDonorsByState 'Dhaka'

--Stored procedure by output paramiter
EXEC spDonorsDetailsByState 'Dhaka'

--Check stored procedure for insert / update / delete (DML Statement)
-- Select functionality
DECLARE @CountSelect int;
EXEC InsertUpdateDeleteOutput @Functionality = 'SELECT', @Count = @CountSelect OUTPUT;
PRINT 'SELECT Count: ' + CAST(@CountSelect AS VARCHAR(10));

-- INSERT functionality
DECLARE @CountInsert int;
EXEC InsertUpdateDeleteOutput 
    @Functionality = 'INSERT', 
    @BloodBankID = 506, 
    @BloodBankName = 'Ramgonj Blood Bank', 
    @BloodBankAddress = 'Ramgonj, Lakshmipur', 
    @BloodBankContact = '01831332732',
    @Count = @CountInsert OUTPUT;
PRINT 'INSERT Count: ' + CAST(@CountInsert AS VARCHAR(10));

--UPDATE functionality
DECLARE @CountUpdate int;
EXEC InsertUpdateDeleteOutput 
    @Functionality = 'UPDATE', 
    @BloodBankID = 506, 
    @BloodBankName = 'Mwt Blood Bank',
    @Count = @CountUpdate OUTPUT;
PRINT 'UPDATE Count: ' + CAST(@CountUpdate AS VARCHAR(10));

-- DELETE functionality
DECLARE @CountDelete int;
EXEC InsertUpdateDeleteOutput 
    @Functionality = 'DELETE', 
    @BloodBankID = 506, 
    @Count = @CountDelete OUTPUT;
PRINT 'DELETE Count: ' + CAST(@CountDelete AS VARCHAR(10));
GO
--justify after delete trigger
DELETE from Donors
where DonorID = 309

SElect * from DonorsArchive
GO

--execution of scaler function
DECLARE @DonorStateInput varchar(50) = 'Dhaka'; 
DECLARE @TotalDonors INT;

SELECT @TotalDonors = dbo.fnDonorsCountByState(@DonorStateInput);

SELECT 'Total Donors in ' + @DonorStateInput + ': ' + CAST(@TotalDonors AS VARCHAR(10)) AS Result;
GO

-- Example usage of the table-valued function
DECLARE @StateParameter varchar(50) = 'Dhaka'; 
SELECT * FROM dbo.fnGetDonorsByState(@StateParameter);
GO

-- Execution usage of the multi-statement function
DECLARE @StateParameter varchar(50) = 'Dhaka'; 

SELECT * FROM dbo.fnGetDonorsAndBloodStocksByState(@StateParameter);

