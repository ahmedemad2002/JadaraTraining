CREATE DATABASE HMS_DWH;
GO
USE HMS_DWH;
GO

CREATE TABLE DimPatient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(255),
    DOB DATE,
    BloodGroup VARCHAR(10),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(50),
    EmergencyContact VARCHAR(50)
);

CREATE TABLE DimDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255),
    ContactNumber VARCHAR(50)
);

CREATE TABLE DimEmployee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    DOB DATE,
    Position VARCHAR(255),
    Address VARCHAR(255),
    EmergencyContact VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
CREATE TABLE DimInsurance (
    InsuranceID INT PRIMARY KEY,
    Company VARCHAR(255),
    CoveragePercentage DECIMAL(5, 2),
    ApprovalDate DATE,
    PolicyNumber VARCHAR(255),
    EndDate DATE
);
CREATE TABLE DimAttendance (
    AttendanceID INT PRIMARY KEY,
    CheckIn TIME,
    CheckOut TIME
);
CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    DateValue DATE,
    Year INT,
    Month INT,
    Day INT
);
CREATE TABLE FactInvoice (
    InvoiceSurrogateID INT PRIMARY KEY,
    TreatmentID INT,
    PatientID INT,
    DepartmentID INT,
    InsuranceID INT,
    TreatmentType VARCHAR(255),
    CoverageAmount DECIMAL(10, 2),
    MedicineID INT,
    TotalInvoiceAmount DECIMAL(10, 2),
    TotalOutstandingAmount DECIMAL(10, 2),
    NumberOfPaidInvoices INT,
    InvoicesPerTreatmentType INT,
    NumberOfInsuranceCoveredInvoices INT,
    NumberOfPatientsWithInsurance INT,
    InsuranceCoveragePerTreatment DECIMAL(10, 2),
    TotalTreatmentCostPerDepartment DECIMAL(10, 2),
    TotalSupplyCost DECIMAL(10, 2),
    FOREIGN KEY (PatientID) REFERENCES DimPatient(PatientID),
    FOREIGN KEY (DepartmentID) REFERENCES DimDepartment(DepartmentID),
    FOREIGN KEY (InsuranceID) REFERENCES DimInsurance(InsuranceID)
);
CREATE TABLE FactEmployee (
    EmployeeSurrogateID INT PRIMARY KEY,
    EmployeeID INT,
    AttendanceID INT,
    CheckIn TIME,
    CheckOut TIME,
    TotalSalaryExpenses DECIMAL(10, 2),
    OvertimeHours DECIMAL(5, 2),
    AttendancePerDate INT,
    FOREIGN KEY (EmployeeID) REFERENCES DimEmployee(EmployeeID),
    FOREIGN KEY (AttendanceID) REFERENCES DimAttendance(AttendanceID)
);
CREATE TABLE FactOperations (
    OperationSurrogateID INT PRIMARY KEY,
    EmployeeID INT,
    PatientID INT,
    OperationID INT,
    DepartmentID INT,
    StartTime DATETIME,
    EndTime DATETIME,
    Status VARCHAR(255),
    SafetyStatus VARCHAR(255),
    TotalNumberOfOperationsPerDoctor INT,
    NumberOfSuccessfulOperations INT,
    SuccessPercentage DECIMAL(5, 2),
    NumberOfDoctorsPerDepartment INT,
    Age INT,
    FOREIGN KEY (EmployeeID) REFERENCES DimEmployee(EmployeeID),
    FOREIGN KEY (PatientID) REFERENCES DimPatient(PatientID),
    FOREIGN KEY (DepartmentID) REFERENCES DimDepartment(DepartmentID)
);
CREATE TABLE PharmacyStorage (
    MedicineID INT PRIMARY KEY,
    Name VARCHAR(255),
    Quantity INT,
    QuantityOnHold INT,
    Price DECIMAL(10, 2),
    ExpirationDate DATE
);
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description VARCHAR(255),
    UsageInstructions VARCHAR(255)
);
