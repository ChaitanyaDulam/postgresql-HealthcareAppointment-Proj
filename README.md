### Healthcare Appointment System Database:
A structured relational database system developed for managing healthcare appointments, prescriptions, and medications. 
Designed using PostgreSQL, this system simulates real-world clinic workflows with emphasis on data integrity, normalization, and operational efficiency.

### Project Overview
The Healthcare Appointment System is designed to manage patient-doctor appointments, prescriptions, and medication records in a clinic setting. 
It addresses real-world constraints such as avoiding double bookings, prescription linkage, and medication traceability.

### Objectives
- Design a normalized relational database schema.
- Implement scheduling with doctor-patient relationships.
- Manage prescriptions and medications tied to appointments.
- Ensure referential integrity and minimize redundancy.
- Provide scalability for future healthcare features.

### Features
- Doctor-patient appointment scheduling
- Prescription tracking with medication linkage
- Primary & foreign key constraints for data integrity
- Automatic surrogate key generation using triggers
- Pre-defined data insertion scripts and test queries
- SQL view for simplified appointment access

### Entity-Relationship Design
Entities:
- Doctor
- Patient
- Appointment
- Prescription
- Medication

Relationships:
- One doctor ↔ many appointments
- One patient ↔ many appointments
- One appointment ↔ many prescriptions
- One prescription ↔ many medications

### Database Schema
- DBMS: PostgreSQL 17
- Tables Created: 5 (doctor, patient, appointment, prescription, medication)
- DDL + DML: Fully included with triggers and sequences
- View: AppointmentView for detailed appointment data
- Normalization: Applied up to 3NF

### Technologies Used
- PostgreSQL – Database engine
- pgAdmin 4 – SQL GUI for schema management
- ER Assistant – ERD modeling
- PL/pgSQL – Triggers and functions
  
### Setup Instructions
1. Install [PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) and pgAdmin 4
2. Create a schema named healthcare_appointments
3. Run the DDL script from ddl.sql to create tables and triggers
4. Run the DML script from dml.sql to insert sample data
5. Use AppointmentView to query combined appointment details

### Sample SQL Queries
Postgresql

-- View all upcoming appointments

SELECT * FROM AppointmentView WHERE status = 'Scheduled';

-- List all medications prescribed to a patient

SELECT m.name, m.dosageform, m.cost
FROM patient p
JOIN appointment a ON p.patient_id = a.patient_id
JOIN prescription pr ON a.appointment_id = pr.appointment_id
JOIN medication m ON pr.prescription_id = m.prescription_id
WHERE p.first_name = 'Emily' AND p.last_name = 'Davis';
