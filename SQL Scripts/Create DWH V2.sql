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


CREATE TABLE Inv.DimInvoice ( InvoiceSK BIGINT IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Inv.DimInvoice ADD InvoiceID INT
ALTER TABLE Inv.DimInvoice ADD Date DATE
ALTER TABLE Inv.DimInvoice ADD Status VARCHAR(50)
ALTER TABLE Inv.DimInvoice ADD amount DECIMAL(10, 2)
ALTER TABLE Inv.DimInvoice ADD HashCode NVARCHAR(1000)
ALTER TABLE Inv.DimInvoice ADD LandingDate DATE
ALTER TABLE Inv.DimInvoice ADD StartDate DATE
ALTER TABLE Inv.DimInvoice ADD EndDate DATE
ALTER TABLE Inv.DimInvoice ADD RowStatus varchar(1)
ALTER TABLE Inv.DimInvoice ADD IsLatest varchar(1)


CREATE TABLE Inv.DimPharmacyStorage ( MedicineID BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Inv.DimPharmacyStorage ADD name VARCHAR(100)
ALTER TABLE Inv.DimPharmacyStorage ADD Price DECIMAL(10, 2)
ALTER TABLE Inv.DimPharmacyStorage ADD expirationDate  DATE
ALTER TABLE Inv.DimPharmacyStorage ADD CurrentQuantity DECIMAL(10, 2)
ALTER TABLE Inv.DimPharmacyStorage ADD Description varchar(255)
ALTER TABLE Inv.DimPharmacyStorage ADD TreatmentID Int
ALTER TABLE Inv.DimPharmacyStorage ADD MinQuantity DECIMAL(10, 2)
ALTER TABLE Inv.DimPharmacyStorage ADD OrderQuantity DECIMAL(10, 2)
ALTER TABLE Inv.DimPharmacyStorage ADD HashCode NVARCHAR(1000)
ALTER TABLE Inv.DimPharmacyStorage ADD LandingDate DATE
ALTER TABLE Inv.DimPharmacyStorage ADD StartDate DATE
ALTER TABLE Inv.DimPharmacyStorage ADD EndDate DATE
ALTER TABLE Inv.DimPharmacyStorage ADD RowStatus varchar(1)
ALTER TABLE Inv.DimPharmacyStorage ADD IsLatest varchar(1)

CREATE TABLE Shared.DimPatient ( PatientSK BIGINT IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Shared.DimPatient ADD PatientID INT
ALTER TABLE Shared.DimPatient ADD PatientName VARCHAR(100)
ALTER TABLE Shared.DimPatient ADD DOB DATE
ALTER TABLE Shared.DimPatient ADD BloodType VARCHAR(5)
ALTER TABLE Shared.DimPatient ADD Nationality VARCHAR(50)
ALTER TABLE Shared.DimPatient ADD Gender VARCHAR(10)
ALTER TABLE Shared.DimPatient ADD Address VARCHAR(100)
ALTER TABLE Shared.DimPatient ADD PhoneNumber VARCHAR(30)
ALTER TABLE Shared.DimPatient ADD EmergencyContact VARCHAR(100)
ALTER TABLE Shared.DimPatient ADD VisitDate DATE
ALTER TABLE Shared.DimPatient ADD Prescription VARCHAR(255)
ALTER TABLE Shared.DimPatient ADD AdmissionDate DATE
ALTER TABLE Shared.DimPatient ADD AdmissionReason VARCHAR(255)
ALTER TABLE Shared.DimPatient ADD DischargeDate  DATE
ALTER TABLE Shared.DimPatient ADD HashCode NVARCHAR(1000)
ALTER TABLE Shared.DimPatient ADD LandingDate DATE
ALTER TABLE Shared.DimPatient ADD StartDate DATE
ALTER TABLE Shared.DimPatient ADD EndDate DATE
ALTER TABLE Shared.DimPatient ADD RowStatus varchar(1)
ALTER TABLE Shared.DimPatient ADD IsLatest varchar(1)

CREATE TABLE Inv.DimInsurance ( InsuranceSK BIGINT IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Inv.DimInsurance ADD InsuranceID INT
ALTER TABLE Inv.DimInsurance ADD PolicyNumber VARCHAR(50)
ALTER TABLE Inv.DimInsurance ADD Company VARCHAR(100)
ALTER TABLE Inv.DimInsurance ADD CoveragePercentage INT
ALTER TABLE Inv.DimInsurance ADD InsuranceEndDate DATE
ALTER TABLE Inv.DimInsurance ADD HashCode NVARCHAR(1000)
ALTER TABLE Inv.DimInsurance ADD LandingDate DATE
ALTER TABLE Inv.DimInsurance ADD StartDate DATE
ALTER TABLE Inv.DimInsurance ADD EndDate DATE
ALTER TABLE Inv.DimInsurance ADD RowStatus varchar(1)
ALTER TABLE Inv.DimInsurance ADD IsLatest varchar(1)

CREATE TABLE Inv.DimAppointment ( AppointmentSK BIGINT IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Inv.DimAppointment ADD AppointmentID INT
ALTER TABLE Inv.DimAppointment ADD RegistrationDate DATE
ALTER TABLE Inv.DimAppointment ADD dischargeDate DATE
ALTER TABLE Inv.DimAppointment ADD HashCode NVARCHAR(1000)
ALTER TABLE Inv.DimAppointment ADD LandingDate DATE
ALTER TABLE Inv.DimAppointment ADD StartDate DATE
ALTER TABLE Inv.DimAppointment ADD EndDate DATE
ALTER TABLE Inv.DimAppointment ADD IsLatest varchar(1)
ALTER TABLE Inv.DimAppointment ADD RowStatus varchar(1)

CREATE TABLE Inv.FactInvoice ( InvoiceSK  BIGINT IDENTITY(1,1) PRIMARY KEY);
ALTER TABLE Inv.FactInvoice ADD PatientID BIGINT
ALTER TABLE Inv.FactInvoice ADD InvoiceID BIGINT
ALTER TABLE Inv.FactInvoice ADD AppointmentID BIGINT
ALTER TABLE Inv.FactInvoice ADD InvoiceDate BIGINT
ALTER TABLE Inv.FactInvoice ADD TreatmentID BIGINT
ALTER TABLE Inv.FactInvoice ADD InsuranceID BIGINT
ALTER TABLE Inv.FactInvoice ADD OperationID BIGINT
ALTER TABLE Inv.FactInvoice ADD MedicineID BIGINT
ALTER TABLE Inv.FactInvoice ADD DepartmentID BIGINT
ALTER TABLE Inv.FactInvoice ADD PaymentDate DATE
ALTER TABLE Inv.FactInvoice ADD MedicineExpirationDate DATE
ALTER TABLE Inv.FactInvoice ADD InvoiceAmount Float
ALTER TABLE Inv.FactInvoice ADD CoveragePercentage INT
ALTER TABLE Inv.FactInvoice ADD Quantity INT
ALTER TABLE Inv.FactInvoice ADD HashCode NVARCHAR(1000)
ALTER TABLE Inv.FactInvoice ADD StartDate DATE
ALTER TABLE Inv.FactInvoice ADD EndDate DATE
ALTER TABLE Inv.FactInvoice ADD RowStatus varchar(1)
ALTER TABLE Inv.FactInvoice ADD IsLatest varchar(1)


CREATE TABLE Shared.DimOperation ( OperationSK BIGINT IDENTITY(1,1) PRIMARY KEY);
ALTER TABLE Shared.DimOperation ADD OpearationID INT
ALTER TABLE Shared.DimOperation ADD Type VARCHAR(100)
ALTER TABLE Shared.DimOperation ADD StartTime DateTIME
ALTER TABLE Shared.DimOperation ADD EndTime DateTIME
ALTER TABLE Shared.DimOperation ADD Status VARCHAR(50)
ALTER TABLE Shared.DimOperation ADD Date DATE
ALTER TABLE Shared.DimOperation ADD HashCode NVARCHAR(1000)
ALTER TABLE Shared.DimOperation ADD LandingDate DATE
ALTER TABLE Shared.DimOperation ADD StartDate DATE
ALTER TABLE Shared.DimOperation ADD EndDate DATE
ALTER TABLE Shared.DimOperation ADD IsLatest varchar(1)
ALTER TABLE Shared.DimOperation ADD RowStatus varchar(1)

CREATE TABLE Shared.DimEmployee ( EmployeeSK  BIGINT IDENTITY(1,1) PRIMARY KEY);
ALTER TABLE Shared.DimEmployee ADD EmployeeID INT
ALTER TABLE Shared.DimEmployee ADD Name VARCHAR(100)
ALTER TABLE Shared.DimEmployee ADD PhoneNumber VARCHAR(30)
ALTER TABLE Shared.DimEmployee ADD Email VARCHAR(100)
ALTER TABLE Shared.DimEmployee ADD Address VARCHAR(255)
ALTER TABLE Shared.DimEmployee ADD EmergencyContact VARCHAR(100)
ALTER TABLE Shared.DimEmployee ADD DOB DATE
ALTER TABLE Shared.DimEmployee ADD HireDate DATE
ALTER TABLE Shared.DimEmployee ADD Salary DECIMAL(10, 2)
ALTER TABLE Shared.DimEmployee ADD Role VARCHAR(100)
ALTER TABLE Shared.DimEmployee ADD HashCode NVARCHAR(1000)
ALTER TABLE Shared.DimEmployee ADD LandingDate DATE
ALTER TABLE Shared.DimEmployee ADD StartDate DATE
ALTER TABLE Shared.DimEmployee ADD EndDate DATE
ALTER TABLE Shared.DimEmployee ADD IsLatest varchar(1)
ALTER TABLE Shared.DimEmployee ADD RowStatus varchar(1)

CREATE TABLE Op.DimRoom ( RoomSK BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Op.DimRoom ADD RoomID INT
ALTER TABLE Op.DimRoom ADD Occupied BIT
ALTER TABLE Op.DimRoom ADD RoomType VARCHAR(50)
ALTER TABLE Op.DimRoom ADD HashCode NVARCHAR(1000)
ALTER TABLE Op.DimRoom ADD LandingDate DATE
ALTER TABLE Op.DimRoom ADD StartDate DATE
ALTER TABLE Op.DimRoom ADD EndDate DATE
ALTER TABLE Op.DimRoom ADD IsLatest varchar(1)
ALTER TABLE Op.DimRoom ADD RowStatus varchar(1)

CREATE TABLE Shared.DimDepartment ( DepartmentSK BIGINT IDENTITY(1,1) PRIMARY KEY);
ALTER TABLE Shared.DimDepartment ADD DepartmentID INT
ALTER TABLE Shared.DimDepartment ADD DepartmentName VARCHAR(100)
ALTER TABLE Shared.DimDepartment ADD ManagerID  INT
ALTER TABLE Shared.DimDepartment ADD ContactNumber VARCHAR(30)
ALTER TABLE Shared.DimDepartment ADD HashCode NVARCHAR(1000)
ALTER TABLE Shared.DimDepartment ADD LandingDate DATE
ALTER TABLE Shared.DimDepartment ADD StartDate DATE
ALTER TABLE Shared.DimDepartment ADD EndDate DATE
ALTER TABLE Shared.DimDepartment ADD IsLatest varchar(1)
ALTER TABLE Shared.DimDepartment ADD RowStatus varchar(1)

CREATE TABLE Op.FactOperation ( OperationSurrogateID BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Op.FactOperation ADD DateID BigInt
ALTER TABLE Op.FactOperation ADD EmployeeID BigInt
ALTER TABLE Op.FactOperation ADD RoomID BigInt
ALTER TABLE Op.FactOperation ADD DepartmentID BigInt
ALTER TABLE Op.FactOperation ADD DischargeDate DATE
ALTER TABLE Op.FactOperation ADD RegistrationDate DATE
ALTER TABLE Op.FactOperation ADD PatientID BigInt
ALTER TABLE Op.FactOperation ADD OperationID BigInt
ALTER TABLE Op.FactOperation ADD OperationDay Date
ALTER TABLE Op.FactOperation ADD DurationofOperation Int
ALTER TABLE Op.FactOperation ADD PatientAge Int
ALTER TABLE Op.FactOperation ADD OperatoinPrice DECIMAL(10, 2)
ALTER TABLE Op.FactOperation ADD HashCode NVARCHAR(1000)
ALTER TABLE Op.FactOperation ADD StartDate DATE
ALTER TABLE Op.FactOperation ADD EndDate DATE
ALTER TABLE Op.FactOperation ADD RowStatus varchar(1)
ALTER TABLE Op.FactOperation ADD IsLatest varchar(1)

CREATE TABLE ATT.FactAttendance ( AttendanceSurrogateID BigInt IDENTITY(1,1) PRIMARY KEY);
ALTER TABLE ATT.FactAttendance ADD EmployeeID BigInt
ALTER TABLE ATT.FactAttendance ADD DateID BigInt
ALTER TABLE ATT.FactAttendance ADD CheckIn DateTime
ALTER TABLE ATT.FactAttendance ADD CheckOut DateTime
ALTER TABLE ATT.FactAttendance ADD WorkingHours Int
ALTER TABLE ATT.FactAttendance ADD AttendenceperMonths Int
ALTER TABLE ATT.FactAttendance ADD HashCode NVARCHAR(1000)
ALTER TABLE ATT.FactAttendance ADD StartDate DATE
ALTER TABLE ATT.FactAttendance ADD EndDate DATE
ALTER TABLE ATT.FactAttendance ADD RowStatus varchar(1)
ALTER TABLE ATT.FactAttendance ADD IsLatest varchar(1)


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
        [ID] BIGINT IDENTITY(1,1),
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
GO

ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_PA_FACTINV FOREIGN KEY (PatientID) REFERENCES Shared.DimPatient(PatientSK); 
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_DA_FACTINV FOREIGN KEY (InvoiceDate) REFERENCES Shared.DimDate([DateSk]);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_INV_FACTINV FOREIGN KEY (InvoiceID) REFERENCES Inv.DimInvoice(InvoiceSK);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_INS_FACTINV FOREIGN KEY (InsuranceID) REFERENCES Inv.DimInsurance(InsuranceSK);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_PH_FACTINV FOREIGN KEY (MedicineID) REFERENCES Inv.DimPharmacyStorage(MedicineID);
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_OP_FACTINV FOREIGN KEY (OperationID) REFERENCES Shared.DimOperation(OperationSK)
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_APP_FACTINV FOREIGN KEY (AppointmentID) REFERENCES Inv.DimAppointment(AppointmentSK)
ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_DEP_FACTINV FOREIGN KEY (DepartmentID) REFERENCES Shared.DimDepartment(DepartmentSK)
--ALTER TABLE INV.FactInvoice ADD CONSTRAINT FK_LAB_FACTINV FOREIGN KEY (LabtestID) REFERENCES Inv.DimLabTest(LabTestSK)



GO
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_EMP_FACTOP FOREIGN KEY (EmployeeID) REFERENCES Shared.DimEmployee(EmployeeSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_OP_FACTOP FOREIGN KEY (OperationID) REFERENCES Shared.DimOperation(OperationSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_PA_FACTOP FOREIGN KEY (PatientID) REFERENCES Shared.DimPatient(PatientSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_DA_FACTOP FOREIGN KEY (DateID) REFERENCES Shared.DimDate(DateSk)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_DEP_FACTOP FOREIGN KEY (DepartmentID) REFERENCES Shared.DimDepartment(DepartmentSK)
ALTER TABLE Op.FactOperation ADD CONSTRAINT FK_Ro_FACTOP FOREIGN KEY (RoomID) REFERENCES Op.DimRoom(RoomSK)

-- FKs for FactAttendance
ALTER TABLE Att.FactAttendance ADD CONSTRAINT FK_DA_FACTATT FOREIGN KEY (DateID) REFERENCES Shared.DimDate(DateSK);
ALTER TABLE Att.FactAttendance ADD CONSTRAINT FK_EMP_FACTATT FOREIGN KEY (EmployeeID) REFERENCES Shared.DimEmployee(EmployeeSK)
