CREATE DATABASE students;
USE students;

CREATE TABLE courses(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(20));

CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(20),
city VARCHAR(20),
course_id INT,
CONSTRAINT fk_std_cours
FOREIGN KEY (course_id)
REFERENCES courses (course_id));

INSERT INTO courses(course_name) VALUES 
('CSE'),
('IT'),
('EEE'),
('ECE'),
('ML & AI');

INSERT INTO students (student_name, city, course_id) VALUES
('Ravi',    'Chennai',     1),
('Anu',     'Bangalore',  2),
('Karthik', 'Hyderabad',  3),
('Arun',    'Mumbai',     5), 
('Divya',   'Chennai',    1), 
('Suresh',  'Bangalore',  2), 
('Meena',   'Chennai',    1), 
('Rahul',   'Hyderabad',  3), 
('Kavya',   'Mumbai',     5);

TRUNCATE TABLE students;
SELECT * FROM courses;
SELECT * FROM students;

-- SQL Question 1: INNER JOIN
SELECT s.*, c.* FROM students s
INNER JOIN courses c ON s. course_id = c. course_id ORDER BY student_id;

-- SQL Question 2: LEFT & RIGHT JOIN
SELECT c.*, s.* FROM courses c
LEFT OUTER JOIN students s ON c. course_id = s. course_id;

SELECT c.*, s.* FROM courses c
RIGHT OUTER JOIN students s ON c. course_id = s. course_id;

-- SQL Question 3: UNION vs UNION ALL

CREATE TABLE courses_1(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(20));

INSERT INTO courses_1(course_name) VALUES 
('CSE'),
('IT'),
('MECHNICAL'),
('AUTOMOBILE');

SELECT * FROM courses
UNION 
SELECT * FROM courses_1;

SELECT * FROM courses
UNION ALL 
SELECT * FROM courses_1;


