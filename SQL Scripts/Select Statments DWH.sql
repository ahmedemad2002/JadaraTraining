USE HMS_Staging;
GO
-- DimOperations
SELECT Operation_ID, type, start_time, CAST(start_time AS DATE) AS DATE, [status], HashCode, StartDate, EndDate, RowStatus, IsLatest
FROM Operation

-- DimPatient
SELECT [Patient_ID]
      ,[patient_name]
      ,[DOB]
      ,[blood_type]
      ,[nationality]
      ,[gender]
      ,[phone_number]
      ,[emergency_contact]
      ,[admissionDate]
      ,[admissionReason]
      ,[dischargeDate]
      ,[visitDate]
      ,[prescription]
      ,[inpatient_flag]
      ,[outpatient_flag]
      ,[Insurance_ID], HashCode, StartDate, EndDate, RowStatus, IsLatest
  FROM [HMS_Staging].[dbo].[Patient]

-- DimDept
SELECT DepartmentID, Department_Name, ContactNumber, HashCode, StartDate, EndDate, RowStatus, IsLatest
FROM Department

-- DimInsurance
SELECT Insurance_ID, company, Coverage_Percentage, policy_number, end_date, HashCode, StartDate, EndDate, RowStatus, IsLatest
FROM Insurance

-- DimInvoice
SELECT Invoice_ID, Date, status, HashCode, StartDate, EndDate, RowStatus, IsLatest
FROM Invoice

-- DimEmployee
SELECT Employee_ID, [Name], DOB, Insurance_ID, Emergency_Contact, Email, Salary, Phone_Number, HireDate, [Role], HashCode, StartDate, EndDate, RowStatus, IsLatest
FROM Employee

-- FactOperation
SELECT O.ID, O.Operation_ID, DO.Employee_ID, O.Patient_ID, E.DepartmentID
	, CAST(O.start_time AS DATE) AS [DATE], DATEDIFF(Minute, O.start_time, O.end_time) AS OperationDuration
	, DATEDIFF(YEAR, P.DOB, GETDATE()) AS patientAge
	, O.price AS OperatoinPrice
FROM Operation O
LEFT JOIN Doc_Op DO
ON DO.Operation_ID = O.Operation_ID
LEFT JOIN Employee E
ON E.Employee_ID = DO.Employee_ID
LEFT JOIN Patient P
ON P.Patient_ID = O.Patient_ID
ORDER BY O.Operation_ID;

-- FactInvoice
SELECT INV.*, T.ID, T.quantity, INS.Coverage_Percentage
FROM INVOICE INV
LEFT JOIN Treatment T ON T.TreatmentID=INV.TreatmentID AND T.IsLatest='Y'
LEFT JOIN Pharmacy_storage PHS ON PHS.Medicine_id=T.Medicine_ID AND PHS.IsLatest='Y'
LEFT JOIN Appointment A ON A.Appointment_ID=INV.Appointment_ID AND A.IsLatest='Y'
LEFT JOIN Lab_Test L ON L.Lab_test_id = INV.Lab_Test_ID AND L.IsLatest='Y'
LEFT JOIN Operation O ON O.Operation_ID=INV.Operation_ID AND O.IsLatest='Y'
LEFT JOIN Patient P ON P.Patient_ID=INV.Patient_ID AND P.IsLatest='Y'
LEFT JOIN Insurance Ins ON INS.Insurance_ID=P.Insurance_ID AND Ins.IsLatest='Y'


-- FactAttendance
SELECT ID, Employee_ID, Attendance_ID, CAST(CheckIn AS DATE) AS Date, CheckIn, CheckOut, HashCode
	, DATEDIFF(HOUR, CheckIn, CheckOut) AS WorkingHours
FROM Attendance
