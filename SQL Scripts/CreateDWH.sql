CREATE DATABASE TESTDDL13;
GO
USE TESTDDL13;
GO
CREATE SCHEMA Inv_DW;
GO
CREATE SCHEMA Ph_DW;
GO
CREATE SCHEMA Tr_DW;
GO
CREATE SCHEMA Shared;
GO
CREATE SCHEMA P_DW;
GO
CREATE SCHEMA In_DW;
GO
CREATE SCHEMA FC_DW;
GO
CREATE SCHEMA O_DW;
GO
CREATE SCHEMA E_DW;
GO
CREATE SCHEMA D_DW;
GO
CREATE SCHEMA Op_DW;
GO
CREATE SCHEMA Emp_DW;
GO

CREATE TABLE Inv_DW.DimInvoice ( InvoicesSurrogateID BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Inv_DW.DimInvoice ADD InvoiceID INT
ALTER TABLE Inv_DW.DimInvoice ADD Date DATE
ALTER TABLE Inv_DW.DimInvoice ADD Status VARCHAR(50)
ALTER TABLE Inv_DW.DimInvoice ADD amount DECIMAL(10, 2)
CREATE TABLE Ph_DW.DimPharmacyStorage ( MedicineID BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Ph_DW.DimPharmacyStorage ADD name VARCHAR(100)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD CurrentQuantity DECIMAL(10, 2)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD expirationDate  DATE
ALTER TABLE Ph_DW.DimPharmacyStorage ADD MinQuantity DECIMAL(10, 2)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD OrderQuantity DECIMAL(10, 2)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD HashCode NVARCHAR(1000)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD LandingDate DATE
ALTER TABLE Ph_DW.DimPharmacyStorage ADD StartDate DATE
ALTER TABLE Ph_DW.DimPharmacyStorage ADD EndDate DATE
ALTER TABLE Ph_DW.DimPharmacyStorage ADD RowStatus varchar(1)
ALTER TABLE Ph_DW.DimPharmacyStorage ADD IsLatest varchar(1)
CREATE TABLE Tr_DW.DimTreatment ( TreatmentID BigInt IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Tr_DW.DimTreatment ADD Description VARCHAR(255)
ALTER TABLE Tr_DW.DimTreatment ADD Date  DATE
ALTER TABLE Tr_DW.DimTreatment ADD Quantity INT
ALTER TABLE Tr_DW.DimTreatment ADD Name VARCHAR(100)
ALTER TABLE Tr_DW.DimTreatment ADD DispenseDate DATE
ALTER TABLE Tr_DW.DimTreatment ADD HashCode NVARCHAR(1000)
ALTER TABLE Tr_DW.DimTreatment ADD LandingDate DATE
ALTER TABLE Tr_DW.DimTreatment ADD StartDate DATE
ALTER TABLE Tr_DW.DimTreatment ADD EndDate DATE
ALTER TABLE Tr_DW.DimTreatment ADD IsLatest varchar(1)
ALTER TABLE Tr_DW.DimTreatment ADD RowStatus varchar(1)
CREATE TABLE Shared.DimDate ( DateID BIGINT IDENTITY(1,1) PRIMARY KEY); 
ALTER TABLE Shared.DimDate ADD Date_Seq INT
ALTER TABLE Shared.DimDate ADD Date DATE
ALTER TABLE Shared.DimDate ADD Day CHAR(10)
ALTER TABLE Shared.DimDate ADD DaySuffix VARCHAR(2)
ALTER TABLE Shared.DimDate ADD DayName VARCHAR(9)
ALTER TABLE Shared.DimDate ADD DaySeqInWeek
 CHAR(1)
ALTER TABLE Shared.DimDate ADD WeekInMonth VARCHAR(2)
ALTER TABLE Shared.DimDate ADD WeekInYear
 VARCHAR(2)
ALTER TABLE Shared.DimDate ADD WeekInYearName VARCHAR(3)
ALTER TABLE Shared.DimDate ADD WeekInYearDesc VARCHAR(8)
ALTER TABLE Shared.DimDate ADD WeekInYearNum VARCHAR(6)
ALTER TABLE Shared.DimDate ADD WeekInQuarter VARCHAR(3)
ALTER TABLE Shared.DimDate ADD WeekOfYear VARCHAR(2)
ALTER TABLE Shared.DimDate ADD Month VARCHAR(2)
ALTER TABLE Shared.DimDate ADD MonthName VARCHAR(9)
ALTER TABLE Shared.DimDate ADD MonthOfQuarter VARCHAR(2)
ALTER TABLE Shared.DimDate ADD Quarter CHAR(1)
ALTER TABLE Shared.DimDate ADD QuarterYear VARCHAR(9)
ALTER TABLE Shared.DimDate ADD QuarterName VARCHAR(9)
ALTER TABLE Shared.DimDate ADD QuarterYearNum VARCHAR(9)
ALTER TABLE Shared.DimDate ADD Year CHAR(4)
ALTER TABLE Shared.DimDate ADD YearName CHAR(7)
ALTER TABLE Shared.DimDate ADD MonthYear CHAR(10)
ALTER TABLE Shared.DimDate ADD MonthYearNum CHAR(4)
ALTER TABLE Shared.DimDate ADD FirstDayOfMonth DATE
ALTER TABLE Shared.DimDate ADD FirstDayOfMonthNum INT
ALTER TABLE Shared.DimDate ADD LastDayOfMonth
 DATE
ALTER TABLE Shared.DimDate ADD LastDayOfMonthNum INT
ALTER TABLE Shared.DimDate ADD FirstDayInQuarter DATE
ALTER TABLE Shared.DimDate ADD FirstDayInQuarterNum INT
ALTER TABLE Shared.DimDate ADD LastDayInQuarter DATE
ALTER TABLE Shared.DimDate ADD LastDayInQuarterNum INT
ALTER TABLE Shared.DimDate ADD FirstDayInYear DATE
ALTER TABLE Shared.DimDate ADD FirstYearInDayNum INT
ALTER TABLE Shared.DimDate ADD LastDayInYearNum DATE
ALTER TABLE Shared.DimDate ADD IsHoliday BIT
ALTER TABLE Shared.DimDate ADD IsWeekDay BIT
ALTER TABLE Shared.DimDate ADD HolidayName
 VARCHAR(50)
CREATE TABLE P_DW.DimPatient ( PatientID INT); 
ALTER TABLE P_DW.DimPatient ADD PatientName VARCHAR(100)
ALTER TABLE P_DW.DimPatient ADD PhoneNumber VARCHAR(30)
ALTER TABLE P_DW.DimPatient ADD DOB DATE
ALTER TABLE P_DW.DimPatient ADD Gender VARCHAR(10)
ALTER TABLE P_DW.DimPatient ADD Nationality VARCHAR(50)
ALTER TABLE P_DW.DimPatient ADD BloodType VARCHAR(5)
ALTER TABLE P_DW.DimPatient ADD EmergencyContact VARCHAR(100)
ALTER TABLE P_DW.DimPatient ADD VisitDate DATE
ALTER TABLE P_DW.DimPatient ADD Prescription VARCHAR(255)
ALTER TABLE P_DW.DimPatient ADD AdmissionDate DATE
ALTER TABLE P_DW.DimPatient ADD AdmissionReason VARCHAR(255)
ALTER TABLE P_DW.DimPatient ADD DischargeDate  DATE
ALTER TABLE P_DW.DimPatient ADD InpatientFlag BIT
ALTER TABLE P_DW.DimPatient ADD OutpatientFlag BIT
ALTER TABLE P_DW.DimPatient ADD HashCode NVARCHAR(1000)
ALTER TABLE P_DW.DimPatient ADD LandingDate DATE
ALTER TABLE P_DW.DimPatient ADD StartDate DATE
ALTER TABLE P_DW.DimPatient ADD EndDate DATE
ALTER TABLE P_DW.DimPatient ADD IsLatest varchar(1)
ALTER TABLE P_DW.DimPatient ADD RowStatus varchar(1)
CREATE TABLE In_DW.DimInsurance ( InsuranceID Float); 
ALTER TABLE In_DW.DimInsurance ADD PolicyNumber VARCHAR(50)
ALTER TABLE In_DW.DimInsurance ADD Company VARCHAR(100)
ALTER TABLE In_DW.DimInsurance ADD RecoveryDetails VARCHAR(255)
ALTER TABLE In_DW.DimInsurance ADD InsuranceEndDate DATE
ALTER TABLE In_DW.DimInsurance ADD HashCode NVARCHAR(1000)
ALTER TABLE In_DW.DimInsurance ADD LandingDate DATE
ALTER TABLE In_DW.DimInsurance ADD StartDate DATE
ALTER TABLE In_DW.DimInsurance ADD EndDate DATE
ALTER TABLE In_DW.DimInsurance ADD IsLatest varchar(1)
ALTER TABLE In_DW.DimInsurance ADD RowStatus varchar(1)

CREATE TABLE FC_DW.FactInvoice ( InvoiceSurrogateID  INT );
ALTER TABLE FC_DW.FactInvoice ADD PatientID INT
ALTER TABLE FC_DW.FactInvoice ADD DateID INT
ALTER TABLE FC_DW.FactInvoice ADD TreatmentID INT
ALTER TABLE FC_DW.FactInvoice ADD DepartmentID INT
ALTER TABLE FC_DW.FactInvoice ADD InsuranceID INT
ALTER TABLE FC_DW.FactInvoice ADD TreatmentType NVARCHAR(100)
ALTER TABLE FC_DW.FactInvoice ADD coverageAmount Float
ALTER TABLE FC_DW.FactInvoice ADD MedicineID INT
ALTER TABLE FC_DW.FactInvoice ADD TotalInvoiceAmountbyDate Float
ALTER TABLE FC_DW.FactInvoice ADD TotalOutstandingAmount Float
ALTER TABLE FC_DW.FactInvoice ADD NumberOfPaidInvoices BigInt
ALTER TABLE FC_DW.FactInvoice ADD InvoicesPerTreatmentType Float
ALTER TABLE FC_DW.FactInvoice ADD NumberOfInsuranceCoveredInvoices BigInt
ALTER TABLE FC_DW.FactInvoice ADD NumberOfPatientsWithInsurance BigInt
ALTER TABLE FC_DW.FactInvoice ADD InsuranceCoveragePerTreatment Decimal(20)
ALTER TABLE FC_DW.FactInvoice ADD TotalTreatmentCostPerDepartment Float
ALTER TABLE FC_DW.FactInvoice ADD TotalSupplyCost Float

CREATE TABLE O_DW.DimOperation ( OperationID INT );
ALTER TABLE O_DW.DimOperation ADD Type VARCHAR(100)
ALTER TABLE O_DW.DimOperation ADD StartTime DateTIME
ALTER TABLE O_DW.DimOperation ADD EndTime DateTIME
ALTER TABLE O_DW.DimOperation ADD Status VARCHAR(50)
ALTER TABLE O_DW.DimOperation ADD Price DECIMAL(10, 2)
ALTER TABLE O_DW.DimOperation ADD HashCode NVARCHAR(1000)
ALTER TABLE O_DW.DimOperation ADD LandingDate DATE
ALTER TABLE O_DW.DimOperation ADD StartDate DATE
ALTER TABLE O_DW.DimOperation ADD EndDate DATE
ALTER TABLE O_DW.DimOperation ADD IsLatest varchar(1)
ALTER TABLE O_DW.DimOperation ADD RowStatus varchar(1)

CREATE TABLE E_DW.DimEmployee ( EmployeeID  INT );
ALTER TABLE E_DW.DimEmployee ADD Name VARCHAR(100)
ALTER TABLE E_DW.DimEmployee ADD PhoneNumber VARCHAR(30)
ALTER TABLE E_DW.DimEmployee ADD Email VARCHAR(100)
ALTER TABLE E_DW.DimEmployee ADD Address VARCHAR(255)
ALTER TABLE E_DW.DimEmployee ADD EmergencyContact VARCHAR(100)
ALTER TABLE E_DW.DimEmployee ADD DOB DATE
ALTER TABLE E_DW.DimEmployee ADD HireDate DATE
ALTER TABLE E_DW.DimEmployee ADD Salary DECIMAL(10, 2)
ALTER TABLE E_DW.DimEmployee ADD Role VARCHAR(100)
ALTER TABLE E_DW.dimEmployee ADD HashCode NVARCHAR(1000)
ALTER TABLE E_DW.dimEmployee ADD LandingDate DATE
ALTER TABLE E_DW.dimEmployee ADD StartDate DATE
ALTER TABLE E_DW.dimEmployee ADD EndDate DATE
ALTER TABLE E_DW.DimEmployee ADD IsLatest varchar(1)
ALTER TABLE E_DW.DimEmployee ADD RowStatus varchar(1)


CREATE TABLE D_DW.Department ( DepartmentID INT );
ALTER TABLE D_DW.Department ADD  DepartmentName VARCHAR(100);
ALTER TABLE D_DW.Department ADD ManagerID  INT;
ALTER TABLE D_DW.Department ADD ContactNumber VARCHAR(30);
ALTER TABLE D_DW.Department ADD HashCode NVARCHAR(1000);
ALTER TABLE D_DW.Department ADD LandingDate DATE;
ALTER TABLE D_DW.Department ADD StartDate DATE;
ALTER TABLE D_DW.Department ADD EndDate DATE;
ALTER TABLE D_DW.Department ADD IsLatest varchar(1);
ALTER TABLE D_DW.Department ADD RowStatus varchar(1);

CREATE TABLE Op_DW.FactOperations ( OperationSurrogateID BigInt );
ALTER TABLE Op_DW.FactOperations ADD DateID BigInt
ALTER TABLE Op_DW.FactOperations ADD EmployeeID BigInt
ALTER TABLE Op_DW.FactOperations ADD PatientID BigInt
ALTER TABLE Op_DW.FactOperations ADD OperationID BigInt
ALTER TABLE Op_DW.FactOperations ADD DepartmentID BigInt
ALTER TABLE Op_DW.FactOperations ADD TotalNumberOfOperationsPerDoctor Float
ALTER TABLE Op_DW.FactOperations ADD NumberOfSuccessfulOperations BigInt
ALTER TABLE Op_DW.FactOperations ADD SuccessPercentage Decimal(20)
ALTER TABLE Op_DW.FactOperations ADD NumberOfDoctorsPerDepartment BigInt
ALTER TABLE Op_DW.FactOperations ADD CumulativeOperationsOverTime INT
ALTER TABLE Op_DW.FactOperations ADD PeakOperationsDay INT
ALTER TABLE Op_DW.FactOperations ADD AverageDurationofOperations INT
ALTER TABLE Op_DW.FactOperations ADD Age BigInt


CREATE TABLE E_DW.Attendance (AttendanceID INT);
ALTER TABLE E_DW.Attendance ADD CheckIn DATETIME
ALTER TABLE E_DW.Attendance ADD CheckOut DATETIME
ALTER TABLE E_DW.Attendance ADD HashCode NVARCHAR(1000)
ALTER TABLE E_DW.Attendance ADD LandingDate DATE
ALTER TABLE E_DW.Attendance ADD StartDate DATE
ALTER TABLE E_DW.Attendance ADD EndDate DATE
ALTER TABLE E_DW.Attendance ADD IsLatest varchar(1)
ALTER TABLE E_DW.Attendance ADD RowStatus varchar(1)

CREATE TABLE Emp_DW.DimEmployee ( EmployeeID BigInt );
ALTER TABLE Emp_DW.DimEmployee ADD DateID BigInt
ALTER TABLE Emp_DW.DimEmployee ADD EmployeeSurrogateID BigInt

CREATE TABLE Emp_DW.DimAttendance( AttendanceID BigInt);
ALTER TABLE Emp_DW.DimAttendance ADD CheckIn DateTime
ALTER TABLE Emp_DW.DimAttendance ADD CheckOut DateTime
ALTER TABLE Emp_DW.FactEmployee ADD TotalSalaryExpenses BigInt
ALTER TABLE Emp_DW.FactEmployee ADD OvertimeHours Number
ALTER TABLE Emp_DW.FactEmployee ADD TotalOvertimeHoursbyMonth INT
ALTER TABLE Emp_DW.FactEmployee ADD AttendencePerDate DateTime