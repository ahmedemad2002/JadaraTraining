CREATE DATABASE HMS_DWH;
GO
USE HMS_DWH;
GO
ALTER DATABASE HMS_DWH COLLATE SQL_Latin1_General_CP1_CI_AS;
GO
-- Create the schema if it does not exist
CREATE SCHEMA Shared;
GO
--FactOperation
CREATE SCHEMA Op;
GO
-- Create the schema if it does not exist
CREATE SCHEMA Inv;
GO
-- Create the schema if it does not exist
CREATE SCHEMA Att;
GO

-- Create the FactOperation table within the Op schema with just the surrogate key
CREATE TABLE Op.FactOperation (
    OperationBK INT IDENTITY(1,1) PRIMARY KEY
);
GO
ALTER TABLE Op.FactOperation ADD OperationID INT;
ALTER TABLE Op.FactOperation ADD EmployeeID INT;
ALTER TABLE Op.FactOperation ADD PatientID INT;
ALTER TABLE Op.FactOperation ADD DepartmentID INT;
ALTER TABLE Op.FactOperation ADD DateID BIGINT;
ALTER TABLE Op.FactOperation ADD DurationOfOperation DECIMAL(10, 2); -- Duration of Operation
ALTER TABLE Op.FactOperation ADD PatientAge INT;
ALTER TABLE Op.FactOperation ADD OperationPrice DECIMAL(10, 2); -- Operation Price
ALTER TABLE Op.FactOperation ADD HashCode NVarChar(1000);
ALTER TABLE Op.FactOperation ADD ValidFrom DATE;
ALTER TABLE Op.FactOperation ADD ValidTo DATE;
ALTER TABLE Op.FactOperation ADD RowStatus VARCHAR(1);
ALTER TABLE Op.FactOperation ADD IsLatest VARCHAR(1);
GO

--DIM_OP
CREATE TABLE Op.DimOperation (
    OperationSK INT IDENTITY(1,1) PRIMARY KEY -- Business Key (BK)
);
GO
ALTER TABLE OP.DimOperation ADD OperationID INT;
ALTER TABLE Op.DimOperation ADD Type VARCHAR(50);
ALTER TABLE Op.DimOperation ADD End_Time DATETIME;
ALTER TABLE Op.DimOperation ADD Start_Time DATETIME;
ALTER TABLE Op.DimOperation ADD [Date] DATE;
ALTER TABLE Op.DimOperation ADD [Status] VARCHAR(50);
ALTER TABLE Op.DimOperation ADD HashCode NVARCHAR(1000);
ALTER TABLE Op.DimOperation ADD ValidFrom DATE;
ALTER TABLE Op.DimOperation ADD ValidTo DATE;
ALTER TABLE Op.DimOperation ADD RowStatus VARCHAR(1);
ALTER TABLE Op.DimOperation ADD IsLatest VARCHAR(1);
GO


-- FactInvoice
-- Create the FactInvoice table within the INV schema with just the surrogate key
CREATE TABLE INV.FactInvoice (
    InvoiceBK INT IDENTITY(1,1) PRIMARY KEY -- Surrogate Key (SK)
);
GO
-- Add other attributes to the FactInvoice table
ALTER TABLE INV.FactInvoice ADD InvoiceID INT;
ALTER TABLE INV.FactInvoice ADD InvoiceDate BIGINT;
ALTER TABLE INV.FactInvoice ADD TreatmentID INT;
ALTER TABLE INV.FactInvoice ADD PatientID INT;
ALTER TABLE INV.FactInvoice ADD InsuranceID INT;
ALTER TABLE INV.FactInvoice ADD TreatmentDate DATE;
ALTER TABLE INV.FactInvoice ADD ExpirationDate DATE;
ALTER TABLE INV.FactInvoice ADD PaymentDate DATE;
--ALTER TABLE INV.FactInvoice ADD TreatmentType VARCHAR(50);
ALTER TABLE INV.FactInvoice ADD MedicineID INT;
ALTER TABLE INV.FactInvoice ADD InvoiceAmount DECIMAL(10, 2);
ALTER TABLE INV.FactInvoice ADD Quantity INT;
ALTER TABLE INV.FactInvoice ADD CoveragePercentage DECIMAL(5, 2);
ALTER TABLE INV.FactInvoice ADD HashCode NVarChar(1000);
ALTER TABLE INV.FactInvoice ADD ValidFrom DATE;
ALTER TABLE INV.FactInvoice ADD ValidTo DATE;
ALTER TABLE INV.FactInvoice ADD RowStatus VARCHAR(1);
ALTER TABLE INV.FactInvoice ADD IsLatest VARCHAR(1);
GO


-- Create the DimInvoice table within the INV schema with just the primary key
CREATE TABLE INV.DimInvoice (
    InvoiceSK INT IDENTITY(1,1) PRIMARY KEY -- Primary Key
);
GO
-- Add other attributes to the DimInvoice table
ALTER TABLE INV.DimInvoice ADD InvoiceID INT;
ALTER TABLE INV.DimInvoice ADD Date DATE;
ALTER TABLE INV.DimInvoice ADD Status VARCHAR(50);
ALTER TABLE INV.DimInvoice ADD HashCode NVARCHAR(1000);
ALTER TABLE INV.DimInvoice ADD ValidFrom DATE;
ALTER TABLE INV.DimInvoice ADD ValidTo DATE;
ALTER TABLE INV.DimInvoice ADD RowStatus VARCHAR(1);
ALTER TABLE INV.DimInvoice ADD IsLatest VARCHAR(1);
GO

CREATE TABLE Shared.DimDepartment (
    DepartmentSK INT IDENTITY(1,1) PRIMARY KEY -- Surrogate Key (SK)
);
GO
ALTER TABLE Shared.DimDepartment ADD DepartmentID INT;
ALTER TABLE Shared.DimDepartment ADD DepartmentName VARCHAR(100); -- Assuming the department name is a string of up to 100 characters
ALTER TABLE Shared.DimDepartment ADD ContactNumber VARCHAR(20); -- Assuming the contact number is a string of up to 20 characters
ALTER TABLE Shared.DimDepartment ADD HashCode NVARCHAR(1000);
ALTER TABLE Shared.DimDepartment ADD ValidFrom DATE;
ALTER TABLE Shared.DimDepartment ADD ValidTo DATE;
ALTER TABLE Shared.DimDepartment ADD RowStatus VARCHAR(1);
ALTER TABLE Shared.DimDepartment ADD IsLatest VARCHAR(1);
GO

--DIM_INSURANCE
-- Create the DimInsurance table within the Inv schema with just the primary key
CREATE TABLE Inv.DimInsurance (
    InsuranceSK INT IDENTITY(1,1) PRIMARY KEY -- Primary Key (BK)
);
GO
-- Add other attributes to the DimInsurance table
ALTER TABLE Inv.DimInsurance ADD InsuranceID INT;
ALTER TABLE Inv.DimInsurance ADD Company VARCHAR(100); -- Assuming company name is a string of up to 100 characters
ALTER TABLE Inv.DimInsurance ADD CoveragePercentage DECIMAL(5, 2); -- Coverage percentage with two decimal places
ALTER TABLE Inv.DimInsurance ADD PolicyNumber VARCHAR(50); -- Assuming policy number is a string of up to 50 characters
ALTER TABLE Inv.DimInsurance ADD EndDate DATE; -- End date of the policy
ALTER TABLE Inv.DimInsurance ADD HashCode NVARCHAR(1000);
ALTER TABLE Inv.DimInsurance ADD ValidFrom DATE;
ALTER TABLE Inv.DimInsurance ADD ValidTo DATE;
ALTER TABLE Inv.DimInsurance ADD RowStatus VARCHAR(1);
ALTER TABLE Inv.DimInsurance ADD IsLatest VARCHAR(1);
GO


-- Create the DimEmployee table within the Shared schema with just the primary key
CREATE TABLE Shared.DimEmployee (
    EmployeeSK INT IDENTITY(1,1) PRIMARY KEY -- Primary Key (BK)
);
GO
ALTER TABLE Shared.DimEmployee ADD EmployeeID INT;
ALTER TABLE Shared.DimEmployee ADD [Name] VARCHAR(100); -- Assuming the employee's name is a string of up to 100 characters
ALTER TABLE Shared.DimEmployee ADD DOB DATE; -- Date of Birth
ALTER TABLE Shared.DimEmployee ADD Insurance VARCHAR(100); -- Assuming insurance details are a string of up to 100 characters
ALTER TABLE Shared.DimEmployee ADD EmergencyContact VARCHAR(100); -- Emergency contact information
ALTER TABLE Shared.DimEmployee ADD Email VARCHAR(100); -- Email address
ALTER TABLE Shared.DimEmployee ADD Salary DECIMAL(10, 2); -- Salary with two decimal places
ALTER TABLE Shared.DimEmployee ADD PhoneNumber VARCHAR(30); -- Phone number
ALTER TABLE Shared.DimEmployee ADD HireDate DATE; -- Hire date
ALTER TABLE Shared.DimEmployee ADD Position VARCHAR(50); -- Job position
ALTER TABLE Shared.DimEmployee ADD HashCode NVARCHAR(1000);
ALTER TABLE Shared.DimEmployee ADD ValidFrom DATE;
ALTER TABLE Shared.DimEmployee ADD ValidTo DATE;
ALTER TABLE Shared.DimEmployee ADD RowStatus VARCHAR(1);
ALTER TABLE Shared.DimEmployee ADD IsLatest VARCHAR(1);
GO


--Dim_PHarmacy
-- Create the DimPharmacyStorage table within the Inv schema with just the primary key
CREATE TABLE Inv.DimPharmacyStorage (
    MedicineID INT IDENTITY(1,1) PRIMARY KEY -- Business Key (BK)
);
GO
-- Add other attributes to the DimPharmacyStorage table
ALTER TABLE Inv.DimPharmacyStorage ADD TreatmentID INT;
ALTER TABLE Inv.DimPharmacyStorage ADD Name VARCHAR(100); -- Assuming medicine name is a string of up to 100 characters
ALTER TABLE Inv.DimPharmacyStorage ADD CurrentQuantity INT;
ALTER TABLE Inv.DimPharmacyStorage ADD MinimumQuantity INT;
ALTER TABLE Inv.DimPharmacyStorage ADD QuantityOrder INT;
ALTER TABLE Inv.DimPharmacyStorage ADD Price DECIMAL(10, 2); -- Price with two decimal places
ALTER TABLE Inv.DimPharmacyStorage ADD ExpirationDate DATE;
ALTER TABLE Inv.DimPharmacyStorage ADD Description VARCHAR(255); -- Assuming description is a string of up to 255 characters
ALTER TABLE Inv.DimPharmacyStorage ADD HashCode NVARCHAR(1000);
ALTER TABLE Inv.DimPharmacyStorage ADD ValidFrom DATE;
ALTER TABLE Inv.DimPharmacyStorage ADD ValidTo DATE;
ALTER TABLE Inv.DimPharmacyStorage ADD RowStatus VARCHAR(1);
ALTER TABLE Inv.DimPharmacyStorage ADD IsLatest VARCHAR(1);
GO

--Dim_Patient
-- Create the DimPatient table within the Shared schema with just the primary key
CREATE TABLE Shared.DimPatient (
    PatientSK INT IDENTITY(1,1) PRIMARY KEY -- Business Key (BK)
);
GO

-- Add other attributes to the DimPatient table
ALTER TABLE Shared.DimPatient ADD PatientID INT
ALTER TABLE Shared.DimPatient ADD PatientName VARCHAR(100); -- Assuming the patient name is a string of up to 100 characters
ALTER TABLE Shared.DimPatient ADD DOB DATE; -- Date of Birth
ALTER TABLE Shared.DimPatient ADD BloodType VARCHAR(3); -- Blood Type (e.g., "A+", "O-")
ALTER TABLE Shared.DimPatient ADD Nationality VARCHAR(50); -- Nationality as a string
ALTER TABLE Shared.DimPatient ADD Gender VARCHAR(10); -- Gender
ALTER TABLE Shared.DimPatient ADD PhoneNumber VARCHAR(30); -- Phone number
ALTER TABLE Shared.DimPatient ADD EmergencyContact VARCHAR(100); -- Emergency contact information
ALTER TABLE Shared.DimPatient ADD AdmissionDate DATE; -- Admission date
ALTER TABLE Shared.DimPatient ADD AdmissionReason VARCHAR(255); -- Reason for admission
ALTER TABLE Shared.DimPatient ADD Prescription VARCHAR(255); -- Prescription details
ALTER TABLE Shared.DimPatient ADD VisitDate DATE; -- Visit date
ALTER TABLE Shared.DimPatient ADD DischargeDate DATE; -- Discharge date
ALTER TABLE Shared.DimPatient ADD HashCode NVARCHAR(1000);
ALTER TABLE Shared.DimPatient ADD ValidFrom DATE;
ALTER TABLE Shared.DimPatient ADD ValidTo DATE;
ALTER TABLE Shared.DimPatient ADD RowStatus VARCHAR(1);
ALTER TABLE Shared.DimPatient ADD IsLatest VARCHAR(1);
GO


--Fact_Attendance


-- Create the FactAttendance table within the ATT schema with just the primary key
CREATE TABLE ATT.FactAttendance (
    AttendanceBK INT IDENTITY(1,1) PRIMARY KEY -- Surrogate Key (SK)
);
GO
-- Add other attributes to the FactAttendance table
ALTER TABLE ATT.FactAttendance ADD AttendanceID INT; -- Foreign key for Attendance ID
ALTER TABLE ATT.FactAttendance ADD EmployeeID INT; -- Foreign key for Employee
ALTER TABLE ATT.FactAttendance ADD DateID BIGINT; -- Foreign key for Date ID
ALTER TABLE ATT.FactAttendance ADD WorkingHours DECIMAL(5, 2); -- Working hours (e.g., 8.00 hours)
ALTER TABLE ATT.FactAttendance ADD CheckIn DATETIME; -- Check-in time
ALTER TABLE ATT.FactAttendance ADD CheckOut DATETIME; -- Check-out time
ALTER TABLE ATT.FactAttendance ADD HashCode nVarChar(1000);
ALTER TABLE ATT.FactAttendance ADD ValidFrom DATE;
ALTER TABLE ATT.FactAttendance ADD ValidTo DATE;
ALTER TABLE ATT.FactAttendance ADD RowStatus VARCHAR(1);
ALTER TABLE ATT.FactAttendance ADD IsLatest VARCHAR(1);
GO



BEGIN TRY
    DROP TABLE DimDate
END TRY

BEGIN CATCH
    /*No Action*/
END CATCH

CREATE TABLE [DimDate]
(
    [DateSk] BIGINT primary key,
	[Date_Seq]  INT, 
	[DateNum] INT,
    [Date] DATE,
    [FullDate] CHAR(10),-- Date in MM-dd-yyyy format
    [Day] VARCHAR(2), -- Field will hold day number of Month
    [DaySuffix] VARCHAR(4), -- Apply suffix as 1st, 2nd ,3rd etc
    [DayName] VARCHAR(9), -- Contains name of the day, Sunday, Monday 
    [DaySeqInWeek] CHAR(1),-- First Day Sunday=1 and Saturday=7
    [WeekInMonth] VARCHAR(2), --1st Monday or 2nd Monday in Month
    [WeekInYear] VARCHAR(2),
	[WeekInYearName] VARCHAR(3),
	[WeekInYearDesc] VARCHAR(8),
	[WeekInYearNum] VARCHAR(6),
    [WeekInQuarter] VARCHAR(3), 
    [DayOfYear] VARCHAR(3),
    [WeekOfMonth] VARCHAR(1),-- Week Number of Month 
    [WeekOfQuarter] VARCHAR(2), --Week Number of the Quarter
    [WeekOfYear] VARCHAR(2),--Week Number of the Year
    [Month] VARCHAR(2), --Number of the Month 1 to 12
    [MonthName] VARCHAR(9),--January, February etc
    [MonthOfQuarter] VARCHAR(2),-- Month Number belongs to Quarter
    [Quarter] CHAR(1),
    [QuarterName] VARCHAR(9),--First,Second..
	[QuarterYear] VARCHAR(9),
	[QuarterYearNum] VARCHAR(9),
    [Year] CHAR(4),-- Year value of Date stored in Row
    [YearName] CHAR(7), --CY 2012,CY 2013
    [MonthYear] CHAR(10), --Jan-2013,Feb-2013
    [MonthYearNUM] CHAR(6),
    [FirstDayOfMonth] DATE,
	[FirstDayOfMonthNUM] INT,
    [LastDayOfMonth] DATE,
	[LastDayOfMonthNUM] int,
    [FirstDayInQuarter] DATE,
	[FirstDayInQuarterNUM] INT,
    [LastDayInQuarter] DATE,
	[LastDayInQuarterNUM] INT,
    [FirstDayInYear] DATE,
	[FirstDayInYearNUM] INT,
    [LastDayInYear] DATE,
	[LastDayInYearNUM] INT,
    [IsHoliday] BIT,-- Flag 1=National Holiday, 0-No National Holiday
    [IsWeekday] BIT,-- 0=Week End ,1=Week Day
    [HolidayName] VARCHAR(50),--Name of Holiday in US
)
GO

--=========================================================================================
--Specify Start Date and End date here
--Value of Start Date Must be Less than Your End Date 
--=========================================================================================

DECLARE @StartDate DATETIME = '01/01/1920' --Starting value of Date Range
DECLARE @EndDate DATETIME = '01/01/2100' --End Value of Date Range

--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE
    @WeekInMonth INT,
    @WeekInYear INT,
    @WeekInQuarter INT,
    @WeekOfMonth INT,
    @CurrentYear INT,
    @CurrentMonth INT,
    @CurrentQuarter INT

/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE
(
    DOW INT,
    MonthCount INT,
    QuarterCount INT,
    YearCount INT
)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

--Extract and assign various parts of Values from Current Date to Variable

DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

/********************************************************************************************/
--Proceed only if Start Date(Current date) is less than End date you specified above

WHILE @CurrentDate < @EndDate
/*Begin day of week logic*/
BEGIN
    /*Check for Change in Month of the Current date if Month changed then 
    Change variable value*/
    IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
    BEGIN
        UPDATE @DayOfWeek
        SET [MonthCount] = 0
        SET @CurrentMonth = DATEPART(MM, @CurrentDate)
    END

    /* Check for Change in Quarter of the Current date if Quarter changed then change 
        Variable value*/
    IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET [QuarterCount] = 0
        SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
    END

    /* Check for Change in Year of the Current date if Year changed then change 
        Variable value*/
    IF @CurrentYear != DATEPART(YY, @CurrentDate)
    BEGIN
        UPDATE @DayOfWeek
        SET YearCount = 0
        SET @CurrentYear = DATEPART(YY, @CurrentDate)
    END

    -- Set values in table data type created above from variables
    UPDATE @DayOfWeek
    SET 
        MonthCount = MonthCount + 1,
        QuarterCount = QuarterCount + 1,
        YearCount = YearCount + 1
    WHERE DOW = DATEPART(DW, @CurrentDate)

    SELECT
        @WeekInMonth = MonthCount,
        @WeekInQuarter = QuarterCount,
        @WeekInYear = YearCount
    FROM @DayOfWeek
    WHERE DOW = DATEPART(DW, @CurrentDate)
    
/*End day of week logic*/


/* Populate Your Dimension Table with values*/
    
    INSERT INTO DimDate
    SELECT
        
        CONVERT (char(8),@CurrentDate,112) as 'DateSk',
		1   as Date_Seq ,
		CONVERT (char(8),@CurrentDate,112) as 'DateNum',
        @CurrentDate AS 'Date',
        CONVERT (char(10),@CurrentDate,101) as 'FullDate',
        DATEPART(DD, @CurrentDate) AS 'Day',
        --Apply Suffix values like 1st, 2nd 3rd etc..
        CASE 
            WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
            WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
            ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
        END AS 'DaySuffix',
        
        DATENAME(DW, @CurrentDate) AS 'DayName',
        DATEPART(DW, @CurrentDate) AS 'DayOfWeek',
        @WeekInMonth AS 'WeekInMonth',
        @WeekInYear AS 'WeekInYear',
		'W'+CONVERT(VARCHAR,@WeekInYear) AS WeekInYearName,
		'W'+CONVERT(VARCHAR,@WeekInYear)+'-'+ CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))  AS WeekInYearDesc,
		CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) + RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @WeekInYear)),2)  AS 'WeekInYearNum',
        @WeekInQuarter AS 'WeekInQuarter',
        DATEPART(DY, @CurrentDate) AS 'DayOfYear',
        DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'WeekOfMonth',
        (DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), @CurrentDate) / 7) + 1 AS 'WeekOfQuarter',
        DATEPART(WW, @CurrentDate) AS 'WeekOfYear',
        DATEPART(MM, @CurrentDate) AS 'Month',
        DATENAME(MM, @CurrentDate) AS 'MonthName',
        CASE
            WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
            WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
            WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
        END AS 'MonthOfQuarter',
        DATEPART(QQ, @CurrentDate) AS 'Quarter',
        CASE DATEPART(QQ, @CurrentDate)
            WHEN 1 THEN 'Q1'
            WHEN 2 THEN 'Q2'
            WHEN 3 THEN 'Q3'
            WHEN 4 THEN 'Q4'
        END AS 'QuarterName',
		CASE DATEPART(QQ, @CurrentDate)
            WHEN 1 THEN 'Q1'+'-'+ CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) 
            WHEN 2 THEN 'Q2'+'-'+ CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) 
            WHEN 3 THEN 'Q3'+'-'+ CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) 
            WHEN 4 THEN 'Q4'+'-'+ CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) 
        END AS 'QuarterYear',
		CASE DATEPART(QQ, @CurrentDate)
            WHEN 1 THEN CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))   +'01'
            WHEN 2 THEN CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))  +'02'
            WHEN 3 THEN CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))  +'03'
            WHEN 4 THEN CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))  +'04'
        END AS 'QuarterYearNum',
        DATEPART(YEAR, @CurrentDate) AS 'Year',
        'CY ' + CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)) AS 'YearName',
        LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS 'MonthYear',
        CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) + RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)),2)   AS 'MMYYYY',
        CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, @CurrentDate) - 1), @CurrentDate))) AS 'FirstDayOfMonth',
		CONVERT (char(8),CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, @CurrentDate) - 1), @CurrentDate))),112) AS 'FirstDayOfMonthNUM',
        CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, @CurrentDate)))) AS 'LastDayOfMonth',
		CONVERT (char(8),CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, (DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, @CurrentDate)))),112) AS 'LastDayOfMonthNUM',
        DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS 'FirstDayInQuarter',
		CONVERT (char(8),DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0),112) AS 'FirstDayInQuarterNUM',
        DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS 'LastDayInQuarter',
		CONVERT (char(8),DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1),112) AS 'LastDayInQuarterNUM',
        CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'FirstDayInYear',
		CONVERT (char(8),CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))),112) AS 'FirstDayInYearNUM',
        CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))) AS 'LastDayInYear',
		CONVERT (char(8),CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY, @CurrentDate))),112) AS 'LastDayInYearNUM',
        NULL AS 'IsHoliday',
        CASE DATEPART(DW, @CurrentDate)
            WHEN 1 THEN 0
            WHEN 2 THEN 1
            WHEN 3 THEN 1
            WHEN 4 THEN 1
            WHEN 5 THEN 1
            WHEN 6 THEN 1
            WHEN 7 THEN 0
        END AS 'IsWeekday',
        NULL AS 'HolidayName'

    SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END
        
--============================================================================
-- Step 3.
-- Update Values of Holiday as per USA Govt. Declaration for National Holiday.
--============================================================================

/*Update HOLIDAY Field of USA In dimension*/
    /* New Years Day - January 1 */
    UPDATE DimDate
        SET HolidayName = 'New Year''s Day'
    WHERE [Month] = 1 AND [Day] = 1

    /* Martin Luther King, Jr. Day - Third Monday in January starting in 1983 */
    UPDATE DimDate
        SET HolidayName = 'Martin Luther King, Jr. Day'
    WHERE
        [Month] = 1 AND
        [DaySeqInWeek] = 'Monday' AND
        [Year] >= 1983 AND
        WeekInMonth = 3

    /* Valentine's Day - February 14 */
    UPDATE DimDate
        SET HolidayName = 'Valentine''s Day'
    WHERE
        [Month] = 2 AND
        [Day] = 14

    /* President's Day - Third Monday in February */
    UPDATE DimDate
        SET HolidayName = 'President''s Day'
    WHERE
        [Month] = 2 AND
        [DaySeqInWeek] = 'Monday' AND
        [WeekInMonth] = 3

    /* Saint Patrick's Day */
    UPDATE DimDate
        SET HolidayName = 'Saint Patrick''s Day'
    WHERE
        [Month] = 3 AND
        [Day] = 17

    /* Memorial Day - Last Monday in May */
    UPDATE DimDate
        SET HolidayName = 'Memorial Day'
    FROM DimDate
    WHERE DateSk IN 
    (
        SELECT
            MAX(DateSk)
        FROM DimDate
        WHERE
            [MonthName] = 'May' AND
            [DaySeqInWeek] = 'Monday'
        GROUP BY
            [Year],
            [Month]
    )

    /* Mother's Day - Second Sunday of May */
    UPDATE DimDate
        SET HolidayName = 'Mother''s Day'
    WHERE
        [Month] = 5 AND
        [DaySeqInWeek] = 'Sunday' AND
        [WeekInMonth] = 2

    /* Father's Day - Third Sunday of June */
    UPDATE DimDate
        SET HolidayName = 'Father''s Day'
    WHERE
        [Month] = 6 AND
        [DaySeqInWeek] = 'Sunday' AND
        [WeekInMonth] = 3

    /* Independence Day */
    UPDATE DimDate
        SET HolidayName = 'Independance Day'
    WHERE [Month] = 7 AND [Day] = 4

    /* Labor Day - First Monday in September */
    UPDATE DimDate
        SET HolidayName = 'Labor Day'
    FROM DimDate
    WHERE DateSk IN 
    (
        SELECT
            MIN(DateSk)
        FROM DimDate
        WHERE
            [MonthName] = 'September' AND
            [DaySeqInWeek] = 'Monday'
        GROUP BY
            [Year],
            [Month]
    )

    /* Columbus Day - Second MONDAY in October */
    UPDATE DimDate
        SET HolidayName = 'Columbus Day'
    WHERE
        [Month] = 10 AND
        [DaySeqInWeek] = 'Monday' AND
        [WeekInMonth] = 2

    /* Halloween - 10/31 */
    UPDATE DimDate
        SET HolidayName = 'Halloween'
    WHERE
        [Month] = 10 AND
        [Day] = 31

    /* Veterans Day - November 11 */
    UPDATE DimDate
        SET HolidayName = 'Veterans Day'
    WHERE
        [Month] = 11 AND
        [Day] = 11
    
    /* Thanksgiving - Fourth THURSDAY in November */
    UPDATE DimDate
        SET HolidayName = 'Thanksgiving Day'
    WHERE
        [Month] = 11 AND
        [DaySeqInWeek] = 'Thursday' AND
        [WeekInMonth] = 4

    /* Christmas */
    UPDATE DimDate
        SET HolidayName = 'Christmas Day'
    WHERE [Month] = 12 AND
          [Day]  = 25
    
    /* Election Day - The first Tuesday after the first Monday in November */
    BEGIN
    DECLARE @Holidays TABLE
    (
        [ID] INT IDENTITY(1,1),
        [DateID] INT,
        [Week] TINYINT,
        [Year] CHAR(4),
        [Day] CHAR(2)
    )

        INSERT INTO @Holidays([DateID], [Year], [Day])
            SELECT
                [DateSk],
                [Year],
                [Day] 
            FROM DimDate
            WHERE
                [Month] = 11 AND 
                [DaySeqInWeek] = 'Monday'
            ORDER BY
                [Year],
                [Day]

        DECLARE @CNTR INT,
                @POS INT,
                @STARTYEAR INT,
                @ENDYEAR INT,
                @MINDAY INT

        SELECT @CURRENTYEAR = MIN([Year])
             , @STARTYEAR = MIN([Year])
             , @ENDYEAR = MAX([Year])
        FROM @Holidays

        WHILE @CURRENTYEAR <= @ENDYEAR
        BEGIN
            SELECT @CNTR = COUNT([Year])
            FROM @Holidays
            WHERE [Year] = @CURRENTYEAR

            SET @POS = 1

            WHILE @POS <= @CNTR
            BEGIN
                SELECT @MINDAY = MIN(DAY)
                FROM @Holidays
                WHERE
                    [Year] = @CURRENTYEAR AND
                    [Week] IS NULL

                UPDATE @Holidays
                    SET [Week] = @POS
                WHERE
                    [Year] = @CURRENTYEAR AND
                    [Day] = @MINDAY

                SELECT @POS = @POS + 1
            END

            SELECT @CURRENTYEAR = @CURRENTYEAR + 1
        END

        UPDATE DimDate
            SET HolidayName  = 'Election Day'
        FROM DimDate DT
            JOIN @Holidays HL ON (HL.DateID + 1) = DT.DateSk
        WHERE
            [Week] = 1
    END
    --set flag for USA holidays in Dimension
    UPDATE DimDate
        SET IsHoliday = CASE WHEN HolidayName IS NULL THEN 0
                                WHEN HolidayName IS NOT NULL THEN 1 END

/*****************************************************************************************/
/*update DimDate
set [DateSk] = [DateNum]
*/
/********************************************************************************************/

alter table DimDate drop column WeekOfMonth;
alter table DimDate drop column WeekOfQuarter;
alter table DimDate drop column WeekOfYear;
alter table DimDate drop column YearName;
alter table DimDate drop column IsHoliday;
alter table DimDate drop column HolidayName;



With DDate  As
(
SELECT 
Date_Seq,
ROW_NUMBER() OVER (ORDER BY [DateSk] ASC) AS RN
FROM DimDate 
)
UPDATE DDate  SET Date_Seq=RN ;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Shared')
BEGIN
    EXEC('CREATE SCHEMA Shared')
END
GO
ALTER SCHEMA Shared TRANSFER DimDate;


ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_PA_FACTINV FOREIGN KEY (PatientID) REFERENCES Shared.DimPatient(PatientSK); 
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_DA_FACTINV FOREIGN KEY (InvoiceDate) REFERENCES Shared.DimDate([DateSk]);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_INV_FACTINV FOREIGN KEY (InvoiceID) REFERENCES Inv.DimInvoice(InvoiceSK);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_INS_FACTINV FOREIGN KEY (InsuranceID) REFERENCES Inv.DimInsurance(InsuranceSK);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_PH_FACTINV FOREIGN KEY (MedicineID) REFERENCES Inv.DimPharmacyStorage(MedicineID);


GO
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_EMP_FACTOP FOREIGN KEY (EmployeeID) REFERENCES Shared.DimEmployee(EmployeeSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_OP_FACTOP FOREIGN KEY (OperationID) REFERENCES Op.DimOperation(OperationSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_PA_FACTOP FOREIGN KEY (PatientID) REFERENCES Shared.DimPatient(PatientSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_DA_FACTOP FOREIGN KEY (DateID) REFERENCES Shared.DimDate(DateSk)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_DEP_FACTOP FOREIGN KEY (DepartmentID) REFERENCES Shared.DimDepartment(DepartmentSK)

-- FKs for FactAttendance
ALTER TABLE Att.FactAttendance ADD CONSTRAINT FK_DA_FACTATT FOREIGN KEY (DateID) REFERENCES Shared.DimDate(DateSK);
ALTER TABLE Att.FactAttendance ADD CONSTRAINT FK_EMP_FACTATT FOREIGN KEY (EmployeeID) REFERENCES Shared.DimEmployee(EmployeeSK)

