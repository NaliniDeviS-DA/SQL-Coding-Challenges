CREATE DATABASE bookstore;
USE bookstore;

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100) NOT NULL,
    author VARCHAR(100),
    price DECIMAL(6,2) CHECK (price > 0)
    );
    
    CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    book_id INT,
    order_date DATE DEFAULT (CURRENT_DATE),
    total_amount INT CHECK (total_amount > 0),
    CONSTRAINT fk_ord_bk 
    FOREIGN KEY (book_id)
    REFERENCES Books(book_id) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
ALTER TABLE Books ADD COLUMN ISBN INT UNIQUE;
desc Books;

INSERT INTO Books (book_id, book_name, author, price,ISBN) VALUES
(1, 'Atomic Habits', 'James Clear', 450.00, 101),
(2, 'Wings of Fire', 'A P J Abdul Kalam', 350.00, 102);

SELECT * FROM Books;

DELETE FROM Books WHERE book_id=1;
TRUNCATE TABLE Books;

DROP TABLE Books;
DROP TABLE Orders;
