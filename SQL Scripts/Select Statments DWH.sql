USE HMS_Staging;
GO
-- DimOperations
SELECT Operation_ID, type, start_time, CAST(start_time AS DATE) AS DATE, end_time, [status],
	HashCode, StartDate, EndDate, RowStatus, IsLatest
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
SELECT DepartmentID, Department_Name, ContactNumber, HashCode, StartDate, EndDate, RowStatus,
	IsLatest
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
SELECT O.ID AS OperationSK, DO.ID AS DOSK, E.ID AS EmpSK, P.ID AS PatientSK, Dept.ID as DeptSK,
	(YEAR(O.start_time) * 10000) + (MONTH(O.start_time) * 100) + DAY(O.start_time) AS OperationDate,
	DATEDIFF(Minute, O.start_time, O.end_time) AS OperationDuration, 
	DATEDIFF(YEAR, P.DOB, GETDATE()) AS patientAge,
	O.price AS OperatoinPrice, O.HashCode, O.StartDate, O.EndDate, O.RowStatus, O.IsLatest
FROM Operation O
LEFT JOIN Doc_Op DO ON DO.Operation_ID = O.Operation_ID AND DO.IsLatest='Y'
LEFT JOIN Employee E ON E.Employee_ID = DO.Employee_ID AND E.IsLatest='Y'
LEFT JOIN Patient P ON P.Patient_ID = O.Patient_ID AND P.IsLatest='Y'
LEFT JOIN Department Dept ON Dept.DepartmentID=E.DepartmentID AND Dept.IsLatest='Y'
ORDER BY O.Operation_ID;

-- FactInvoice
SELECT INV.*, Inv.ID AS InvoiceSK,
    (YEAR(INV.date) * 10000) + (MONTH(INV.date) * 100) + DAY(INV.date) AS InvoiceDate,
	T.ID AS TreatmentSK, T.quantity,
    (YEAR(T.[date]) * 10000) + (MONTH(T.[date]) * 100) + DAY(T.[date]) AS TreatmentDate,
	INS.Coverage_Percentage,
    (YEAR(PHS.expiration_date) * 10000) + (MONTH(PHS.expiration_date) * 100) + DAY(PHS.expiration_date) AS MedicineExpirationDate,
	PHS.ID AS MedicineID
FROM INVOICE INV
LEFT JOIN Treatment T ON T.TreatmentID=INV.TreatmentID AND T.IsLatest='Y'
LEFT JOIN Pharmacy_storage PHS ON PHS.Medicine_id=T.Medicine_ID AND PHS.IsLatest='Y'
LEFT JOIN Appointment A ON A.Appointment_ID=INV.Appointment_ID AND A.IsLatest='Y'
LEFT JOIN Lab_Test L ON L.Lab_test_id = INV.Lab_Test_ID AND L.IsLatest='Y'
LEFT JOIN Operation O ON O.Operation_ID=INV.Operation_ID AND O.IsLatest='Y'
LEFT JOIN Patient P ON P.Patient_ID=INV.Patient_ID AND P.IsLatest='Y'
LEFT JOIN Insurance Ins ON INS.Insurance_ID=P.Insurance_ID AND Ins.IsLatest='Y'


-- FactAttendance
SELECT ID, Employee_ID, Attendance_ID,
    (YEAR(CheckIn) * 10000) + (MONTH(CheckIn) * 100) + DAY(CheckIn) AS DateID, CheckIn, CheckOut, HashCode
	, DATEDIFF(HOUR, CheckIn, CheckOut) AS WorkingHours, StartDate, EndDate, RowStatus, isLatest
FROM Attendance
