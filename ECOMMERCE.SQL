

CREATE DATABASE ecommerce1;
USE ecommerce1;



1) CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'Rahul','Bangalore'),
(2,'Priya','Mumbai'),
(3,'Amit','Delhi'),
(4,'Sneha','Chennai'),
(5,'Arjun','Hyderabad'),
(6,'Neha','Pune'),
(7,'Karan','Kolkata'),
(8,'Divya','Ahmedabad'),
(9,'Rohan','Jaipur'),
(10,'Anjali','Mysore');


2) CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101,'Laptop','Electronics',60000),
(102,'Phone','Electronics',25000),
(103,'Shoes','Fashion',3000),
(104,'Watch','Accessories',5000),
(105,'Headphones','Electronics',2000),
(106,'Tablet','Electronics',18000),
(107,'Backpack','Fashion',1500),
(108,'Keyboard','Electronics',1200),
(109,'Mouse','Electronics',800),
(110,'Smart TV','Electronics',45000);

3) CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001,1,101,1,60000),
(1002,2,102,2,50000),
(1003,1,103,3,9000),
(1004,3,104,1,5000),
(1005,2,101,1,60000),
(1006,4,105,2,4000),
(1007,5,106,1,18000),
(1008,6,107,2,3000),
(1009,7,108,1,1200),
(1010,8,110,1,45000);

4) CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments VALUES
(1,1001,'UPI',60000),
(2,1002,'Credit Card',50000),
(3,1003,'Debit Card',9000),
(4,1004,'UPI',5000),
(5,1005,'Net Banking',60000),
(6,1006,'UPI',4000),
(7,1007,'Credit Card',18000),
(8,1008,'Debit Card',3000),
(9,1009,'UPI',1200),
(10,1010,'Credit Card',45000);

5) CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_name VARCHAR(100),
    phone_no VARCHAR(20),
    email VARCHAR(100)
);

INSERT INTO suppliers VALUES
(1,'TechWorld','Rajesh','9876543210','techworld@gmail.com'),
(2,'FashionHub','Priya','9876543211','fashionhub@gmail.com'),
(3,'WatchZone','Amit','9876543212','watchzone@gmail.com'),
(4,'DigitalStore','Kiran','9876543213','digital@gmail.com'),
(5,'GadgetMart','Suresh','9876543214','gadget@gmail.com'),
(6,'MegaElectronics','Pooja','9876543215','mega@gmail.com'),
(7,'StylePoint','Anu','9876543216','style@gmail.com'),
(8,'SmartSolutions','Ravi','9876543217','smart@gmail.com'),
(9,'UrbanFashion','Deepak','9876543218','urban@gmail.com'),
(10,'EliteSupplies','Nisha','9876543219','elite@gmail.com');

6) CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    review_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO reviews VALUES
(1,101,1,5,'Excellent laptop'),
(2,102,2,4,'Good phone'),
(3,103,1,4,'Comfortable shoes'),
(4,104,3,5,'Amazing watch'),
(5,105,4,4,'Nice sound quality'),
(6,106,5,5,'Very useful tablet'),
(7,107,6,3,'Average backpack'),
(8,108,7,4,'Good keyboard'),
(9,109,8,5,'Smooth mouse'),
(10,110,9,5,'Excellent TV');


A) 

B) SELECT * FROM products
   WHERE price > 10000;

C) SELECT * FROM products
   ORDER BY price DESC;

D) SELECT customer_id,
   SUM(total_amount) AS total_spent
   FROM orders
   GROUP BY customer_id;

E) SELECT c.customer_name,
   o.order_id,
   o.total_amount
   FROM customers c
   INNER JOIN orders o
   ON c.customer_id = o.customer_id;

F) SELECT c.customer_name,
   o.order_id
   FROM customers c
   LEFT JOIN orders o
   ON c.customer_id = o.customer_id;
 
G) SELECT c.customer_name,
   o.order_id
   FROM customers c
   RIGHT JOIN orders o
   ON c.customer_id = o.customer_id;

H) SELECT c.customer_name,
   p.product_name,
   o.quantity,
   o.total_amount
   FROM orders o
   INNER JOIN customers c
   ON o.customer_id = c.customer_id
   INNER JOIN products p
   ON o.product_id = p.product_id;

I) SELECT SUM(total_amount)
   AS total_revenue
   FROM orders;

J) SELECT AVG(total_amount)
   AS average_order_value
   FROM orders;

K) SELECT *
   FROM orders
   WHERE total_amount >
   (
    SELECT AVG(total_amount)
    FROM orders
    );

L) CREATE VIEW customer_sales AS
   SELECT c.customer_id,
   c.customer_name,
   SUM(o.total_amount) AS total_sales
   FROM customers c
   JOIN orders o
   ON c.customer_id = o.customer_id
   GROUP BY c.customer_id,c.customer_name;

   SELECT * FROM customer_sales;

M) CREATE INDEX idx_customer
   ON orders(customer_id);

SHOW INDEX FROM orders;

