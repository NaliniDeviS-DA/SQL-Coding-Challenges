CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (customer_name, city, email) VALUES
('Ravi', 'Chennai', 'ravi@gmail.com'),
('Anu', 'Bangalore', 'anu@gmail.com'),
('Karthik', 'Hyderabad', 'karthik@gmail.com'),
('Priya', 'Chennai', 'priya@gmail.com'),
('Arun', 'Mumbai', 'arun@gmail.com');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 55000),
('Mobile', 'Electronics', 20000),
('Headphones', 'Accessories', 3000),
('Keyboard', 'Accessories', 1500),
('Chair', 'Furniture', 4500);

INSERT INTO orders (customer_id, product_id, quantity, order_date, total_amount) VALUES
(1, 1, 1, '2024-01-10', 55000),
(2, 2, 2, '2024-01-11', 40000),
(3, 3, 3, '2024-01-12', 9000),
(1, 4, 2, '2024-01-13', 3000),
(4, 5, 1, '2024-01-14', 4500),
(5, 1, 1, '2024-01-15', 55000),
(2, 3, 2, '2024-01-16', 6000),
(3, 2, 1, '2024-01-17', 20000),
(4, 4, 3, '2024-01-18', 4500),
(5, 5, 2, '2024-01-19', 9000);

select * from customers;
select * from products;
select * from orders;

-- SQL Question 1: ORDER BY & LIMIT
SELECT * FROM orders ORDER BY total_amount DESC LIMIT 3; -- Top 3 expensive orders (SQL Question 1: ORDER BY & LIMIT)
SELECT * FROM products ORDER BY price ASC; -- Products sorted by price (low → high)
SELECT * FROM orders ORDER BY order_date DESC; -- To display Latest orders first

-- SQL Question 2: Aggregate Functions 
SELECT SUM(total_amount) AS total_sales FROM orders; -- Total sales
SELECT AVG(total_amount) AS avg_order_value FROM orders; -- Average order value
SELECT MAX(total_amount) AS highest_order, MIN(total_amount) AS lowest_order FROM orders;-- Max & Min order amount 

-- SQL Question 3: GROUP BY & HAVING
SELECT customer_id, COUNT(*) AS order_count FROM orders GROUP BY customer_id; -- Orders count per customer
SELECT category, sum(price) FROM products group by category having sum(price) > 10000;
SELECT customer_id, sum(quantity) FROM orders group by customer_id having sum(quantity) < 5;

