USE HMS;
GO

DECLARE @FilePath NVARCHAR(255);
SET @FilePath = 'E:\AE\JadaraTrainingRepo\JadaraTraining\Dummy Data';

-- Insurance
EXEC('
BULK INSERT Insurance
    FROM ''' + @FilePath + '\Insurance.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

-- Patient
EXEC('
BULK INSERT Patient
    FROM ''' + @FilePath + '\Patient.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

-- Pharmacy_Storage
EXEC('
BULK INSERT Pharmacy_Storage
    FROM ''' + @FilePath + '\PharmacyStorage.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Medical_History
EXEC('
BULK INSERT Medical_History
    FROM ''' + @FilePath + '\MedicalHistory.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Operation
EXEC('
BULK INSERT Operation
    FROM ''' + @FilePath + '\Operation.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Department
EXEC('
BULK INSERT Department
    FROM ''' + @FilePath + '\Department.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Attendance
EXEC('
BULK INSERT Attendance
    FROM ''' + @FilePath + '\Attendance.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Appointment
EXEC('
BULK INSERT Appointment
    FROM ''' + @FilePath + '\Appointment.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Employee
EXEC('
BULK INSERT Employee
    FROM ''' + @FilePath + '\Employee.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Lab_Test
EXEC('
BULK INSERT Lab_Test
    FROM ''' + @FilePath + '\LabTest.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Doctor
EXEC('
BULK INSERT Doctor
    FROM ''' + @FilePath + '\Doctors.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Nurse
EXEC('
BULK INSERT Nurse
    FROM ''' + @FilePath + '\Nurses.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Govern
EXEC('
BULK INSERT Govern
    FROM ''' + @FilePath + '\Govern.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Registration
EXEC('
BULK INSERT Registration
    FROM ''' + @FilePath + '\Registration.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Room
EXEC('
BULK INSERT Room
    FROM ''' + @FilePath + '\Room.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Doc_Op
EXEC('
BULK INSERT Doc_Op
    FROM ''' + @FilePath + '\doctor_op.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Treatment
EXEC('
BULK INSERT Treatment
    FROM ''' + @FilePath + '\Treatment.csv''
    WITH
    (
        FIELDTERMINATOR = '','',
        ROWTERMINATOR = ''\n'',
        FIRSTROW = 2
    );
');

 --Invoice
 -- Insert for Appointment_ID being non-null
INSERT INTO Invoice (Invoice_ID, [status], [date], [amount], [Insurance_ID], [Lab_Test_ID], [TreatmentID], [Appointment_ID], [Room_ID], [Patient_ID], [Registration_ID], [Operation_ID])
SELECT 1000000 + ROW_NUMBER() OVER(ORDER BY a.Appointment_ID) AS Invoice_ID
	  ,'Unpaid' AS status
	  ,[date]
      ,d.appointment_price AS Amount
      ,p.Insurance_ID
      ,Null AS Lab_Test_ID
      ,NULL AS TreatmentID
      ,a.Appointment_ID AS Appointment_ID
	  ,Null AS Room_ID
	  ,p.Patient_ID
	  ,Null AS Registration_ID
	  ,Null AS Operation_ID
FROM Appointment a
LEFT JOIN Doctor d
ON a.Doctor_ID = d.Doctor_ID
LEFT JOIN Patient p
ON p.Patient_ID = a.Patient_ID


UNION ALL

-- Insert for Operation_ID being non-null
SELECT 2000000 + ROW_NUMBER() OVER(ORDER BY o.Operation_ID) AS Invoice_ID
      ,'Unpaid' AS status
      ,o.start_time
      ,o.price AS Amount
      ,p.Insurance_ID
      ,Null AS Lab_Test_ID
      ,NULL AS TreatmentID
      ,NULL AS Appointment_ID
      ,o.Room_ID AS Room_ID
      ,p.Patient_ID
      ,Null AS Registration_ID
      ,o.Operation_ID AS Operation_ID
FROM operation o
LEFT JOIN Patient p ON p.Patient_ID = o.Patient_ID


UNION ALL

-- Insert for Lab_Test_ID being non-null
SELECT 3000000 + ROW_NUMBER() OVER(ORDER BY l.Lab_Test_ID) AS Invoice_ID
      ,'Unpaid' AS status
      ,l.test_date
      ,l.price AS Amount
      ,p.Insurance_ID
      ,l.Lab_Test_ID AS Lab_Test_ID
      ,NULL AS TreatmentID
      ,NULL AS Appointment_ID
      ,NULL AS Room_ID
      ,p.Patient_ID
      ,NULL AS Registration_ID
      ,NULL AS Operation_ID
FROM Lab_Test l
LEFT JOIN Patient p ON p.Patient_ID = l.Patient_ID


UNION ALL

-- Insert for TreatmentID being non-null
SELECT 4000000 + ROW_NUMBER() OVER(ORDER BY t.TreatmentID) AS Invoice_ID
      ,'Unpaid' AS status
      ,t.dispenseDate
      ,(ph.price * t.quantity) AS Amount
      ,p.Insurance_ID
      ,NULL AS Lab_Test_ID
      ,t.TreatmentID AS TreatmentID
      ,NULL AS Appointment_ID
      ,NULL AS Room_ID
      ,p.Patient_ID
      ,NULL AS Registration_ID
      ,NULL AS Operation_ID
FROM Treatment t
LEFT JOIN Patient p ON p.Patient_ID = t.Patient_ID
LEFT JOIN Pharmacy_storage ph ON ph.Medicine_id = t.Medicine_ID

UNION ALL

-- Insert for Room_ID being non-null
SELECT 5000000 + ROW_NUMBER() OVER(ORDER BY re.Registration_ID) AS Invoice_ID
      ,'Unpaid' AS status
      ,re.Discharge_Date
      ,(r.price *(DATEDIFF(day, re.Discharge_Date, re.Registration_Date))) AS Amount
      ,p.Insurance_ID
      ,NULL AS Lab_Test_ID
      ,NULL AS TreatmentID
      ,NULL AS Appointment_ID
      ,r.Room_ID AS Room_ID
      ,p.Patient_ID
      ,re.Registration_ID AS Registration_ID
      ,NULL AS Operation_ID
FROM Registration re
LEFT JOIN Patient p ON p.Patient_ID = re.Patient_ID
LEFT JOIN Room r ON r.Room_ID = re.Room_ID;

GO

UPDATE Invoice
SET status = 'Paid'
WHERE date < '2024-09-01';