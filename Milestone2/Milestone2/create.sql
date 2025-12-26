-- Fleet Schema
CREATE TABLE fleet.vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    model VARCHAR(50),
    status VARCHAR(50),
    latitude NUMERIC(9, 6),
    longitude NUMERIC(9, 6),
    battery_id INTEGER,
    last_updated TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE fleet.batteries (
    battery_id SERIAL PRIMARY KEY,
    capacity_kwh NUMERIC(5, 2),
    health_status VARCHAR(20),
    charge_level NUMERIC(5, 2),
    last_replacement_date DATE,
    last_updated TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE fleet.maintenance (
    maintenance_id SERIAL PRIMARY KEY,
    vehicle_id INTEGER,
    maintenance_type VARCHAR(20),
    scheduled_date DATE,
    cost NUMERIC(10, 2)
);

CREATE TABLE fleet.trips (
    trip_id SERIAL PRIMARY KEY,
    vehicle_id INTEGER,
    start_time TIMESTAMP WITHOUT TIME ZONE,
    end_time TIMESTAMP WITHOUT TIME ZONE,
    start_latitude NUMERIC(9, 6),
    start_longitude NUMERIC(9, 6),
    end_latitude NUMERIC(9, 6),
    end_longitude NUMERIC(9, 6),
    distance_km NUMERIC(10, 2)
);

-- User Ride Schema
CREATE TABLE user_ride.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    default_payment_method VARCHAR(50)
);

CREATE TABLE user_ride.ride_requests (
    ride_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    vehicle_id INTEGER,
    request_time TIMESTAMP WITHOUT TIME ZONE,
    start_latitude NUMERIC(9, 6),
    start_longitude NUMERIC(9, 6),
    end_latitude NUMERIC(9, 6),
    end_longitude NUMERIC(9, 6),
    estimated_fare NUMERIC(6, 2),
    status VARCHAR(20)
);

CREATE TABLE user_ride.payments (
    payment_id SERIAL PRIMARY KEY,
    ride_id INTEGER,
    customer_id INTEGER,
    amount NUMERIC(6, 2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(20)
);

-- Operational Schema
CREATE TABLE operational.telemetry (
    telemetry_id SERIAL PRIMARY KEY,
    vehicle_id INTEGER,
    timestamp TIMESTAMP WITHOUT TIME ZONE,
    speed_kmh NUMERIC(5, 2),
    charge_level NUMERIC(5, 2),
    battery_temp NUMERIC(5, 2),
    latitude NUMERIC(9, 6),
    longitude NUMERIC(9, 6),
    errors TEXT
);

CREATE TABLE operational.alerts (
    alert_id SERIAL PRIMARY KEY,
    vehicle_id INTEGER,
    issue VARCHAR(255),
    severity VARCHAR(20),
    timestamp TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE operational.battery_updates (
    update_id SERIAL PRIMARY KEY,
    battery_id INTEGER,
    vehicle_id INTEGER,
    charge_level_before NUMERIC(5, 2),
    charge_level_after NUMERIC(5, 2),
    timestamp TIMESTAMP WITHOUT TIME ZONE
);
