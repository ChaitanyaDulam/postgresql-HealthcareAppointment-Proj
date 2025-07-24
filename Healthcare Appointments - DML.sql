SET search_path TO healthcare_appointments

-- ============================================================
-- DML: INSERT SAMPLE DATA
-- ============================================================


/* --- Insert Sample Data into DOCTOR Table --- */
INSERT INTO doctor (speciality, licence_number, first_name, last_name, phone) VALUES
('Cardiology', 'LIC12345', 'John', 'Doe', '555-1111'),
('Neurology', 'LIC23456', 'Alice', 'Smith', '555-2222'),
('Orthopedics', 'LIC34567', 'Bob', 'Johnson', '555-3333'),
('Pediatrics', 'LIC45678', 'Carol', 'Williams', '555-4444'),
('Dermatology', 'LIC56789', 'Dave', 'Brown', '555-5555'),
('Gastroenterology', 'LIC67890', 'Maria', 'García', '555-6666'),
('Endocrinology', 'LIC78901', 'Chen', 'Li', '555-7777'),
('Urology', 'LIC89012', 'Ivan', 'Petrov', '555-8888'),
('Ophthalmology', 'LIC90123', 'Sofia', 'Martinez', '555-9999'),
('Rheumatology', 'LIC01234', 'Ahmed', 'Khan', '555-1011');



/* --- Insert Sample Data into PATIENT Table --- */
INSERT INTO patient (first_name, last_name, phone, dob, address) VALUES
('Emily', 'Davis', '555-1010', '1980-05-20', '123 Main St, Dallas, TX'),
('Frank', 'Miller', '555-2020', '1975-08-15', '456 Oak St, Dallas, TX'),
('Grace', 'Wilson', '555-3030', '1990-12-05', '789 Pine St, Dallas, TX'),
('Hannah', 'Moore', '555-4040', '1985-03-10', '321 Cedar St, Dallas, TX'),
('Ian', 'Taylor', '555-5050', '1992-07-22', '654 Maple St, Dallas, TX'),
('Lakshmi', 'Reddy', '555-6060', '1978-04-04', '987 Elm St, Houston, TX'),
('Carlos', 'Lopez', '555-7070', '1982-11-11', '159 Spruce St, San Antonio, TX'),
('Zara', 'Ali', '555-8080', '1995-02-14', '753 Birch St, Austin, TX'),
('Ming', 'Chen', '555-9090', '1988-09-09', '246 Willow St, Plano, TX'),
('Omar', 'Hassan', '555-0101', '1983-07-30', '369 Poplar St, Irving, TX'),
('Sasha', 'Ivanov', '555-1212', '1986-02-12', '101 Elm St, Dallas, TX'),
('Fatima', 'Al-Muhammad', '555-1313', '1990-11-05', '202 Maple Ave, Dallas, TX'),
('Diego', 'Sánchez', '555-1414', '1978-08-20', '303 Oak Dr, Dallas, TX'),
('Yuki', 'Nakamura', '555-1515', '1988-06-15', '404 Pine Rd, Dallas, TX'),
('Amina', 'Abdi', '555-1616', '1992-03-03', '505 Cedar Ln, Dallas, TX'),
('Luca', 'Rossi', '555-1717', '1995-09-25', '606 Spruce St, Dallas, TX'),
('Mei', 'Chen', '555-1818', '1984-07-19', '707 Birch Blvd, Dallas, TX'),
('Raj', 'Patel', '555-1919', '1979-12-30', '808 Willow Way, Dallas, TX'),
('Sofia', 'Costa', '555-2020', '1991-04-14', '909 Poplar Ct, Dallas, TX'),
('Omar', 'Khan', '555-2121', '1993-10-10', '1010 Redwood Dr, Dallas, TX');



/* --- Insert Sample Data into APPOINTMENT Table --- */
-- Assuming the auto-generated surrogate keys: patient_id and doctor_id were assigned in insertion order.
INSERT INTO appointment (patient_id, doctor_id, datetime, purpose, status) VALUES
(1, 1, '2025-06-01 10:00:00', 'Routine Checkup', 'Scheduled'),
(2, 2, '2025-06-02 11:30:00', 'Neurological Exam', 'Scheduled'),
(3, 3, '2025-06-03 09:15:00', 'Orthopedic Consultation', 'Completed'),
(4, 4, '2025-06-04 14:00:00', 'Pediatric Consultation', 'Cancelled'),
(5, 5, '2025-06-05 16:30:00', 'Dermatology Follow-up', 'Scheduled'),
(6, 6, '2025-07-01 11:30:00', 'Routine Checkup', 'Scheduled'),
(7, 7, '2025-07-01 12:00:00', 'General Consultation', 'Scheduled'),
(8, 8, '2025-07-01 12:30:00', 'Diagnostic Evaluation', 'Scheduled'),
(9, 9, '2025-07-01 13:00:00', 'New Patient Consultation', 'Scheduled'),
(10, 10, '2025-07-01 13:30:00', 'Follow-up Visit', 'Scheduled'),
(11, 1, '2025-07-02 09:00:00', 'Routine Checkup', 'Scheduled'),
(12, 2, '2025-07-02 09:30:00', 'General Consultation', 'Scheduled'),
(13, 3, '2025-07-02 10:00:00', 'Diagnostic Evaluation', 'Scheduled'),
(14, 4, '2025-07-02 10:30:00', 'New Patient Consultation', 'Scheduled'),
(15, 5, '2025-07-02 11:00:00', 'Follow-up Visit', 'Scheduled'),
(16, 6, '2025-07-02 11:30:00', 'Routine Checkup', 'Scheduled'),
(17, 7, '2025-07-02 12:00:00', 'General Consultation', 'Scheduled'),
(18, 8, '2025-07-02 12:30:00', 'Diagnostic Evaluation', 'Scheduled'),
(19, 9, '2025-07-02 13:00:00', 'New Patient Consultation', 'Scheduled'),
(20, 10, '2025-07-02 13:30:00', 'Follow-up Visit', 'Scheduled'),
(4, 2, '2025-07-03 09:15:00', 'Emergency Visit', 'Completed'),
(9, 5, '2025-07-03 10:45:00', 'Second Opinion', 'Scheduled'),
(12, 8, '2025-07-03 11:20:00', 'Routine Checkup', 'Scheduled'),
(15, 1, '2025-07-03 12:00:00', 'Follow-up Consultation', 'Scheduled'),
(18, 6, '2025-07-03 12:50:00', 'Specialist Referral', 'Scheduled');



/* --- Insert Sample Data into PRESCRIPTION Table --- */
INSERT INTO prescription (appointment_id, start_date, observations, instructions, end_date) VALUES
(1, '2025-06-01', 'High blood pressure', 'Take one tablet daily', '2025-06-30'),
(2, '2025-06-02', 'Migraine symptoms', 'Take analgesic when needed', '2025-06-15'),
(3, '2025-06-03', 'Joint pain', 'Apply ointment twice a day', '2025-06-20'),
(4, '2025-06-04', 'Flu symptoms', 'Rest and hydrate', '2025-06-10'),
(5, '2025-06-05', 'Skin irritation', 'Use cream twice daily', '2025-06-25'),
(6,  '2025-06-06', 'Elevated cholesterol observed',       'Adopt a low-fat diet and exercise regularly',                      '2025-07-06'),
(8,  '2025-06-08', 'Mild respiratory infection',              'Use prescribed inhaler twice daily',                                  '2025-07-08'),
(10, '2025-06-10', 'Back pain after injury',                  'Take anti-inflammatory medication and get adequate rest',             '2025-07-10'),
(11, '2025-06-11', 'Elevated blood sugar levels',             'Monitor blood glucose and follow a diabetic-friendly diet',           '2025-07-11'),
(13, '2025-06-13', 'Arthritis symptoms in knee joint',        'Apply hot compress and use pain-relief cream as needed',                '2025-07-13'),
(15, '2025-06-15', 'Seasonal allergies',                      'Take antihistamines as needed and avoid allergens',                   '2025-07-15'),
(16, '2025-06-16', 'Post-injury swelling',                    'Apply ice packs and elevate the affected limb',                       '2025-07-16'),
(18, '2025-06-18', 'Digestive issues reported',              'Follow a bland diet and monitor symptoms',                            '2025-07-18'),
(20, '2025-06-20', 'Elevated blood pressure',                 'Monitor blood pressure regularly and adjust medication if needed',    '2025-07-20'),
(21, '2025-06-21', 'Migraines recurring',                     'Avoid known triggers and use medication when required',               '2025-07-21'),
(22, '2025-06-22', 'Mild dehydration',                        'Increase fluid intake and rest adequately',                           '2025-07-22'),
(23, '2025-06-23', 'Vision issues reported',                   'Schedule an eye exam and use prescribed drops',                       '2025-07-23'),
(25, '2025-06-25', 'General fatigue',                         'Ensure proper rest and nutrition; follow up in 30 days',              '2025-07-25');



/* --- Insert Sample Data into MEDICATION Table --- */
INSERT INTO medication (prescription_id, name, manufacturer, dosageform, cost) VALUES
(1, 'Atenolol', 'PharmaCorp', 'Tablet', 15.99),
(2, 'Sumatriptan', 'MedLife', 'Tablet', 25.50),
(3, 'Ibuprofen Gel', 'HealWell', 'Gel', 9.99),
(4, 'Oseltamivir', 'BioPharm', 'Capsule', 20.00),
(5, 'Hydrocortisone Cream', 'DermaCare', 'Cream', 12.75),
(6,  'Losartan',           'HeartMeds',    'Tablet', 16.50),
(7,  'Albuterol Inhaler',  'RespiraCare',  'Inhaler', 22.00),
(8,  'Naproxen',           'PainAway',     'Tablet', 14.25),
(9,  'Metformin',          'Glucare',      'Tablet', 8.75),
(10, 'Diclofenac Gel',     'SoftRelief',   'Gel',    10.50),
(11, 'Cetirizine',         'AllerFree',    'Tablet', 9.99),
(12, 'Ibuprofen',          'PainOff',      'Tablet', 12.00),
(13, 'Pantoprazole',       'DigestWell',   'Capsule',18.00),
(14, 'Amlodipine',         'CardioMed',    'Tablet', 19.95),
(15, 'Sumatriptan',        'MigraineRelief','Tablet',25.50),
(16, 'Oral Rehydration Salts','HydraLife', 'Powder',  3.50),
(17, 'Latanoprost',        'EyeCare Inc.', 'Solution',30.00),
(18, 'Melatonin',          'SleepWell',    'Tablet', 12.75);

