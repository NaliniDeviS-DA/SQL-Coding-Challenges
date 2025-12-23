CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE patients (
PatientID INT,
PatientName VARCHAR(25),
Age INT,
Gender ENUM('M','F'),
AdmissionDate DATE);

ALTER TABLE PATIENTS ADD DoctorAssigned VARCHAR(50);
ALTER TABLE Patients MODIFY PatientName VARCHAR(100);
RENAME TABLE Patients TO Patient_Info;

INSERT INTO Patient_Info
(PatientID, PatientName, Age, Gender, AdmissionDate)
VALUES
(1, 'Ramesh Kumar', 45, 'M', '2024-01-10'),
(2, 'Sita Devi', 32, 'F', '2024-02-15'),
(3, 'Arjun Rao', 28, 'M', '2024-03-05'),
(4, 'Lakshmi Priya', 36, 'F', '2024-03-22'),
(5, 'Vikram Singh', 52, 'M', '2024-04-01');

TRUNCATE TABLE Patient_Info;
DROP TABLE Patient_Info;




