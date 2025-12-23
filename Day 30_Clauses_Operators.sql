CREATE DATABASE university;

CREATE TABLE department (
dpmt_id INT AUTO_INCREMENT PRIMARY KEY,
dpmt_name VARCHAR(25) );

CREATE TABLE students (
s_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(25),
age INT,
dpmt_id INT,
city VARCHAR(25),
email VARCHAR(25),
GPA INT,
course VARCHAR(25),
CONSTRAINT fk_st_dpmt
FOREIGN KEY (dpmt_id)
REFERENCES department(dpmt_id) ON DELETE CASCADE ON UPDATE CASCADE 
 );

INSERT INTO department (dpmt_name) VALUES
('Computer Science'),
('Commerce'),
('Bsc'),
('BCom');

INSERT INTO students
(student_name, age, dpmt_id, city, email, GPA, course)
VALUES
('Arun', 20, 1, 'Chennai', 'arun@gmail.com', 8, 'BSc'),
('Divya', 21, 1, 'Coimbatore', NULL , 9, 'BSc'),
('Karthik', 22, 2, 'Bangalore', 'karthik@gmail.com', 7, 'BCom'),
('Meena', 20, 2, 'Madurai', 'meena@gmail.com', 8, 'BCom'),
('Suresh', 23, 3, 'Salem', 'suresh@gmail.com', 6, 'BSc');

SELECT * FROM students;
SELECT * FROM students WHERE email IS NULL;
SELECT * FROM students WHERE email IS NOT NULL;
SELECT * FROM students WHERE course IN ('BSc', 'Computer Science');
SELECT * FROM students WHERE GPA BETWEEN 4 AND 7;
SELECT * FROM students WHERE GPA NOT BETWEEN 4 AND 7;



TRUNCATE TABLE students;
TRUNCATE TABLE department;
DROP TABLE department;
DROP TABLE students;
