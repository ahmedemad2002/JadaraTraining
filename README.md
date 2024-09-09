# Hospital Management System - DB and ETL Project

## Project Overview

This project is a database and ETL (Extract, Transform, Load) implementation for a Hospital Management System. It includes the creation of a source database to store hospital data, landing and staging databases for ETL processes, and SSIS (SQL Server Integration Services) projects to handle the movement of data between these layers.

The project is divided into three main components:
- **SQL Scripts**: Scripts for creating the source, landing, and staging databases.
- **Dummy Data**: CSV files containing the dummy data to be inserted into the source database.
- **SSIS Repos**: SSIS projects that handle the ETL process between the landing and staging databases.

## Project Structure
├── SQL Scripts
│   ├── source_db_creation.sql
│   ├── landing_db_creation.sql
│   └── staging_db_creation.sql
│
├── Dummy Data
│   ├── employees.csv
│   ├── doctors.csv
│   ├── nurses.csv
│   ├── departments.csv
│   ├── appointments.csv
│   ├── rooms.csv
│   └── attendance.csv
│
└── SSIS Repos
    ├── landing_to_staging.dtsx
    └── source_to_landing.dtsx


## Components Description

### 1. SQL Scripts
This folder contains SQL scripts to create the following databases:
- **Source DB**: This is the main operational database that stores all the hospital data such as employee details, department information, patient appointments, etc.
- **Landing DB**: A temporary storage area where raw data is initially landed before processing.
- **Staging DB**: A cleaned and transformed version of the data before it's loaded into the final reporting or analytics environment.

### 2. Dummy Data
This folder contains CSV files with dummy data generated using Python's `Faker` library. These files are to be bulk inserted into the Source DB. Each CSV file corresponds to a table in the source database, such as:
- `employees.csv`
- `doctors.csv`
- `nurses.csv`
- `departments.csv`
- `appointments.csv`
- `rooms.csv`
- `attendance.csv`

### 3. SSIS Repos
This folder contains SSIS packages for the ETL process:
- **source_to_landing.dtsx**: Extracts data from the Source DB and loads it into the Landing DB.
- **landing_to_staging.dtsx**: Transforms data from the Landing DB and loads it into the Staging DB.

## How to Use

1. **Setup the Databases**: Run the SQL scripts in the `SQL Scripts` folder to create the Source, Landing, and Staging databases.
2. **Insert Dummy Data**: Use bulk insert or other import tools to insert the data from the `Dummy Data` CSV files into the Source DB.
3. **ETL Process**: Execute the SSIS packages to perform the ETL steps:
    - Run `source_to_landing.dtsx` to move data from the Source DB to the Landing DB.
    - Run `landing_to_staging.dtsx` to clean and transform the data before loading it into the Staging DB.

## Technologies Used
- **SQL Server**: For database creation and management.
- **SSIS (SQL Server Integration Services)**: For the ETL process.
- **Python (Faker)**: To generate dummy data for testing.
  