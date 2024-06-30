# Blood Bank Management System Overview

## Introduction
The Blood Bank Management System (BBMS) is designed to streamline and manage the various operations of a blood bank efficiently. This system is implemented using a relational database, and the following is a comprehensive case study that covers the database design and the Data Definition Language (DDL) and Data Manipulation Language (DML) statements used in the system.

## Database Design
- **BloodGroups Table:**
  - Holds information about different blood groups.
  - Columns: `BGroupID`, `GroupName`.

- **Donors Table:**
  - Stores details of blood donors.
  - Columns: `DonorID`, `FirstName`, `LastName`, `Age`, `Gender`, `BGroupID`, `ContactNumber`, `Email`, `MedicalReport`, `HemoglobinLevel`, `BloodPressure`, `DonarState`, `DonarAddress`, `LastDonationDate`.

- **Patients Table:**
  - Contains information about patients needing blood.
  - Columns: `PatientID`, `FirstName`, `LastName`, `Age`, `Gender`, `BGroupID`, `Disease`, `ContactNumber`, `Email`, `PatientState`, `PatientAddress`, `MedicalHistory`, `HemoglobinLevel`, `BloodPressure`.

- **BloodBanks Table:**
  - Stores data about different blood banks.
  - Columns: `BloodBankID`, `BloodBankName`, `BloodBankAddress`, `BloodBankContact`.

- **BloodStocks Table:**
  - Manages the stock of blood available in the blood bank.
  - Columns: `StockID`, `BGroupID`, `QuantityInMilliliters`, `ExpiryDate`, `DonorID`.

- **CrossMatch Table:**
  - Records cross-matching information between donors and patients.
  - Columns: `CrossMatchID`, `PatientID`, `DonorID`, `StockID`, `CrossMatchResult`, `CrossMatchDate`, `Remarks`.

- **BloodDonations Table:**
  - Tracks blood donations made by donors.
  - Columns: `DonationID`, `DonorID`, `PatientID`, `DonationDateTime`, `BGroupID`, `QuantityInMilliliters`.

## DDL Statements
Defines the structure of the database and its tables.
- Create Database
- Create BloodGroups Table
- Create Donors Table
- Alter Donors Table
- Create Patients, BloodBanks, BloodStocks, CrossMatch, and BloodDonations Tables
- Alter CrossMatch Table
- Delete a Column from CrossMatch Table
- Delete a Table
- Add Non-Clustered Index on BloodDonations Table
- Create Views
- Create Stored Procedures
- Create Triggers
- Create Functions

## DML Statements
Manages the data within the tables.
- Insert Data into BloodGroups Table
- Insert Data into Donors Table
- Insert Data into Patients Table
- Insert Data into BloodBanks Table
- Insert Data into BloodStocks Table
- Insert Data into CrossMatch Table
- Insert Data into BloodDonations Table
- Retrieve Data from BloodGroups Table
- Retrieve Data from Donors Table
- Retrieve Data from Patients Table
- Retrieve Data from BloodStocks Table
- Retrieve Data from BloodBanks Table
- Retrieve Data from CrossMatch Table
- Retrieve Data from BloodDonations Table
- Retrieve Only Male Donors
- Retrieve all Donors Whose Blood Group is A+/A- or any
- Retrieve Donors by their state
- Format string data using literal values from Donors table
- Uses of LEFT Function
- Calculate Blood Donation Days
- Find out a Patient by their ID
- Retrieve last 3 Donors
- Uses of BETWEEN keyword JOINING TWO TABLES
- Uses of Wildcard JOIN WITH CORRELATION NAMES
- Use of GROUP BY and ROLLUP Clause
- Show Donors from 4 to 8 / USES OF OFFSET AND FETCH NEXT
- Justify Non-Clustered Index
- Justify Updatable View
- Justify Read-Only View
- Justify Encrypted View
- Check Stored Procedure
- Stored Procedure by Output Parameter
- Check Stored Procedure for Insert / Update / Delete (DML Statement)
- Select Functionality
- INSERT Functionality
- UPDATE Functionality
- DELETE Functionality
- Justify After Delete Trigger
- Execution of Scalar Function
- Example usage of the Table-Valued Function
- Execution usage of the Multi-Statement Function

I am Mohiuddin. Responsive website Design and Full Stack Web Application Developer. I have a Web Development and Digital Marketing Agency Where We will make creative, flexible and affordable websites. Our affordability meets professionalism. We can do PSD to HTML & WordPress Theme, customize your Theme/website, build a child theme for you. I have a strong knowledge about WP Backery & Elementor page builder. I am skilled in on-page SEO and Keyword research. I Completed 112+ Projects of 8+ country's 22+ client's at various marketplaces since 2014. Your satisfaction is my success.
Contact me to do your Project
webservice24.org@gmail.com
Whatsapp: +880 1831332732
Facebook: facebook.com/wpdeveloper24
