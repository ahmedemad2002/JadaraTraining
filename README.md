# Hospital Management System — Data Engineering Pipeline

## Overview

This project implements an end-to-end **batch data engineering pipeline** for a Hospital Management System. It simulates a production-style environment by separating concerns across **Operational (Source)**, **Landing**, and **Staging** layers, and uses **SSIS** to orchestrate reliable data movement and transformation.

The goal of this project is to demonstrate **database design**, **ETL layering**, and **warehouse-ready data preparation** using enterprise tools and best practices.

---

## Architecture

**Source Database (OLTP)**  
A relational operational database designed in **SQL Server** to store hospital entities such as employees, departments, doctors, nurses, appointments, rooms, and attendance records.

**Landing Layer**  
Acts as a raw ingestion layer. Data is extracted from the source database and loaded with minimal transformation to preserve the original structure and ensure traceability.

**Staging Layer**  
Contains cleaned and transformed data, structured to support downstream analytics and future loading into a dimensional data warehouse.

**ETL Orchestration**  
**SSIS packages** manage data movement between layers, enforcing schema consistency and transformation logic.

---

## Key Engineering Features

- Relational database design using **Microsoft SQL Server**
- Clear separation between **Source**, **Landing**, and **Staging** layers
- **Bulk data ingestion** using CSV files to simulate production-scale loads
- **SSIS-based ETL pipelines** for controlled extraction and transformation
- Incremental-ready design using **hash-based change detection**
- Warehouse-oriented modeling approach (fact/dimension ready)

---

## Repository Structure

├── SQL Scripts

│ ├── source_db_creation.sql

│ ├── landing_db_creation.sql

│ └── staging_db_creation.sql

│
├── Dummy Data

│ ├── employees.csv

│ ├── doctors.csv

│ ├── nurses.csv

│ ├── departments.csv

│ ├── appointments.csv

│ ├── rooms.csv

│ └── attendance.csv

│
└── SSIS Repos

├── source_to_landing.dtsx

└── landing_to_staging.dtsx

---

## Data Generation

Synthetic data is generated using **Python (Faker)** and exported as CSV files.  
The data is intentionally realistic to validate schema design, constraints, and ETL behavior under non-trivial volumes.

---

## Technologies Used

- **Microsoft SQL Server** — database design and management  
- **SSIS (SQL Server Integration Services)** — ETL orchestration  
- **Python (Faker)** — synthetic data generation  

---

## What This Project Demonstrates

- Designing data systems using **layered architecture**
- Translating business entities into relational schemas
- Building **reliable batch ETL pipelines**
- Preparing data for analytical and warehouse use
- Applying enterprise data engineering practices with Microsoft tooling
