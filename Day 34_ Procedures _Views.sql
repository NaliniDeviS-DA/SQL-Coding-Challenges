use employee;

select * from orders;
select * from products;
select * from customers;

insert into customers values (NULL,'keerthi', 'mysore', 'keerthi@gmail.com');

select * from orders where order_date >= 
(select date_sub((select max(order_date) from orders), interval 3 day));

select max(order_date) from orders;

select * from customers where customer_id NOT IN (select customer_id from orders);

-- SQL Question 1: Stored Procedure

DELIMITER //
CREATE PROCEDURE emp_details 
(
    IN emp_id INT, 
    OUT emp_name VARCHAR(25) , 
    OUT gender VARCHAR(1), 
    OUT designation VARCHAR(25)
)
    BEGIN
    SELECT e.employee_name, e.gender, e.designation
    INTO  emp_name, gender, designation
    FROM employees e
    WHERE employee_id = emp_id;
    END //
DELIMITER ;

select * from employees;
CALL emp_details(102, @ename, @gender, @designation);
SELECT @ename, @gender, @designation; 
        
-- SQL Question 2: Simple View
CREATE VIEW emp_name_dept AS
SELECT e.employee_name, d.department_name FROM 
employees e JOIN departments d ON e.department_id = d.department_id;

SELECT * FROM emp_name_dept;

-- SQL Question 3: Complex View

CREATE VIEW emp_dept_salary AS
SELECT 
e.employee_name, e.gender, e.hire_date, e.designation, d.department_name, s.salary 
FROM employees e
JOIN departments d ON e.department_id = d.department_id 
JOIN salary s ON e.salary_id = s.salry_id;

SELECT * FROM emp_dept_salary;
    
    
    
    
