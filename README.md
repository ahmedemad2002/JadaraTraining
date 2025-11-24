# Hospital Management System Data Engineering Pipeline

## 📌 Project Overview

This project is an end-to-end **Data Engineering Pipeline** built for a **Hospital Management System (HMS)**. It simulates a real enterprise workflow starting from an OLTP database and ending with a full Data Warehouse ready for analytics.

You implemented:

* ✔️ Operational database schema (SQL Server)
* ✔️ Fake data generation using **Python + Faker**
* ✔️ Bulk loading into SQL Server
* ✔️ Landing & Staging architecture
* ✔️ Incremental load using **Hash-based CDC**
* ✔️ ETL jobs using **SSIS**
* ✔️ Data Warehouse design (Kimball star schema)
* ✔️ Analytical SQL queries for BI

---

## 🏥 1. Operational Database (Source System)

A complete SQL Server relational database was created to model hospital operations.

### Key Tables:

* **Patients**
* **Employees**
* **Doctors**
* **Nurses**
* **Departments** (medical)
* **Rooms**
* **Appointments**
* **Insurance**
* **Attendance**

### Highlights

* Designed using proper keys, constraints, and normalization rules.
* Realistic fake data generated using Python.
* Data inserted using `BULK INSERT` into SQL Server.

---

## 🧪 2. Fake Data Generation (Python)

A custom Python script generates synthetic data for all tables.

### Features:

* Uses the **Faker** library.
* Ensures **referential integrity** (e.g., doctor belongs to department).
* Outputs CSV files for each table.
* Handles special cases such as:

  * Removing commas in text fields
  * Maintaining valid timestamps
  * Matching foreign keys across tables

---

## 🗃 3. Landing & Staging Layers

Follows a modern data lakehouse pipeline structure.

### **Landing Area**

* Stores raw imported data
* Mirrors source structure exactly

### **Staging Area**

* Applies transformations
* Standardizes and cleans data
* Computes **HashCode** for incremental load tracking

### Incremental Load (CDC Simulation)

* Hash comparison detects new or changed rows.
* Only those rows are passed into the DWH layer.

---

## 🔧 4. SSIS ETL Pipelines

Multiple SSIS packages were built to automate the workflow.

### Packages Include:

* **Extract**: Pull from operational DB → Landing
* **Transform**: Clean, standardize, generate HashCode
* **Load**: Insert into Staging & then DWH

### Techniques Used:

* Lookup transformations
* Derived columns
* Conditional splits
* Surrogate key generation
* Error handling paths

---

## 🏛 5. Data Warehouse (DWH)

Designed using the **Kimball dimensional modeling** methodology.

### ⭐ Dimensions

* DimPatient
* DimDoctor
* DimNurse
* DimEmployee
* DimDepartment
* DimRoom
* DimInsurance
* DimDate

### 📊 Fact Tables

* **FactAppointment** (grain: one row per appointment)
* **FactAttendance** (grain: one row per attendance record)

### Surrogate Keys

* Integer keys
* Improve performance
* Handle slowly changing dimensions (future-ready)

---

## 📈 6. Analytical Queries

SQL queries were developed for BI/analytics use cases.

Example business questions supported:

* Number of appointments per department per month
* Top doctors by patient load
* Room occupancy rates
* Insurance usage statistics
* Employee attendance patterns
* Patient visit frequency by period

---

## 🧰 7. Tools & Technologies

| Category        | Tools                                  |
| --------------- | -------------------------------------- |
| Programming     | Python (Faker)                         |
| Database        | Microsoft SQL Server                   |
| ETL             | SSIS (SQL Server Integration Services) |
| Modeling        | Kimball Star Schema                    |
| Data Loading    | BULK INSERT, SSIS Pipelines            |
| Version Control | Git & GitHub                           |

---

## 🧑‍💻 8. What This Project Demonstrates

This project showcases skills in:

* Database design
* Data generation with Python
* Data ingestion & validation
* Landing/Staging/DWH architecture
* ETL development in SSIS
* Dimensional modeling
* Incremental data pipelines
* Advanced SQL analytics

It represents a real-world end-to-end Data Engineering solution.

---

## 📂 Repository Structure

```
├── /sql
│   ├── create_tables.sql
│   ├── bulk_insert_scripts.sql
│
├── /python-fake-data
│   ├── fake_data_generator.py
│   └── generated_csvs/
│
├── /ssis-packages
│   ├── extract.dtsx
│   ├── transform.dtsx
│   └── load.dtsx
│
├── /dwh
│   ├── dim_tables.sql
│   ├── fact_tables.sql
│   └── analytical_queries.sql
```

---

## 📬 Contact

If you'd like to discuss this project or need help with data engineering topics:
**Ahmed Emad** — Data Engineer

---

## ⭐ Like This Project?

Feel free to fork, clone, or star the repository!
