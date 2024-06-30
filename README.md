<h1>Blood Bank Management System Overview</h1>

    <h2>Introduction</h2>
    <p>The Blood Bank Management System (BBMS) is designed to streamline and manage the various operations of a blood bank efficiently. This system is implemented using a relational database, and the following is a comprehensive case study that covers the database design and the Data Definition Language (DDL) and Data Manipulation Language (DML) statements used in the system.</p>

    <h2>Database Design</h2>
    <ul>
        <li>BloodGroups Table:
            <ul>
                <li>Holds information about different blood groups.</li>
                <li>Columns: BGroupID, GroupName.</li>
            </ul>
        </li>
        <li>Donors Table:
            <ul>
                <li>Stores details of blood donors.</li>
                <li>Columns: DonorID, FirstName, LastName, Age, Gender, BGroupID, ContactNumber, Email, MedicalReport, HemoglobinLevel, BloodPressure, DonarState, DonarAddress, LastDonationDate.</li>
            </ul>
        </li>
        <li>Patients Table:
            <ul>
                <li>Contains information about patients needing blood.</li>
                <li>Columns: PatientID, FirstName, LastName, Age, Gender, BGroupID, Disease, ContactNumber, Email, PatientState, PatientAddress, MedicalHistory, HemoglobinLevel, BloodPressure.</li>
            </ul>
        </li>
        <li>BloodBanks Table:
            <ul>
                <li>Stores data about different blood banks.</li>
                <li>Columns: BloodBankID, BloodBankName, BloodBankAddress, BloodBankContact.</li>
            </ul>
        </li>
        <li>BloodStocks Table:
            <ul>
                <li>Manages the stock of blood available in the blood bank.</li>
                <li>Columns: StockID, BGroupID, QuantityInMilliliters, ExpiryDate, DonorID.</li>
            </ul>
        </li>
        <li>CrossMatch Table:
            <ul>
                <li>Records cross-matching information between donors and patients.</li>
                <li>Columns: CrossMatchID, PatientID, DonorID, StockID, CrossMatchResult, CrossMatchDate, Remarks.</li>
            </ul>
        </li>
        <li>BloodDonations Table:
            <ul>
                <li>Tracks blood donations made by donors.</li>
                <li>Columns: DonationID, DonorID, PatientID, DonationDateTime, BGroupID, QuantityInMilliliters.</li>
            </ul>
        </li>
    </ul>

    <h2>DDL Statements</h2>
    <p>Defines the structure of the database and its tables.</p>
    <ul>
        <li>Create Database</li>
        <li>Create BloodGroups Table</li>
        <li>Create Donors Table</li>
        <li>Alter Donors Table</li>
        <li>Create Patients, BloodBanks, BloodStocks, CrossMatch, and BloodDonations Tables</li>
        <li>Alter CrossMatch Table</li>
        <li>Delete a Column from CrossMatch Table</li>
        <li>Delete a Table</li>
        <li>Add Non-Clustered Index on BloodDonations Table</li>
        <li>Create Views</li>
        <li>Create Stored Procedures</li>
        <li>Create Triggers</li>
        <li>Create Functions</li>
    </ul>

    <h2>DML Statements</h2>
    <p>Manages the data within the tables.</p>
    <ul>
        <li>Insert Data into BloodGroups Table</li>
        <li>Insert Data into Donors Table</li>
        <li>Insert Data into Patients Table</li>
        <li>Insert Data into BloodBanks Table</li>
        <li>Insert Data into BloodStocks Table</li>
        <li>Insert Data into CrossMatch Table</li>
        <li>Insert Data into BloodDonations Table</li>
        <li>Retrieve Data from BloodGroups Table</li>
        <li>Retrieve Data from Donors Table</li>
        <li>Retrieve Data from Patients Table</li>
        <li>Retrieve Data from BloodStocks Table</li>
        <li>Retrieve Data from BloodBanks Table</li>
        <li>Retrieve Data from CrossMatch Table</li>
        <li>Retrieve Data from BloodDonations Table</li>
        <li>Retrieve Only Male Donors</li>
        <li>Retrieve all Donors Whose Blood Group is A+/A- or any</li>
        <li>Retrieve Donors by their state</li>
        <li>Format string data using literal values from Donors table</li>
        <li>Uses of LEFT Function</li>
        <li>Calculate Blood Donation Days</li>
        <li>Find out a Patient by their ID</li>
        <li>Retrieve last 3 Donors</li>
        <li>Uses of BETWEEN keyword JOINING TWO TABLES</li>
        <li>Uses of Wildcard JOIN WITH CORRELATION NAMES</li>
        <li>Use of GROUP BY and ROLLUP Clause</li>
        <li>Show Donors from 4 to 8 / USES OF OFFSET AND FETCH NEXT</li>
        <li>Justify Non-Clustered Index</li>
        <li>Justify Updatable View</li>
        <li>Justify Read-Only View</li>
        <li>Justify Encrypted View</li>
        <li>Check Stored Procedure</li>
        <li>Stored Procedure by Output Parameter</li>
        <li>Check Stored Procedure for Insert / Update / Delete (DML Statement)</li>
        <li>Select Functionality</li>
        <li>INSERT Functionality</li>
        <li>UPDATE Functionality</li>
        <li>DELETE Functionality</li>
        <li>Justify After Delete Trigger</li>
        <li>Execution of Scalar Function</li>
        <li>Example usage of the Table-Valued Function</li>
        <li>Execution usage of the Multi-Statement Function</li>
    </ul>

    <h2>Conclusion</h2>
    <p>The Blood Bank Management System, implemented using SQL DDL and DML statements, provides an organized and efficient way to manage blood bank operations, donor information, and patient records. The use of a relational database ensures data integrity and ease of access for various stakeholders involved in blood bank management.</p>

    <p>Thanks and Regards</p>
    <p>Mohiuddin</p>
    <p>ID: 1280860</p>
    <p>Round: 58</p>
    <p>Subject: C#</p>
    <p>TSP: SCSL</p>
