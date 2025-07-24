
SET search_path TO healthcare_appointments

-- ============================================================
-- DROP EXISTING OBJECTS FOR CLEAN INSTALLATION
-- ============================================================
DROP TABLE IF EXISTS medication CASCADE;
DROP TABLE IF EXISTS prescription CASCADE;
DROP TABLE IF EXISTS appointment CASCADE;
DROP TABLE IF EXISTS patient CASCADE;
DROP TABLE IF EXISTS doctor CASCADE;

DROP SEQUENCE IF EXISTS doctor_seq;
DROP SEQUENCE IF EXISTS patient_seq;
DROP SEQUENCE IF EXISTS appointment_seq;
DROP SEQUENCE IF EXISTS prescription_seq;
DROP SEQUENCE IF EXISTS medication_seq;

DROP FUNCTION IF EXISTS set_doctor_id();
DROP FUNCTION IF EXISTS set_patient_id();
DROP FUNCTION IF EXISTS set_appointment_id();
DROP FUNCTION IF EXISTS set_prescription_id();
DROP FUNCTION IF EXISTS set_medication_id();

DROP VIEW IF EXISTS AppointmentView CASCADE;

CREATE SCHEMA IF NOT EXISTS healthcare_appointments;

-- ============================================================
-- CREATE SEQUENCES FOR SURROGATE KEYS
-- ============================================================
CREATE SEQUENCE doctor_seq START 1;
CREATE SEQUENCE patient_seq START 1;
CREATE SEQUENCE appointment_seq START 1;
CREATE SEQUENCE prescription_seq START 1;
CREATE SEQUENCE medication_seq START 1;

-- ============================================================
-- DDL: CREATE TABLES
-- ============================================================
CREATE TABLE doctor (
    doctor_id INTEGER PRIMARY KEY,
    speciality VARCHAR(100),
    licence_number VARCHAR(50) UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20)
);

CREATE TABLE patient (
    patient_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    dob DATE,
    address VARCHAR(200)
);

CREATE TABLE appointment (
    appointment_id INTEGER PRIMARY KEY,
    patient_id INTEGER REFERENCES patient(patient_id),
    doctor_id INTEGER REFERENCES doctor(doctor_id),
    datetime TIMESTAMP,
    purpose VARCHAR(200),
    status VARCHAR(50)
);

CREATE TABLE prescription (
    prescription_id INTEGER PRIMARY KEY,
    appointment_id INTEGER REFERENCES appointment(appointment_id),
    start_date DATE,
    observations TEXT,
    instructions TEXT,
    end_date DATE
);

CREATE TABLE medication (
    medication_id INTEGER PRIMARY KEY,
    prescription_id INTEGER REFERENCES prescription(prescription_id),
    name VARCHAR(100),
    manufacturer VARCHAR(100),
    dosageform VARCHAR(50),
    cost DECIMAL(10,2)
);

-- ============================================================
-- DDL: CREATE TRIGGER FUNCTIONS FOR AUTOMATIC SURROGATE KEY POPULATION
-- ============================================================
CREATE OR REPLACE FUNCTION set_doctor_id() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.doctor_id IS NULL THEN
        NEW.doctor_id := nextval('doctor_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_patient_id() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.patient_id IS NULL THEN
        NEW.patient_id := nextval('patient_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_appointment_id() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.appointment_id IS NULL THEN
        NEW.appointment_id := nextval('appointment_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_prescription_id() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.prescription_id IS NULL THEN
        NEW.prescription_id := nextval('prescription_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION set_medication_id() 
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.medication_id IS NULL THEN
        NEW.medication_id := nextval('medication_seq');
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ============================================================
-- DDL: CREATE TRIGGERS FOR TABLES
-- ============================================================
CREATE TRIGGER trg_set_doctor_id
BEFORE INSERT ON doctor
FOR EACH ROW
EXECUTE FUNCTION set_doctor_id();

CREATE TRIGGER trg_set_patient_id
BEFORE INSERT ON patient
FOR EACH ROW
EXECUTE FUNCTION set_patient_id();

CREATE TRIGGER trg_set_appointment_id
BEFORE INSERT ON appointment
FOR EACH ROW
EXECUTE FUNCTION set_appointment_id();

CREATE TRIGGER trg_set_prescription_id
BEFORE INSERT ON prescription
FOR EACH ROW
EXECUTE FUNCTION set_prescription_id();

CREATE TRIGGER trg_set_medication_id
BEFORE INSERT ON medication
FOR EACH ROW
EXECUTE FUNCTION set_medication_id();

-- ============================================================
-- DDL: CREATE A VIEW FOR APPOINTMENT INFORMATION.
-- We create view here because appointment is the most frequently viewd table, and to enhances the design by making data retrieval simpler and more consistent throughout the application.
-- ============================================================
CREATE OR REPLACE VIEW AppointmentView AS
SELECT a.appointment_id,
       p.first_name || ' ' || p.last_name AS patient_name,       
	   a.datetime,
       a.purpose,
       a.status,
       d.first_name || ' ' || d.last_name AS doctor_name,
       d.speciality
FROM appointment a
JOIN patient p ON a.patient_id = p.patient_id
JOIN doctor d ON a.doctor_id = d.doctor_id;
