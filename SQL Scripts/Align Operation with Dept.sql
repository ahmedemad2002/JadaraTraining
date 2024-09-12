USE HMS;
GO
--Operations in Dept 1
WITH OPERATIONSDEPT1 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =1)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Tumor Resection'),
    ('Chemotherapy Administration'),
    ('Radiation Therapy'),
    ('Targeted Therapy'),
    ('Immunotherapy'),
    ('Bone Marrow Biopsy'),
    ('Hormone Therapy'),
    ('Palliative Care Procedures')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT1);

--Operations in Dept 2
WITH OPERATIONSDEPT2 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =2)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Biopsy'),
    ('Cytology'),
    ('Autopsy'),
    ('Histopathology Examination'),
    ('Immunohistochemistry'),
    ('Molecular Pathology Testing'),
    ('Pap Smear'),
    ('Frozen Section Analysis')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT2);

--Operations in Dept 3
WITH OPERATIONSDEPT3 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =3)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Prostatectomy'),
    ('Cystoscopy'),
    ('Nephrectomy'),
    ('Ureteroscopy'),
    ('Lithotripsy'),
    ('Bladder Augmentation'),
    ('Circumcision'),
    ('Vasectomy'),
    ('Urethral Reconstruction')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT3);

--Operations in Dept 4
WITH OPERATIONSDEPT4 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =4)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Hip Replacement Surgery'),
    ('Cataract Surgery'),
    ('Spinal Decompression'),
    ('Pacemaker Implantation'),
    ('Joint Replacement'),
    ('Osteoporosis Management Procedures'),
    ('Dementia-related Surgical Interventions'),
    ('Bariatric Surgery'),
    ('Pain Management Injections')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT4);

--Operations in Dept 5
WITH OPERATIONSDEPT5 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =5)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Pediatric Tonsillectomy'),
    ('Congenital Heart Defect Repair'),
    ('Hernia Repair'),
    ('Pediatric Orthopedic Surgery'),
    ('Cleft Lip and Palate Repair'),
    ('Pediatric Endoscopy'),
    ('Inguinal Hernia Surgery'),
    ('G-tube Placement'),
    ('Appendectomy')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT5);

--Operations in Dept 6
WITH OPERATIONSDEPT6 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =6)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Cesarean Section'),
    ('Hysterectomy'),
    ('Ovarian Cystectomy'),
    ('Endometrial Biopsy'),
    ('Laparoscopic Surgery'),
    ('Pelvic Floor Repair'),
    ('Dilation and Curettage (D&C)'),
    ('Tubal Ligation'),
    ('Vaginal Birth After Cesarean (VBAC) Management')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT6);

--Operations in Dept 7
WITH OPERATIONSDEPT7 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =7)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Total Knee Replacement'),
    ('Shoulder Arthroscopy'),
    ('Hip Fracture Repair'),
    ('Spinal Fusion'),
    ('Carpal Tunnel Release'),
    ('Rotator Cuff Repair'),
    ('Ankle Arthroscopy'),
    ('Elbow Decompression'),
    ('Osteotomy')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT7);

--Operations in Dept 8
WITH OPERATIONSDEPT8 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =8)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Trauma Resuscitation'),
    ('Emergency Appendectomy'),
    ('Chest Tube Insertion'),
    ('Laceration Repair'),
    ('Intubation'),
    ('Central Line Placement'),
    ('Emergency Thoracotomy'),
    ('Reduction of Fractures'),
    ('Abdomen Ultrasound')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT8);

--Operations in Dept 9
WITH OPERATIONSDEPT9 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =9)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Endoscopy'),
    ('Colonoscopy'),
    ('Central Venous Catheter Placement'),
    ('Cardioversion'),
    ('Paracentesis'),
    ('Thoracentesis'),
    ('Biopsy of Internal Organs'),
    ('Diagnostic Imaging Procedures'),
    ('Pacemaker Insertion')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT9);

--Operations in Dept 10
WITH OPERATIONSDEPT10 AS(
	SELECT DISTINCT O.Operation_ID
	FROM Operation O
	JOIN Doc_Op DO
	ON O.Operation_ID = DO.Operation_ID
	JOIN Doctor D ON D.Doctor_ID = DO.Employee_ID
	JOIN Employee E ON E.Employee_ID = D.Doctor_ID
	WHERE E.DepartmentID =10)
UPDATE Operation
SET [type] = (SELECT TOP 1 OperationType
FROM (VALUES
    ('Angioplasty'),
    ('Coronary Artery Bypass Grafting (CABG)'),
    ('Electrophysiological Study'),
    ('Implantable Cardioverter Defibrillator (ICD) Insertion'),
    ('Stent Placement'),
    ('Echocardiogram'),
    ('Cardiac Catheterization'),
    ('Heart Valve Repair or Replacement'),
    ('Stress Test')
) AS Operations(OperationType)
ORDER BY NEWID())
WHERE Operation_ID IN (SELECT * FROM OPERATIONSDEPT10);
