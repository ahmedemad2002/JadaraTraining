--Number of Patients

USE HMS
SELECT COUNT(*) FROM Patient;

USE HMS_Landing
SELECT COUNT(*) FROM Patient;

USE HMS_Staging
SELECT COUNT(*) FROM Patient
where RowStatus!='D' AND IsLatest='Y';


--Number of Patients with a Specific Admission reason
USE HMS
SELECT COUNT(*) AS total_patients_with_admission_reason
FROM Patient
WHERE admissionreason IS NOT NULL AND admissionreason <> '';

USE HMS_Landing
SELECT COUNT(*) AS total_patients_with_admission_reason
FROM Patient
WHERE admissionreason IS NOT NULL AND admissionreason <> '';

USE HMS_Staging;
SELECT COUNT(*) AS total_patients_with_admission_reason
FROM Patient
WHERE admissionreason IS NOT NULL 
  AND admissionreason <> '' 
  AND RowStatus != 'D' 
  AND IsLatest = 'Y';



  --Number of Patients with a Specific Prescription
USE HMS

SELECT COUNT(*) AS total_patients_with_prescription
FROM Patient
WHERE prescription IS NOT NULL AND prescription <> '';
USE HMS_Landing
SELECT COUNT(*) AS total_patients_with_prescription
FROM Patient
WHERE prescription IS NOT NULL AND prescription <> '';

USE HMS_Staging
SELECT COUNT(*) AS total_patients_with_prescription
FROM Patient
WHERE prescription IS NOT NULL AND prescription <> ''
AND RowStatus!='D' AND IsLatest='Y';

--Number of Patients with a Specific Blood Type
USE HMS
SELECT blood_type, COUNT(*) AS total_patients
FROM Patient
WHERE blood_type IS NOT NULL AND blood_type <> ''
GROUP BY blood_type;

USE HMS_Landing
SELECT blood_type, COUNT(*) AS total_patients
FROM Patient
WHERE blood_type IS NOT NULL AND blood_type <> ''
GROUP BY blood_type;

USE HMS_Staging;
SELECT blood_type, COUNT(*) AS total_patients
FROM Patient
WHERE blood_type IS NOT NULL 
  AND blood_type <> '' 
  AND RowStatus != 'D' 
  AND IsLatest = 'Y'
GROUP BY blood_type;

--the count
USE HMS_Staging;
SELECT COUNT(*) AS total_patients_with_blood_type
FROM Patient
WHERE blood_type IS NOT NULL 
  AND blood_type <> '' 
  AND RowStatus != 'D' 
  AND IsLatest = 'Y';


  --Average Treatment Duration
USE HMS
SELECT AVG(DATEDIFF(day, Registration_Date, discharge_Date)) AS avg_treatment_duration
FROM Registration
WHERE Discharge_Date IS NOT NULL AND Registration_Date IS NOT NULL;

USE HMS_Landing
SELECT AVG(DATEDIFF(day, Registration_Date, discharge_Date)) AS avg_treatment_duration
FROM Registration
WHERE Discharge_Date IS NOT NULL AND Registration_Date IS NOT NULL;

USE HMS_Staging
SELECT AVG(DATEDIFF(day, Registration_Date, discharge_Date)) AS avg_treatment_duration
FROM Registration
WHERE Discharge_Date IS NOT NULL AND Registration_Date IS NOT NULL
AND RowStatus!='D' AND IsLatest='Y';



--Number of Patients with Specific Medical Condition
USE HMS
--one by one
SELECT condition_name, count(*) AS N_PATIENTS
  FROM [HMS].[dbo].[Medical_history]
  GROUP BY condition_name;
--all
USE HMS;
SELECT COUNT(*) AS total_patients
FROM [dbo].[Medical_history];

USE HMS_Landing
SELECT COUNT(*) AS total_patients
FROM [dbo].[Medical_history];

USE HMS_Staging
SELECT COUNT(*) AS total_patients
FROM [dbo].[Medical_history]
where RowStatus!='D' AND IsLatest='Y';



--Recovery Rate
USE HMS
SELECT 
    (COUNT(CASE WHEN dischargeDate IS NOT NULL THEN 1 END) * 100.0) / COUNT(*) AS recovery_rate
FROM 
    Patient;

USE HMS_Landing
SELECT 
    (COUNT(CASE WHEN dischargeDate IS NOT NULL THEN 1 END) * 100.0) / COUNT(*) AS recovery_rate
FROM 
    Patient;

USE HMS_Staging
SELECT 
    (COUNT(CASE WHEN dischargeDate IS NOT NULL THEN 1 END) * 100.0) / COUNT(*) AS recovery_rate
FROM 
    Patient WHERE  RowStatus!='D' AND IsLatest='Y';


--Average Insurance Coverage

USE HMS
SELECT AVG([Coverage_Percentage]) 
        FROM [HMS].[dbo].[Insurance]

USE HMS_Landing
GO
SELECT AVG([Coverage_Percentage]) 
        FROM [dbo].[Insurance]


USE HMS_Staging;
SELECT AVG([Coverage_Percentage]) 
FROM [dbo].[Insurance]
WHERE RowStatus != 'D' 
  AND IsLatest = 'Y';


--Total amount billed by all patients
USE HMS
SELECT COUNT(DISTINCT Invoice_ID) AS distinct_invoice_count
FROM invoice;

USE HMS_Landing
SELECT COUNT(DISTINCT Invoice_ID) AS distinct_invoice_count
FROM invoice;

USE HMS_Staging
SELECT COUNT(DISTINCT Invoice_ID) AS distinct_invoice_count
FROM invoice
where RowStatus!='D' AND IsLatest='Y';


--Total money paid by all patients
USE HMS
SELECT SUM(amount) AS total_money_paid
FROM invoice;

USE HMS_Landing
SELECT SUM(amount) AS total_money_paid
FROM invoice;

USE HMS_Staging
SELECT SUM(amount) AS total_money_paid
FROM invoice
WHERE  RowStatus!='D' AND IsLatest='Y';



--Total Patient Registrations
USE HMS
SELECT COUNT(Registration_ID) AS total_patient_registrations
FROM registration;

USE HMS_Landing
SELECT COUNT(Registration_ID) AS total_patient_registrations
FROM registration;

USE HMS_Staging
SELECT COUNT(Registration_ID) AS total_patient_registrations
FROM registration


--Total Patient Appointements
USE HMS
 SELECT COUNT(Appointment_ID) AS total_patient_appointments
FROM appointment;

USE HMS_Landing
 SELECT COUNT(Appointment_ID) AS total_patient_appointments
FROM appointment;

USE HMS_Staging
 SELECT COUNT(Appointment_ID) AS total_patient_appointments
FROM appointment
WHERE  RowStatus!='D' AND IsLatest='Y';

--Average Cost by operation
USE HMS
SELECT AVG([price])
  FROM [HMS].[dbo].[Operation]

USE HMS_Landing
SELECT AVG([price])
  FROM [dbo].[Operation]

USE HMS_Staging
SELECT AVG([price])
FROM [dbo].[Operation]
WHERE  RowStatus!='D' AND IsLatest='Y';

--Average cost per lab test
USE HMS
SELECT AVG([price])
  FROM [HMS].[dbo].[Lab_Test]

  USE HMS_Landing
  SELECT AVG([price])
  FROM [dbo].[Lab_Test]

  USE HMS_Staging
  SELECT AVG([price])
  FROM [dbo].[Lab_Test]
  WHERE  RowStatus!='D' AND IsLatest='Y';


--Total pharmacy Stock value
USE HMS
SELECT SUM(CurrentQuantity * price) AS total_pharmacy_stock_value
FROM Pharmacy_storage
WHERE CurrentQuantity IS NOT NULL AND price IS NOT NULL;

USE HMS_Landing
SELECT SUM(CurrentQuantity * price) AS total_pharmacy_stock_value
FROM Pharmacy_storage
WHERE CurrentQuantity IS NOT NULL AND price IS NOT NULL;

USE HMS_Staging
SELECT SUM(Quantity * price) AS total_pharmacy_stock_value
FROM Pharmacy_storage
WHERE Quantity IS NOT NULL AND price IS NOT NULL
AND RowStatus!='D' AND IsLatest='Y';


--Earliest Check In
USE HMS
SELECT MIN(CheckIn) AS earliest_check_in
FROM Attendance;

USE HMS_Landing
SELECT MIN(CheckIn) AS earliest_check_in
FROM Attendance;

USE HMS_Staging
SELECT MIN(CheckIn) AS earliest_check_in
FROM Attendance
WHERE  RowStatus!='D' AND IsLatest='Y';


--Earliest Check OUT
USE HMS
SELECT MIN(CheckOut) AS earliest_check_in
FROM Attendance;

USE HMS_Landing
SELECT MIN(CheckOut) AS earliest_check_in
FROM Attendance;

USE HMS_Staging
SELECT MIN(CheckOut) AS earliest_check_in
FROM Attendance
WHERE  RowStatus!='D' AND IsLatest='Y';


--TESTING MedicalHistoryRecordCount
USE HMS
SELECT COUNT(DISTINCT History_ID) AS number_of_medical_history_records
FROM Medical_history;

USE HMS_Landing
SELECT COUNT(DISTINCT History_ID) AS number_of_medical_history_records
FROM Medical_history;

USE HMS_Staging
SELECT COUNT(DISTINCT History_ID) AS number_of_medical_history_records
FROM Medical_history
where RowStatus!='D' AND IsLatest='Y';




--TESTING NumberOfPatientsWithMedicalHistory
USE HMS
SELECT p.Patient_ID, COUNT(MH.medication) AS Medical_History_Records_per_Patient
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID
GROUP BY p.patient_ID;


USE HMS_Landing
SELECT p.Patient_ID, COUNT(MH.medication) AS Medical_History_Records_per_Patient
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID
GROUP BY p.patient_ID;

USE HMS_Staging
SELECT p.Patient_ID, COUNT(MH.medication) AS Medical_History_Records_per_Patient
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID
WHERE MH.RowStatus != 'D' AND MH.IsLatest = 'Y'
GROUP BY p.Patient_ID;



--Number of Patients with Medical History Records
USE HMS
SELECT COUNT(DISTINCT MH.Patient_ID) AS NumberOfPatientsWithMedicalHistory
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID;

USE HMS_Landing
SELECT COUNT(DISTINCT MH.Patient_ID) AS NumberOfPatientsWithMedicalHistory
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID;

USE HMS_Staging
SELECT COUNT(DISTINCT MH.Patient_ID) AS NumberOfPatientsWithMedicalHistory
FROM [dbo].[Patient] P
JOIN [dbo].[Medical_history] MH
ON P.Patient_ID = MH.Patient_ID
WHERE MH.RowStatus != 'D' AND MH.IsLatest = 'Y';


--Number of Medical History Records with a Certain Medical Condition
USE HMS
SELECT COUNT(*) AS MedicalHistoryRecordCount
FROM [dbo].[Medical_history];

USE HMS_Landing
SELECT COUNT(*) AS MedicalHistoryRecordCount
FROM [dbo].[Medical_history];

USE HMS_Staging
SELECT COUNT(*) AS MedicalHistoryRecordCount
FROM [dbo].[Medical_history]
where RowStatus!='D' AND IsLatest='Y';



--medication per condition 
use HMS
SELECT condition_name, COUNT(DISTINCT medication) AS N_Medications
FROM Medical_history
GROUP BY condition_name;

USE HMS_Landing
SELECT condition_name, COUNT(DISTINCT medication) AS N_Medications
FROM Medical_history
GROUP BY condition_name;

USE HMS_Staging
SELECT condition_name, COUNT(DISTINCT medication) AS N_Medications
FROM Medical_history
where RowStatus!='D' AND IsLatest='Y'
GROUP BY condition_name;














