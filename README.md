# DMQL Fleet Management System

A comprehensive database system for managing electric vehicle (EV) fleet operations, customer ride-sharing, and real-time operational telemetry. This project demonstrates a production-grade relational database design using PostgreSQL with a normalized, schema-separated architecture.

## 📋 Project Overview

The DMQL Fleet Management System is a multi-schema database solution designed to simulate real-world fleet and ride-sharing operations. The system manages:

- **Vehicle Fleet Management**: Vehicle inventory, battery health, maintenance tracking, and trip history
- **Customer Ride-Sharing**: Customer profiles, ride requests, and payment processing
- **Operational Intelligence**: Real-time telemetry, system alerts, and battery performance monitoring

### Key Features

✅ Normalized database schema with 3-tier logical separation
✅ 1,000 vehicles with complete lifecycle management
✅ 5,000 customers with ride request history
✅ Real-time telemetry tracking for operational monitoring
✅ Comprehensive maintenance and battery health records
✅ Payment and transaction management
✅ Alert system for critical vehicle issues

## 🏗️ Architecture

The system uses a **3-schema architecture** for logical data separation:

### 1. **Fleet Schema** (`fleet`)
Manages vehicle and battery data:
- `vehicles` - Vehicle inventory with status and location
- `batteries` - Battery specifications, health status, and charge levels
- `maintenance` - Scheduled and completed maintenance records
- `trips` - Historical trip data with route information

### 2. **User Ride Schema** (`user_ride`)
Handles customer interactions and transactions:
- `customers` - Customer profiles and contact information
- `ride_requests` - Ride booking requests with origin/destination
- `payments` - Payment transactions and reconciliation

### 3. **Operational Schema** (`operational`)
Tracks real-time system status:
- `telemetry` - Real-time vehicle metrics (speed, charge, temperature)
- `alerts` - System alerts and critical issue notifications
- `battery_updates` - Battery charging cycle tracking

## 📊 Database Schema

### Fleet Schema

#### vehicles
```sql
vehicle_id (PK)      | SERIAL
model                | VARCHAR(50)
status               | VARCHAR(50) - "active", "inactive", "maintenance"
latitude             | NUMERIC(9,6)
longitude            | NUMERIC(9,6)
battery_id (FK)      | INTEGER
last_updated         | TIMESTAMP
```

#### batteries
```sql
battery_id (PK)      | SERIAL
capacity_kwh         | NUMERIC(5,2)
health_status        | VARCHAR(20) - "good", "degraded", "replace soon"
charge_level         | NUMERIC(5,2) - 0-100%
last_replacement_date| DATE
last_updated         | TIMESTAMP
```

#### maintenance
```sql
maintenance_id (PK)  | SERIAL
vehicle_id (FK)      | INTEGER
maintenance_type     | VARCHAR(20)
scheduled_date       | DATE
cost                 | NUMERIC(10,2)
```

#### trips
```sql
trip_id (PK)         | SERIAL
vehicle_id (FK)      | INTEGER
start_time           | TIMESTAMP
end_time             | TIMESTAMP
start_latitude       | NUMERIC(9,6)
start_longitude      | NUMERIC(9,6)
end_latitude         | NUMERIC(9,6)
end_longitude        | NUMERIC(9,6)
distance_km          | NUMERIC(10,2)
```

### User Ride Schema

#### customers
```sql
customer_id (PK)     | SERIAL
name                 | VARCHAR(100)
phone_number         | VARCHAR(15)
email                | VARCHAR(100)
default_payment_method | VARCHAR(50)
```

#### ride_requests
```sql
ride_id (PK)         | SERIAL
customer_id (FK)     | INTEGER
vehicle_id (FK)      | INTEGER
request_time         | TIMESTAMP
start_latitude       | NUMERIC(9,6)
start_longitude      | NUMERIC(9,6)
end_latitude         | NUMERIC(9,6)
end_longitude        | NUMERIC(9,6)
estimated_fare       | NUMERIC(6,2)
status               | VARCHAR(20) - "completed", "cancelled", "ongoing"
```

#### payments
```sql
payment_id (PK)      | SERIAL
ride_id (FK)         | INTEGER
customer_id (FK)     | INTEGER
amount               | NUMERIC(6,2)
payment_method       | VARCHAR(50)
payment_status       | VARCHAR(20) - "completed", "pending", "failed"
```

### Operational Schema

#### telemetry
```sql
telemetry_id (PK)    | SERIAL
vehicle_id (FK)      | INTEGER
timestamp            | TIMESTAMP
speed_kmh            | NUMERIC(5,2)
charge_level         | NUMERIC(5,2)
battery_temp         | NUMERIC(5,2)
latitude             | NUMERIC(9,6)
longitude            | NUMERIC(9,6)
errors               | TEXT - "low_battery", "overheat", etc.
```

#### alerts
```sql
alert_id (PK)        | SERIAL
vehicle_id (FK)      | INTEGER
issue                | VARCHAR(255)
severity             | VARCHAR(20) - "low", "medium", "high"
timestamp            | TIMESTAMP
```

#### battery_updates
```sql
update_id (PK)       | SERIAL
battery_id (FK)      | INTEGER
vehicle_id (FK)      | INTEGER
charge_level_before  | NUMERIC(5,2)
charge_level_after   | NUMERIC(5,2)
timestamp            | TIMESTAMP
```

## 📁 Directory Structure

```
DMQL_Fleet_Management_System/
├── Milestone1/                          # Phase 1 deliverables
├── Milestone2/
│   ├── Milestone2/
│   │   ├── create.sql                   # DDL - CREATE TABLE statements
│   │   ├── load.ipynb                   # Python script to generate mock data
│   │   ├── readme.txt                   # Original documentation
│   │   ├── Demo.mp4                     # System demonstration video
│   │   ├── Milestone2.pdf               # Project report
│   │   │
│   │   ├── fleet/                       # Fleet schema data
│   │   │   ├── vehicles.csv
│   │   │   ├── batteries.csv
│   │   │   ├── maintenance.csv
│   │   │   └── trips.csv
│   │   │
│   │   ├── user_ride/                   # User Ride schema data
│   │   │   ├── customers.csv
│   │   │   ├── ride_requests.csv
│   │   │   └── payments.csv
│   │   │
│   │   ├── operational/                 # Operational schema data
│   │   │   ├── telemetry.csv
│   │   │   ├── alerts.csv
│   │   │   └── battery_updates.csv
│   │   │
│   │   └── docs/
│   │       ├── create.sql               # Main DDL file
│   │       └── load.sql                 # Data loading script
│   │
│   └── Phase2-Query Screenshots/        # Query result documentation
│
├── Project Description.pdf              # Project specification
└── README.md                            # This file
```

## 📊 Dataset Overview

The project includes dynamically generated synthetic data for a realistic fleet management scenario (April 1-18, 2025):

| Table | Records | Description |
|-------|---------|-------------|
| vehicles | 1,000 | Electric vehicles with location tracking |
| batteries | 1,000 | Battery specifications (75-100 kWh capacity) |
| maintenance | 3,000 | Maintenance records per vehicle |
| trips | 70,000 | Trip history with routes and distances |
| customers | 5,000 | Registered ride customers |
| ride_requests | 60,000 | Customer ride requests |
| payments | 60,000 | Payment transactions |
| telemetry | 50,000 | Real-time vehicle metrics |
| alerts | 10,000 | System alerts and issues |
| battery_updates | 2,000 | Battery charging cycle records |

## 🚀 Getting Started

### Prerequisites

- PostgreSQL (v12 or higher)
- Python 3.x (for data generation)
- Jupyter Notebook (optional, for running data generation)

### Installation Steps

#### Step 1: Create Database and Schemas

Connect to PostgreSQL and create the database:

```sql
CREATE DATABASE fleet_management;
```

Then create the three schemas:

```sql
\c fleet_management
CREATE SCHEMA fleet;
CREATE SCHEMA user_ride;
CREATE SCHEMA operational;
```

#### Step 2: Create Tables

Run the DDL script to create all tables with their constraints:

```sql
\i docs/create.sql
```

#### Step 3: Generate Data (Optional)

If you need to regenerate the CSV files, run the Jupyter notebook:

```bash
jupyter notebook load.ipynb
```

This will generate fresh synthetic data in the respective folders.

#### Step 4: Load Data

Load the CSV data into the database using the load script:

```sql
\i docs/load.sql
```

Alternatively, manually upload each CSV file using the PostgreSQL `COPY` command:

```sql
COPY fleet.vehicles FROM '/path/to/fleet/vehicles.csv' DELIMITER ',' CSV HEADER;
COPY fleet.batteries FROM '/path/to/fleet/batteries.csv' DELIMITER ',' CSV HEADER;
COPY fleet.maintenance FROM '/path/to/fleet/maintenance.csv' DELIMITER ',' CSV HEADER;
COPY fleet.trips FROM '/path/to/fleet/trips.csv' DELIMITER ',' CSV HEADER;

COPY user_ride.customers FROM '/path/to/user_ride/customers.csv' DELIMITER ',' CSV HEADER;
COPY user_ride.ride_requests FROM '/path/to/user_ride/ride_requests.csv' DELIMITER ',' CSV HEADER;
COPY user_ride.payments FROM '/path/to/user_ride/payments.csv' DELIMITER ',' CSV HEADER;

COPY operational.telemetry FROM '/path/to/operational/telemetry.csv' DELIMITER ',' CSV HEADER;
COPY operational.alerts FROM '/path/to/operational/alerts.csv' DELIMITER ',' CSV HEADER;
COPY operational.battery_updates FROM '/path/to/operational/battery_updates.csv' DELIMITER ',' CSV HEADER;
```

#### Step 5: Verify Installation

Check that all tables are created and populated:

```sql
SELECT COUNT(*) FROM fleet.vehicles;
SELECT COUNT(*) FROM user_ride.customers;
SELECT COUNT(*) FROM operational.telemetry;
```

## 💡 Example Queries

### Fleet Management Queries

**Find active vehicles with low battery:**
```sql
SELECT v.vehicle_id, v.model, b.charge_level, b.health_status
FROM fleet.vehicles v
JOIN fleet.batteries b ON v.battery_id = b.battery_id
WHERE v.status = 'active' AND b.charge_level < 30;
```

**Get maintenance history for a vehicle:**
```sql
SELECT * FROM fleet.maintenance
WHERE vehicle_id = 1
ORDER BY scheduled_date DESC;
```

**Calculate average trip distance:**
```sql
SELECT vehicle_id, AVG(distance_km) as avg_distance, COUNT(*) as trip_count
FROM fleet.trips
GROUP BY vehicle_id
ORDER BY avg_distance DESC;
```

### Customer & Revenue Queries

**Customer ride frequency:**
```sql
SELECT c.customer_id, c.name, COUNT(r.ride_id) as total_rides
FROM user_ride.customers c
LEFT JOIN user_ride.ride_requests r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY total_rides DESC;
```

**Total revenue by payment method:**
```sql
SELECT payment_method, SUM(amount) as total_revenue, COUNT(*) as transaction_count
FROM user_ride.payments
GROUP BY payment_method
ORDER BY total_revenue DESC;
```

**Pending payments:**
```sql
SELECT p.*, c.name, c.email
FROM user_ride.payments p
JOIN user_ride.customers c ON p.customer_id = c.customer_id
WHERE p.payment_status = 'pending';
```

### Operational Intelligence Queries

**Current vehicle status and telemetry:**
```sql
SELECT v.vehicle_id, v.model, t.speed_kmh, t.charge_level, t.battery_temp
FROM fleet.vehicles v
LEFT JOIN operational.telemetry t ON v.vehicle_id = t.vehicle_id
WHERE t.timestamp = (SELECT MAX(timestamp) FROM operational.telemetry t2 WHERE t2.vehicle_id = v.vehicle_id)
ORDER BY v.vehicle_id;
```

**High-severity alerts:**
```sql
SELECT a.alert_id, a.vehicle_id, a.issue, a.severity, a.timestamp
FROM operational.alerts a
WHERE a.severity = 'high'
AND a.timestamp >= NOW() - INTERVAL '24 hours'
ORDER BY a.timestamp DESC;
```

**Battery health analysis:**
```sql
SELECT battery_id, health_status, AVG(charge_level) as avg_charge
FROM fleet.batteries
GROUP BY battery_id, health_status
HAVING health_status = 'degraded'
ORDER BY avg_charge ASC;
```

## 📝 Data Generation

The `load.ipynb` Jupyter notebook automatically generates synthetic data using Python with Pandas:

- **Vehicles**: 1,000 vehicles with random models (X, Y, 3, S) and coordinates in Buffalo, NY area
- **Batteries**: 1,000 batteries with realistic capacity (75-100 kWh) and health statuses
- **Maintenance**: 3,000 maintenance records distributed across vehicles
- **Trips**: 70,000 trips with realistic start/end times and distances
- **Customers**: 5,000 customers with contact information
- **Ride Requests**: 60,000 ride requests linked to customers and vehicles
- **Payments**: 60,000 payment records with various payment methods
- **Telemetry**: 50,000 telemetry records with speed, charge, and temperature data
- **Alerts**: 10,000 alerts with varying severity levels
- **Battery Updates**: 2,000 battery charge cycle records

All data is generated with realistic relationships and constraints maintained logically.

## 🔑 Key Design Decisions

1. **Normalized Schema**: Third normal form (3NF) design ensures data integrity and minimal redundancy
2. **Schema Separation**: Logical separation improves performance and maintainability
3. **SERIAL Primary Keys**: Auto-incrementing IDs for easy record identification
4. **Timestamp Tracking**: All tables include `last_updated` fields for audit trails
5. **Geographic Data**: NUMERIC(9,6) precision for latitude/longitude coordinates
6. **Status Enumerations**: String-based status fields for flexibility in status definitions
7. **Foreign Key Relationships**: Maintains referential integrity across schemas

## 🐛 Troubleshooting

### Issue: "Cannot find CSV files"
**Solution**: Update the `base_path` in `load.ipynb` to match your local directory structure.

### Issue: "File paths in load.sql are incorrect"
**Solution**: Regenerate `load.sql` using the notebook, or manually adjust paths in the SQL file to match your system.

### Issue: "Foreign key constraint violation"
**Solution**: Ensure all dependent data is loaded in the correct order: load `fleet` schema before `operational`, and `customers` before `ride_requests`.

### Issue: "Insufficient disk space"
**Solution**: The full dataset (~1 million records) requires approximately 500MB. Reduce record counts in `load.ipynb` if needed.

## 📊 Milestones

- **Milestone 1**: Initial project setup and requirements gathering
- **Milestone 2**: Database schema design, data generation, and implementation

## 📄 Files Reference

| File | Purpose |
|------|---------|
| `create.sql` | Database DDL - creates all 10 tables with constraints |
| `load.sql` | DML - COPY statements to load CSV data into database |
| `load.ipynb` | Data generation script - creates all CSV files with synthetic data |
| `Milestone2.pdf` | Detailed project report and analysis |
| `Demo.mp4` | Video demonstration of the system |

## 👥 Data Relationships

### Key Relationships

- **Vehicles → Batteries**: One-to-one relationship via `battery_id`
- **Vehicles → Trips**: One-to-many relationship for trip history
- **Vehicles → Maintenance**: One-to-many relationship for maintenance records
- **Customers → Ride Requests**: One-to-many relationship for booking history
- **Ride Requests → Payments**: One-to-one relationship for fare payment
- **Vehicles → Telemetry**: One-to-many for real-time metrics
- **Vehicles → Alerts**: One-to-many for issue notifications
- **Batteries → Battery Updates**: One-to-many for charge cycle history

## 📈 Performance Considerations

- Index vehicles by `status` for quick fleet queries
- Index telemetry by `vehicle_id` and `timestamp` for time-series analysis
- Index customers by `email` for user lookups
- Index payments by `payment_status` for financial reporting
- Partition large tables (trips, telemetry) by date for better query performance

## 🔐 Security Notes

- Use role-based access control (RBAC) in PostgreSQL for different user types
- Implement query logging for audit compliance
- Consider encrypting sensitive customer data (email, phone)
- Use prepared statements to prevent SQL injection in applications
- Implement backup and recovery procedures

## 📞 Support & Documentation

For additional information, refer to:
- `readme.txt` - Original project documentation
- `Milestone2.pdf` - Detailed analysis and findings
- `Demo.mp4` - System demonstration
- PostgreSQL Official Documentation: https://www.postgresql.org/docs/

## 📜 License

This project is provided as-is for educational and development purposes.

---

**Last Updated**: December 2025  
**Database Version**: PostgreSQL 12+  
**Schema Version**: 2.0
