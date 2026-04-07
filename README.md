# SQL-Clean-Query

A project demonstrating data cleaning and querying in SQL for patient and insurance information datasets.

## Description

This repository contains SQL queries to clean messy data from patient and insurance tables, and perform specific queries like finding patients covered by Aetna insurance. The project uses SQLite for database operations.
The fictional data set was created using an LLM (ChatGPT). Prompt used below: 

<img color='cyan' width="468" height="132" alt="image" src="https://github.com/user-attachments/assets/c1da5ff6-613f-48c0-b18e-9303516b09ba" />


## Files

### Data Files
- `messy_insurance_table.csv`: Raw insurance provider data with inconsistent formatting
- `messy_patient_info.csv`: Raw patient information data
- `clean_insurance_table.csv`: Cleaned insurance data after applying cleaning queries
- `clean_patient_info.csv`: Cleaned patient data after applying cleaning queries
- `SQL Query - Aetna Patients.csv`: Result of querying patients covered by Aetna
- `mydatabase.db`: SQLite database file containing the tables

### SQL Query Files
- `CleaningQuery_Insurance_table.sql`: SQL query to standardize insurance provider names, handle null values, and extract operational hours
- `CleaningQuery_Patient_table.sql`: SQL query to create full names and clean email addresses
- `QueryforAllpatientscoveredwithAetna.sql`: SQL query to find all patients covered by Aetna insurance by joining cleaned tables

## Setup

1. Ensure SQLite is installed on your system.
2. If using the database file, open it with SQLite:
   ```bash
   sqlite3 mydatabase.db
   ```
3. Alternatively, import the CSV files into SQLite tables:
   ```sql
   .mode csv
   .import messy_insurance_table.csv messy_insurance_table
   .import messy_patient_info.csv messy_patient_info
   ```

## Usage

1. Run the cleaning queries to create clean tables:
   ```sql
   CREATE TABLE clean_insurance_table AS
   [contents of CleaningQuery_Insurance_table.sql]

   CREATE TABLE clean_patient_info AS
   [contents of CleaningQuery_Patient_table.sql]
   ```

2. Execute the Aetna query:
   ```sql
   [contents of QueryforAllpatientscoveredwithAetna.sql]
   ```

3. Export results to CSV if needed:
   ```sql
   .mode csv
   .output SQL Query - Aetna Patients.csv
   SELECT * FROM [your query result];
   ```

## Example Output

The Aetna patients query returns patient ID, full name, cleaned email, and insurance provider for all patients covered by Aetna.

## Requirements

- SQLite 3.x
- CSV files in the repository
