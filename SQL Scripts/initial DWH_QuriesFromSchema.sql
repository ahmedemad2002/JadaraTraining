USE HMS_DWH
--fact Operation
CREATE SCHEMA Op_DW 
GO
CREATE TABLE Op_DW.Fact_Operations (
    Operation_Surrogate_ID INT IDENTITY(1,1) PRIMARY KEY
);
GO
ALTER TABLE Op_DW.Fact_Operations ADD Employee_ID INT;
ALTER TABLE Op_DW.Fact_Operations ADD Patient_ID INT;
ALTER TABLE Op_DW.Fact_Operations ADD Operation_ID INT;
ALTER TABLE Op_DW.Fact_Operations ADD Department_ID INT;
ALTER TABLE Op_DW.Fact_Operations ADD DateID INT;
ALTER TABLE Op_DW.Fact_Operations ADD Duration_Of_Operation DECIMAL(5, 2); -- Duration of Operation
ALTER TABLE Op_DW.Fact_Operations ADD Patient_Age INT;
ALTER TABLE Op_DW.Fact_Operations ADD Operation_Price DECIMAL(10, 2); -- Operation Price


--DIM_OP
CREATE SCHEMA O_DW;
GO
CREATE TABLE O_DW.DimOperation (
    Operation_ID INT PRIMARY KEY -- Business Key (BK)
);
GO
ALTER TABLE O_DW.DimOperation ADD Type VARCHAR(50);
ALTER TABLE O_DW.DimOperation ADD End_Time DATETIME;
ALTER TABLE O_DW.DimOperation ADD Start_Time DATETIME;
ALTER TABLE O_DW.DimOperation ADD Date DATE;
ALTER TABLE O_DW.DimOperation ADD Status VARCHAR(50);




--FactInvoice
CREATE SCHEMA FC_DW;
GO

CREATE TABLE FC_DW.FactInvoice (
    Invoice_Surrogate_ID INT IDENTITY(1,1) PRIMARY KEY -- Surrogate Key (SK)
);
GO
ALTER TABLE FC_DW.FactInvoice ADD Treatment_ID INT;
ALTER TABLE FC_DW.FactInvoice ADD Patient_ID INT;
ALTER TABLE FC_DW.FactInvoice ADD Department_ID INT;
ALTER TABLE FC_DW.FactInvoice ADD Insurance_ID INT;
ALTER TABLE FC_DW.FactInvoice ADD TreatmentDate DATE;
ALTER TABLE FC_DW.FactInvoice ADD ExpirationDate DATE;
ALTER TABLE FC_DW.FactInvoice ADD PaymentDate DATE;
ALTER TABLE FC_DW.FactInvoice ADD Treatment_Type VARCHAR(50);
ALTER TABLE FC_DW.FactInvoice ADD Medicine_ID INT;
ALTER TABLE FC_DW.FactInvoice ADD InvoiceAmount DECIMAL(10, 2);
ALTER TABLE FC_DW.FactInvoice ADD Quantity INT;
ALTER TABLE FC_DW.FactInvoice ADD CoveragePercentage DECIMAL(5, 2);


--DIM_INV
CREATE SCHEMA Inv_DW;
GO
CREATE TABLE Inv_DW.DimInvoice (
    Invoice_ID INT PRIMARY KEY -- Primary Key
);
GO
ALTER TABLE Inv_DW.DimInvoice ADD Date DATE;
ALTER TABLE Inv_DW.DimInvoice ADD Status VARCHAR(50);



--Department_Dim
CREATE SCHEMA D_DW;
GO
CREATE TABLE D_DW.Department (
    DepartmentID INT PRIMARY KEY -- Primary Key (BK)
);
GO
ALTER TABLE D_DW.Department ADD Department_Name VARCHAR(100); -- Assuming the department name is a string of up to 100 characters
ALTER TABLE D_DW.Department ADD ContactNumber VARCHAR(20); -- Assuming the contact number is a string of up to 20 characters



--DIM_INSURANCE
CREATE SCHEMA In_DW;
GO
CREATE TABLE In_DW.DimInsurance (
    InsuranceID FLOAT PRIMARY KEY -- Primary Key (BK)
);
GO
ALTER TABLE In_DW.DimInsurance ADD Company VARCHAR(100); -- Assuming company name is a string of up to 100 characters
ALTER TABLE In_DW.DimInsurance ADD Coverage_Percentage DECIMAL(5, 2); -- Coverage percentage with two decimal places
ALTER TABLE In_DW.DimInsurance ADD Policy_Number VARCHAR(50); -- Assuming policy number is a string of up to 50 characters
ALTER TABLE In_DW.DimInsurance ADD End_Date DATE; -- End date of the policy



--Dim_Employee
CREATE SCHEMA E_DW;
GO
CREATE TABLE E_DW.DimEmployee (
    EmployeeID INT PRIMARY KEY -- Primary Key (BK)
);
GO
ALTER TABLE E_DW.DimEmployee ADD Name VARCHAR(100); -- Assuming the employee's name is a string of up to 100 characters
ALTER TABLE E_DW.DimEmployee ADD DOB DATE; -- Date of Birth
ALTER TABLE E_DW.DimEmployee ADD Insurance VARCHAR(100); -- Assuming insurance details are a string of up to 100 characters
ALTER TABLE E_DW.DimEmployee ADD Emergency_Contact VARCHAR(100); -- Emergency contact information
ALTER TABLE E_DW.DimEmployee ADD Email VARCHAR(100); -- Email address
ALTER TABLE E_DW.DimEmployee ADD Salary DECIMAL(10, 2); -- Salary with two decimal places
ALTER TABLE E_DW.DimEmployee ADD Phone_Number VARCHAR(20); -- Phone number
ALTER TABLE E_DW.DimEmployee ADD HireDate DATE; -- Hire date
ALTER TABLE E_DW.DimEmployee ADD Position VARCHAR(50); -- Job position



--Dim_PHarmacy
CREATE SCHEMA Ph_DW;
GO
CREATE TABLE Ph_DW.DimPharmacyStorage (
    Medicine_ID INT PRIMARY KEY -- Business Key (BK)
);
GO
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Treatment_ID INT;
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Name VARCHAR(100); -- Assuming medicine name is a string of up to 100 characters
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Current_Quantity INT;
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Minimum_Quantity INT;
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Quantity_Order INT;
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Price DECIMAL(10, 2); -- Price with two decimal places
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Expiration_Date DATE;
ALTER TABLE Ph_DW.DimPharmacyStorage ADD Description VARCHAR(255); -- Assuming description is a string of up to 255 characters


--Dim_Patient
CREATE SCHEMA P_DW;
GO
CREATE TABLE P_DW.DimPatient (
    Patient_ID INT PRIMARY KEY -- Business Key (BK)
);
GO
ALTER TABLE P_DW.DimPatient ADD Patient_Name VARCHAR(100); -- Assuming the patient name is a string of up to 100 characters
ALTER TABLE P_DW.DimPatient ADD DOB DATE; -- Date of Birth
ALTER TABLE P_DW.DimPatient ADD BloodType VARCHAR(3); -- Blood Type (e.g., "A+", "O-")
ALTER TABLE P_DW.DimPatient ADD Nationality VARCHAR(50); -- Nationality as a string
ALTER TABLE P_DW.DimPatient ADD Gender VARCHAR(10); -- Gender
ALTER TABLE P_DW.DimPatient ADD Phone_Number VARCHAR(20); -- Phone number
ALTER TABLE P_DW.DimPatient ADD Emergency_Contact VARCHAR(100); -- Emergency contact information
ALTER TABLE P_DW.DimPatient ADD Admission_Date DATE; -- Admission date
ALTER TABLE P_DW.DimPatient ADD Admission_Reason VARCHAR(255); -- Reason for admission
ALTER TABLE P_DW.DimPatient ADD Prescription VARCHAR(255); -- Prescription details
ALTER TABLE P_DW.DimPatient ADD Visit_Date DATE; -- Visit date
ALTER TABLE P_DW.DimPatient ADD Discharge_Date DATE; -- Discharge date


--Dim_Date
CREATE SCHEMA Shared;
GO
CREATE TABLE Shared.DimDate (
    DateID INT PRIMARY KEY -- Business Key (BK)
);
GO
ALTER TABLE Shared.DimDate ADD Date_Seq INT;
ALTER TABLE Shared.DimDate ADD Date DATE;
ALTER TABLE Shared.DimDate ADD FullDate VARCHAR(50); -- Full date in string format (e.g., "January 1, 2023")
ALTER TABLE Shared.DimDate ADD Day INT;
ALTER TABLE Shared.DimDate ADD DaySuffix VARCHAR(5); -- e.g., "st", "nd", "rd", "th"
ALTER TABLE Shared.DimDate ADD DayName VARCHAR(10); -- e.g., "Monday", "Tuesday"
ALTER TABLE Shared.DimDate ADD DaySeqInWeek INT; -- Sequence of the day in the week (1=Monday, 7=Sunday)
ALTER TABLE Shared.DimDate ADD WeekInMonth INT; -- Week number within the month
ALTER TABLE Shared.DimDate ADD WeekInYear INT; -- Week number within the year
ALTER TABLE Shared.DimDate ADD WeekInYearName VARCHAR(50); -- e.g., "Week 32"
ALTER TABLE Shared.DimDate ADD WeekInYearDesc VARCHAR(100); -- e.g., "August 7–13, 2023"
ALTER TABLE Shared.DimDate ADD WeekInYearNum INT;
ALTER TABLE Shared.DimDate ADD WeekInQuarter INT; -- Week number within the quarter
ALTER TABLE Shared.DimDate ADD WeekOfYear INT; -- Equivalent to WeekInYear
ALTER TABLE Shared.DimDate ADD Month INT; -- Month number (1=January, 12=December)
ALTER TABLE Shared.DimDate ADD MonthName VARCHAR(20); -- e.g., "January", "February"
ALTER TABLE Shared.DimDate ADD MonthOfQuarter INT; -- Month sequence within the quarter (1–3)
ALTER TABLE Shared.DimDate ADD Quarter INT; -- Quarter number (1–4)
ALTER TABLE Shared.DimDate ADD QuarterYear VARCHAR(20); -- e.g., "Q1 2023"
ALTER TABLE Shared.DimDate ADD QuarterName VARCHAR(10); -- e.g., "Q1", "Q2"
ALTER TABLE Shared.DimDate ADD QuarterYearNum INT; -- Numeric representation for year-quarter
ALTER TABLE Shared.DimDate ADD Year INT; -- e.g., 2023
ALTER TABLE Shared.DimDate ADD YearName VARCHAR(10); -- e.g., "2023"
ALTER TABLE Shared.DimDate ADD MonthYear VARCHAR(10); -- e.g., "Jan 2023"
ALTER TABLE Shared.DimDate ADD MonthYearNum INT; -- Numeric month-year (e.g., 202301 for Jan 2023)
ALTER TABLE Shared.DimDate ADD FirstDayOfMonth DATE;
ALTER TABLE Shared.DimDate ADD FirstDayOfMonthNum INT;
ALTER TABLE Shared.DimDate ADD LastDayOfMonth DATE;
ALTER TABLE Shared.DimDate ADD LastDayOfMonthNum INT;
ALTER TABLE Shared.DimDate ADD FirstDayInQuarter DATE;
ALTER TABLE Shared.DimDate ADD FirstDayInQuarterNum INT;
ALTER TABLE Shared.DimDate ADD LastDayInQuarter DATE;
ALTER TABLE Shared.DimDate ADD LastDayInQuarterNum INT;
ALTER TABLE Shared.DimDate ADD FirstDayInYear DATE;
ALTER TABLE Shared.DimDate ADD FirstYearInDayNum INT;
ALTER TABLE Shared.DimDate ADD LastDayInYearNum INT;
ALTER TABLE Shared.DimDate ADD IsHoliday BIT; -- Indicates whether the date is a holiday (1=true, 0=false)
ALTER TABLE Shared.DimDate ADD IsWeekDay BIT; -- Indicates whether the date is a weekday (1=true, 0=false)
ALTER TABLE Shared.DimDate ADD HolidayName VARCHAR(100); -- Name of the holiday (if applicable)



--Fact_Attendance
CREATE SCHEMA ATT_DW;
GO

CREATE TABLE ATT_DW.FactAttendance (
    Attendance_Surrogate_ID INT IDENTITY(1,1) PRIMARY KEY -- Surrogate Key (SK)
);
GO
ALTER TABLE ATT_DW.FactAttendance ADD Employee_ID INT; -- Foreign key for Employee
ALTER TABLE ATT_DW.FactAttendance ADD Attendance_ID INT; -- Foreign key for Attendance ID
ALTER TABLE ATT_DW.FactAttendance ADD DateID INT; -- Foreign key for Date ID
ALTER TABLE ATT_DW.FactAttendance ADD Working_Hours DECIMAL(5, 2); -- Working hours (e.g., 8.00 hours)
ALTER TABLE ATT_DW.FactAttendance ADD Attendance_Per_Months INT; -- Number of attendance days in the month
ALTER TABLE ATT_DW.FactAttendance ADD CheckIn DATETIME; -- Check-in time
ALTER TABLE ATT_DW.FactAttendance ADD CheckOut DATETIME; -- Check-out time
