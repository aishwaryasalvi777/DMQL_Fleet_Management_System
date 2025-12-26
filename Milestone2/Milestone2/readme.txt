README - Fleet Management Database Project
-------------------------------------------------

Project Overview:
This project simulates a database for a fleet and ride-sharing management system using PostgreSQL. 
The design is based on a normalized, logically separated 3-schema architecture:
1. fleet - for static and transactional vehicle data
2. user_ride - for customer-related activity
3. operational - for real-time telemetry and alert logs
All data is manually created.

Files and Folders:
-------------------
- /fleet/*.csv        : Contains data for vehicles, batteries, maintenance, and trips
- /user_ride/*.csv    : Contains data for customers, ride_requests, and payments
- /operational/*.csv  : Contains data for telemetry logs, alerts, and battery_updates
- /docs/create.sql    : SQL file with CREATE TABLE statements for all tables
- /docs/load.sql      : SQL file with COPY commands to bulk load CSV data into PostgreSQL
- /docs/readme.txt    : This file
- /load.ipynb         : This file generates every csv file and all docs

How Data Was Created:
-----------------------
- Using load.ipynb
- All .csv files were generated using dummy data to simulate realistic relationships
- Each table contains rows as per the logical structure
- Foreign key constraints are logically maintained
  e.g., vehicles reference batteries; ride_requests and payments are linked to customers and vehicles

How to Use:
------------
1. Create fleet, operatational, user_ride , docs folder and then run load.ipynb for the data.
2. Create Database and then schemas in PostgreSQL:
    Schemas by using this in query tool of that particular db-
    CREATE SCHEMA fleet;
    CREATE SCHEMA user_ride;
    CREATE SCHEMA operational;

3. Run the create.sql script to create all tables:
    \i docs/create.sql

4. Load the data from .csv files:
    \i docs/load.sql , So you either manually upload csv for each table or do it using queries. But we did it manually for 1st.

5. Run the queries on PostgreSQL

Notes:
-------
- Ensure file paths in load.sql are adjusted if running outside of the current directory structure.
- This datasets are self created.

