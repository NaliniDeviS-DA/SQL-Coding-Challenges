USE employee;

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Operations');

INSERT INTO location (location_id, location)
VALUES
(1, 'Chennai'),
(2, 'Bangalore'),
(3, 'Hyderabad'),
(4, 'Mumbai'),
(5, 'Delhi');

INSERT INTO employees
(employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary, email)
VALUES
(101, 'Ravi Kumar', 'M', 28, '2019-06-15', 'Data Analyst', 3, 1, 55000.00, 'ravi.kumar@company.com'),
(102, 'Anita Sharma', 'F', 32, '2017-03-10', 'Finance Lead', 2, 2, 75000.00, 'Anita.Sharma@company.com'),
(103, 'Suresh R', 'M', 25, '2021-11-01', 'Software Engineer', 3, 3, 48000.00, 'suresh.r@company.com'),
(104, 'Priya Menon', 'F', 29, '2020-01-20', 'HR Executive', 1, 4, 52000.00, 'priya.menon@hr.com'),
(105, 'Arjun Singh', 'M', 35, '2015-08-05', 'Sales Manager', 4, 5, 90000.00, 'arjun.singh@sales.com');

select * from departments;
select * from employees;
select * from location;

-- SQL Question 1: String Functions (UPPER, LOWER, SUBSTRING, CONCAT)

SELECT employee_name,UPPER(employee_name) u_emp_name, LOWER(employee_name) l_emp_name, 
CONCAT( employee_name,' ', age) emp_name_age from employees;


-- SQL Question 2: Date Functions (YEAR(), DATEDIFF(), NOW())

SELECT YEAR(hire_date) year FROM employees;
SELECT MONTH(hire_date) year FROM employees;
SELECT DATE_FORMAT(hire_date,'%d-%b-%y') as DATE from employees;
SELECT DATE_FORMAT(hire_date,'%d-%m-%Y') as DATE from employees;
select NOW() from employees;
SELECT DATEDIFF(CURDATE(), hire_date) as date_diff from employees;

ALTER TABLE employees ADD COLUMN first_name VARCHAR(20);
ALTER TABLE employees ADD COLUMN last_name VARCHAR(20);

UPDATE employees SET first_name='Ravi' WHERE employee_id=101;
UPDATE employees SET last_name='Kumar' WHERE employee_id=101;
UPDATE employees SET first_name='Anita' WHERE employee_id=102;
UPDATE employees SET last_name='Sharma' WHERE employee_id=102;

-- SQL Question 3: User-defined Function

DELIMITER $$
CREATE FUNCTION get_full_name(
    first_name VARCHAR(50),
    last_name  VARCHAR(50)
)
RETURNS VARCHAR(101)
DETERMINISTIC
BEGIN
    RETURN CONCAT_WS(' ', first_name, last_name);
END$$
DELIMITER ;

SELECT get_full_name('Priya', 'Menon') AS full_name;

SELECT
    get_full_name(first_name, last_name) AS full_name
FROM employees;






