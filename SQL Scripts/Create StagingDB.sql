CREATE DATABASE HMS_Staging;
GO
ALTER DATABASE HMS_Staging COLLATE SQL_Latin1_General_CP1_CI_AS;
GO

USE HMS_Staging;
GO
CREATE TABLE Pharmacy_storage (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Medicine_id INT,
    name VARCHAR(100),
    Quantity INT,
    expiration_date DATE,
    price DECIMAL(10, 2),
	MinQuantity INT,
	OrderQuantity INT
);
CREATE TABLE Medical_history (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    History_ID INT ,
    medication VARCHAR(255),
    diagnosis_date DATE,
    condition_name VARCHAR(255),
    Patient_ID INT NOT NULL
);
CREATE TABLE Patient (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Patient_ID INT,
    patient_name VARCHAR(100),
    phone_number VARCHAR(30),
    DOB DATE,
    gender VARCHAR(10),
    nationality VARCHAR(50),
    blood_type VARCHAR(5),
    emergency_contact VARCHAR(100),
    visitDate DATE,
    prescription VARCHAR(255),
    admissionDate DATE,
    admissionReason VARCHAR(255),
    dischargeDate DATE,
    inpatient_flag BIT,
    outpatient_flag BIT,
    Insurance_ID INT
);
CREATE TABLE Insurance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Insurance_ID INT,
    policy_number VARCHAR(50),
    company VARCHAR(100),
    end_date DATE,
	Coverage_Percentage INT
);
CREATE TABLE Invoice (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Invoice_ID INT,
    status VARCHAR(50),
    date DATE,
    amount DECIMAL(10, 2),
    Insurance_ID INT,
    Lab_Test_ID INT,
    TreatmentID INT,
    Appointment_ID INT,
    Room_ID INT,
	Patient_ID INT,
    Registration_ID INT,
	Operation_ID INT
);
CREATE TABLE Treatment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    TreatmentID INT,
    description VARCHAR(255),
    date DATE,
    quantity INT,
    dispenseDate DATE,
    Patient_ID INT NOT NULL,
    Medicine_ID INT
);
CREATE TABLE Appointment (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Appointment_ID INT,
    Date DATE,
    Time TIME,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL
);
CREATE TABLE Lab_Test (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Lab_test_id INT,
    test_date DATE,
    test_result VARCHAR(255),
	price DECIMAL(10, 2),
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Test_Description VARCHAR(255),
    test_name VARCHAR(100),
);
CREATE TABLE Room (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Room_ID INT,
    Room_type VARCHAR(50),
    Occupied BIT,
	price DECIMAL(10, 2)
);
CREATE TABLE Registration (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Registration_ID INT,
    Registration_Date DATE,
    Discharge_Date DATE,
    Patient_ID INT NOT NULL,
    Room_ID INT,
    Doctor_ID INT NOT NULL
);
CREATE TABLE Employee (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Employee_ID INT,
    Name VARCHAR(100),
    Phone_Number VARCHAR(30),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Emergency_Contact VARCHAR(100),
    DOB DATE,
    HireDate DATE,
    DepartmentID INT,
    Insurance_ID INT,
    Salary DECIMAL(10, 2),
    Role VARCHAR(50)
);
CREATE TABLE Department (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentID INT,
    Department_Name VARCHAR(100),
    Manager_ID INT,
    ContactNumber VARCHAR(30)
);
CREATE TABLE Doctor (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Doctor_ID INT,
    position VARCHAR(100),
	appointment_price DECIMAL(10, 2),
    Medical_License_Number VARCHAR(50),
);
CREATE TABLE Nurse (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Nurse_ID INT,
    Shift VARCHAR(50)
);
CREATE TABLE Attendance (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Attendance_ID INT,
    Employee_ID INT NOT NULL,
    CheckIn DATETIME,
    CheckOut DATETIME
);
CREATE TABLE Operation(
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Operation_ID INT,
    type VARCHAR(100),
    start_time DateTIME,
    end_time DateTIME,
    status VARCHAR(50),
	price DECIMAL(10, 2),
	Room_ID INT NOT NULL,
    Patient_ID INT NOT NULL,
    History_ID INT,
);
CREATE TABLE Doc_Op (
	ID INT IDENTITY(1,1) PRIMARY KEY,
    Operation_ID INT,
    Employee_ID INT
);
CREATE TABLE Govern(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Nurse_ID INT NOT NULL,
	Room_ID INT NOT NULL,
	StartTime DateTime,
	EndTime DateTime
);
DECLARE @TableName NVARCHAR(255);
DECLARE @SQL NVARCHAR(MAX);

-- Create a cursor to loop through all tables
DECLARE table_cursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

OPEN table_cursor;

FETCH NEXT FROM table_cursor INTO @TableName;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = N'ALTER TABLE ' + QUOTENAME(@TableName) + ' ADD HashCode NVARCHAR(1000), LandingDate DATE, StartDate DATETIME, EndDate DATETIME, RowStatus varchar(1), IsLatest varchar(1);';
    EXEC sp_executesql @SQL;
    FETCH NEXT FROM table_cursor INTO @TableName;
END;
CLOSE table_cursor;
DEALLOCATE table_cursor;

----FKs:
----Appointment FKs
--ALTER TABLE [dbo].[Appointment] ADD CONSTRAINT [FK__Appointme__Emplo__4D94879B] FOREIGN KEY([Doctor_ID])
--REFERENCES [dbo].[Doctor] ([Doctor_ID])
--GO
--ALTER TABLE [dbo].[Appointment] ADD CONSTRAINT [FK__Appointme__Patie__4CA06362] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO

----Attendance FKs
--ALTER TABLE [dbo].[Attendance] ADD CONSTRAINT [FK__Attendanc__Emplo__571DF1D5] FOREIGN KEY([Employee_ID])
--REFERENCES [dbo].[Employee] ([Employee_ID])
--GO

----Deparmtent FKs
--ALTER TABLE [dbo].[Department] ADD CONSTRAINT [FK__Dept__Emplo__231DF1D5] FOREIGN KEY([Manager_ID])
--REFERENCES [dbo].[Employee] ([Employee_ID])
--GO

----Doc_Op FKs
--ALTER TABLE [dbo].[Doc_Op] ADD CONSTRAINT [FK__Doc_Op__Employee__5812160E] FOREIGN KEY([Employee_ID])
--REFERENCES [dbo].Employee (Employee_ID)
--GO
--ALTER TABLE [dbo].[Doc_Op] ADD CONSTRAINT [FK__Doc_Op__Operatio__59063A47] FOREIGN KEY([Operation_ID])
--REFERENCES [dbo].[Operation] ([Operation_ID])
--GO

----Doctor FKs
--ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [FK__Doctor__Departme__5535A963] FOREIGN KEY([DepartmentID])
--REFERENCES [dbo].[Department] ([DepartmentID])
--GO
--ALTER TABLE [dbo].[Doctor] ADD CONSTRAINT [FK__Doctor__Employee__5441852A] FOREIGN KEY([Doctor_ID])
--REFERENCES [dbo].[Employee] ([Employee_ID])
--GO

----Employee FKs
--ALTER TABLE [dbo].[Employee] ADD CONSTRAINT [FK__Employee__Depart__534D60F1] FOREIGN KEY([DepartmentID])
--REFERENCES [dbo].[Department] ([DepartmentID])
--GO

----Govern FKs
--ALTER TABLE [dbo].[Govern] ADD CONSTRAINT [FK__Govern__Employee__5DCAEF64] FOREIGN KEY(Nurse_ID)
--REFERENCES [dbo].[Nurse] ([Nurse_ID])
--GO
--ALTER TABLE [dbo].[Govern] ADD CONSTRAINT [FK__Govern__Room_ID__5EBF139D] FOREIGN KEY([Room_ID])
--REFERENCES [dbo].[Room] ([Room_ID])
--GO

----Invoice FKs
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Appoint__47DBAE45] FOREIGN KEY([Appointment_ID])
--REFERENCES [dbo].[Appointment] ([Appointment_ID])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Insuran__44FF419A] FOREIGN KEY([Insurance_ID])
--REFERENCES [dbo].[Insurance] ([Insurance_ID])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Lab_tes__45F365D3] FOREIGN KEY([Lab_test_id])
--REFERENCES [dbo].[Lab_Test] ([Lab_test_id])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Operati__01142BA1] FOREIGN KEY([Operation_ID])
--REFERENCES [dbo].[Operation] ([Operation_ID])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Patient__49C3F6B7] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Registr__48CFD27E] FOREIGN KEY([Registration_ID])
--REFERENCES [dbo].[Registration] ([Registration_ID])
--GO
--ALTER TABLE [dbo].[Invoice] ADD CONSTRAINT [FK__Invoice__Treatme__46E78A0C] FOREIGN KEY([TreatmentID])
--REFERENCES [dbo].[Treatment] ([TreatmentID])
--GO

----LabTest FKs
--ALTER TABLE [dbo].[Lab_Test] ADD CONSTRAINT [FK__Lab_Test__Employ__4F7CD00D] FOREIGN KEY([Doctor_ID])
--REFERENCES [dbo].[Doctor] ([Doctor_ID])
--GO
--ALTER TABLE [dbo].[Lab_Test]  ADD CONSTRAINT [FK__Lab_Test__Patien__4E88ABD4] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO

----MedicalHistory FKs
--ALTER TABLE [dbo].[Medical_history] ADD CONSTRAINT [FK__Medical_h__Patie__4316F928] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO

----Nurse FKs
--ALTER TABLE [dbo].[Nurse] ADD CONSTRAINT [FK__Nurse__Employee___5629CD9C] FOREIGN KEY([Nurse_ID])
--REFERENCES [dbo].[Employee] ([Employee_ID])
--GO

----Operation FKs
--ALTER TABLE [dbo].[Operation] ADD CONSTRAINT [FK__Operation__Histo__5CD6CB2B] FOREIGN KEY([History_ID])
--REFERENCES [dbo].[Medical_history] ([History_ID])
--GO
--ALTER TABLE [dbo].[Operation] ADD CONSTRAINT [FK__Operation__Patie__5BE2A6F2] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO
--ALTER TABLE [dbo].[Operation] ADD CONSTRAINT [FK__Operation__Room___59FA5E80] FOREIGN KEY([Room_ID])
--REFERENCES [dbo].[Room] ([Room_ID])
--GO

----Patient FKs
--ALTER TABLE [dbo].[Patient] ADD CONSTRAINT [FK__Patient__Insuran__440B1D61] FOREIGN KEY([Insurance_ID])
--REFERENCES [dbo].[Insurance] ([Insurance_ID])
--GO

----Registration FKs
--ALTER TABLE [dbo].[Registration] ADD CONSTRAINT [FK__Registrat__Emplo__52593CB8] FOREIGN KEY([Doctor_ID])
--REFERENCES [dbo].[Doctor] ([Doctor_ID])
--GO
--ALTER TABLE [dbo].[Registration] ADD CONSTRAINT [FK__Registrat__Patie__5070F446] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO
--ALTER TABLE [dbo].[Registration] ADD CONSTRAINT [FK__Registrat__Room___5165187F] FOREIGN KEY([Room_ID])
--REFERENCES [dbo].[Room] ([Room_ID])
--GO

----Treatment FKs
--ALTER TABLE [dbo].[Treatment] ADD CONSTRAINT [FK__Treatment__Medic__4BAC3F29] FOREIGN KEY([Medicine_id])
--REFERENCES [dbo].[Pharmacy_storage] ([Medicine_id])
--GO
--ALTER TABLE [dbo].[Treatment] ADD CONSTRAINT [FK__Treatment__Patie__4AB81AF0] FOREIGN KEY([Patient_ID])
--REFERENCES [dbo].[Patient] ([Patient_ID])
--GO