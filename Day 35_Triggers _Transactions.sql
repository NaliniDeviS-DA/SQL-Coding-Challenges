CREATE database orders;
USE orders;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2)
);

CREATE TABLE Order_History (
    order_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2),
    deleted_on DATETIME
);

INSERT INTO Orders (order_id, customer_name, order_date, amount)
VALUES
(101, 'Ravi Kumar',  '2024-12-01', 4500.00),
(102, 'Anita Sharma','2024-12-05', 3200.50),
(103, 'Suresh Rao',  '2024-12-10', 7800.00),
(104, 'Priya Menon', '2024-12-12', 1500.75),
(105, 'Vikas Singh','2024-12-15', 9200.00);

SELECT * FROM Orders;

-- SQL Question 1: Trigger
-- Trigger to Log Deleted Records (AFTER DELETE Trigger)

DELIMITER //
CREATE TRIGGER trg_orders_delete
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History
    (order_id, customer_name, order_date, amount, deleted_on)
    VALUES
    (OLD.order_id, OLD.customer_name, OLD.order_date, OLD.amount, NOW());
END //
DELIMITER ;

DELETE FROM Orders WHERE order_id = 103;

SELECT * FROM Order_History;

-- SQL Question 2: DCL Commands
CREATE USER 'junioranalyst'@'localhost' IDENTIFIED BY 'abc12345';

SELECT user, host from mysql.user;
GRANT SELECT ON employee.* TO 'junioranalyst'@'localhost';
FLUSH PRIVILEGES;
GRANT SELECT, INSERT ON employee.employees TO 'junioranalyst'@'localhost';
REVOKE INSERT ON employee.employees FROM 'junioranalyst'@'localhost';

-- SQL Question 3: TCL Commands

CREATE DATABASE BANK;
USE BANK;

CREATE TABLE Transactions (
	Cust_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(25),
    AccountNUM INT,
    TransactionDate DATE,
    Balance DECIMAL(15,2)
    );
 
 INSERT INTO Transactions (Customer_Name, AccountNUM, TransactionDate, Balance)
VALUES
('John Doe', 101, '2025-12-01', 5000.00),
('Jane Smith', 102, '2025-12-02', 3000.00),
('Alice Johnson', 103, '2025-12-03', 7500.00),
('Bob Williams', 104, '2025-12-04', 2000.00),
('Chris Brown', 105, '2025-12-05', 1500.00),
('Diana Prince', 106, '2025-12-06', 6000.00),
('Ethan Hunt', 107, '2025-12-07', 4000.00),
('Fiona Gallagher', 108, '2025-12-08', 2500.00),
('George Martin', 109, '2025-12-09', 3500.00),
('Hannah Baker', 110, '2025-12-10', 4500.00);

SELECT * FROM Transactions;
SET AUTOCOMMIT=0;

START TRANSACTION;

UPDATE Transactions SET Balance = Balance-1000 where Cust_ID =1;
UPDATE Transactions SET Balance = Balance+1000 where Cust_ID =4;

SAVEPOINT cust_1_4_trans;
SELECT * FROM Transactions;

UPDATE Transactions SET Balance = Balance-1000 where Cust_ID =1;
UPDATE Transactions SET Balance = Balance+1000 where Cust_ID =6;
 
 SELECT * FROM Transactions;
-- credited to wrong cust_id=6, so rolling back to cust_1_4_trans

ROLLBACK TO SAVEPOINT cust_1_4_trans;
COMMIT;





