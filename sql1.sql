-- creating a database
CREATE DATABASE simo;

-- creating a table
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(55),
last_name VARCHAR(55),
age int,
email VARCHAR(55),
country VARCHAR(55), 
category VARCHAR(55),
gender VARCHAR(55));

-- insert some values in it
INSERT INTO customers (customer_id, first_name, last_name, age, email, country, category, gender)
VALUES
(1, 'John', 'Doe', 31, 'john.doe@example.com', 'USA', 'old', 'Male'),
(2, 'Robert', 'Luna', 22, 'robert.luna@example.com', 'Canada', 'baby', 'Male'),
(3, 'David', 'Robinson', 22, 'david.robinson@example.com', 'UK', 'baby', 'Male'),
(4, 'John', 'Reinhardt', 25, 'john.reinhardt@example.com', 'Germany', 'young', 'Male'),
(5, 'Alice', 'Johnson', 28, 'alice.johnson@example.com', 'Australia', 'young', 'Female'),
(6, 'Michael', 'Brown', 35, 'michael.brown@example.com', 'France', 'old', 'Male'),
(7, 'Emma', 'Wilson', 29, 'emma.wilson@example.com', 'USA', 'young', 'Female'),
(8, 'Daniel', 'Davis', 33, 'daniel.davis@example.com', 'UK', 'old', 'Male'),
(9, 'Olivia', 'Miller', 27, 'olivia.miller@example.com', 'Canada', 'young', 'Female'),
(10, 'Matthew', 'Moore', 30, 'matthew.moore@example.com', 'Germany', 'old', 'Male'),
(11, 'Sophia', 'Thomas', 26, 'sophia.thomas@example.com', 'Australia', 'young', 'Female'),
(12, 'Alexander', 'Jackson', 34, 'alexander.jackson@example.com', 'France', 'old', 'Male'),
(13, 'Mason', 'Martin', 24, 'mason.martin@example.com', 'USA', 'young', 'Male'),
(14, 'Isabella', 'Harris', 37, 'isabella.harris@example.com', 'UK', 'old', 'Female'),
(15, 'Ethan', 'Lewis', 23, 'ethan.lewis@example.com', 'Canada', 'baby', 'Male'),
(16, 'Emily', 'Perez', 32, 'emily.perez@example.com', 'Germany', 'old', 'Female'),
(17, 'Jacob', 'Robinson', 21, 'jacob.robinson@example.com', 'Australia', 'baby', 'Male'),
(18, 'Mia', 'Lee', 36, 'mia.lee@example.com', 'France', 'old', 'Female'),
(19, 'Logan', 'Taylor', 25, 'logan.taylor@example.com', 'USA', 'young', 'Male'),
(20, 'Charlotte', 'Anderson', 31, 'charlotte.anderson@example.com', 'UK', 'old', 'Female'),
(21, 'Lucas', 'Martin', 27, 'lucas.martin@example.com', 'Canada', 'young', 'Male'),
(22, 'Amelia', 'Thompson', 30, 'amelia.thompson@example.com', 'Germany', 'old', 'Female'),
(23, 'Elijah', 'Garcia', 24, 'elijah.garcia@example.com', 'Australia', 'young', 'Male'),
(24, 'Ava', 'Martinez', 35, 'ava.martinez@example.com', 'France', 'old', 'Female'),
(25, 'Mason', 'Lewis', 22, 'mason.lewis@example.com', 'USA', 'baby', 'Male');

-- check values inserted
SELECT *
FROM customers;

-- some basic queries (finding average age grouped by country and category ordered by age)
select country, category, AVG(age) AS average_age
FROM customers
GROUP BY country, category
ORDER BY average_age;

-- customer gender count per country
SELECT country, gender, COUNT(customer_id)
FROM customers
GROUP BY country, gender;

-- checking the oldes customer per country
SELECT country, MAX(age) AS oldest
FROM customers
GROUP BY country;

-- selecting customers in usa and uk or those whose age is above the average age

SELECT *
FROM customers
WHERE country IN ('USA', 'UK')
   OR age > (SELECT AVG(age) FROM customers);
   
-- finding average age per category
SELECT category, ROUND(AVG(age),2) AS avg_age_category
FROM customers
GROUP BY CATEGORY;


-- create amother table called orders
CREATE TABLE orders(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount INT,
status VARCHAR(55));

-- INSERTING VALUES IN orders table

INSERT INTO orders (order_id, customer_id, order_date, total_amount, status)
VALUES
(1, 1, '2023-01-15', 400.00, 'Shipped'),
(2, 2, '2023-02-20', 250.00, 'Pending'),
(3, 3, '2023-03-10', 12000.00, 'Delivered'),
(4, 4, '2023-04-05', 400.00, 'Shipped'),
(5, 5, '2023-05-18', 300.00, 'Pending'),
(6, 6, '2023-06-22', 500.00, 'Delivered'),
(7, 7, '2023-07-03', 800.00, 'Shipped'),
(8, 8, '2023-08-12', 350.00, 'Pending'),
(9, 9, '2023-09-25', 120.00, 'Delivered'),
(10, 10, '2023-10-01', 750.00, 'Shipped'),
(11, 11, '2023-11-15', 500.00, 'Pending'),
(12, 12, '2023-12-05', 900.00, 'Delivered'),
(13, 13, '2023-01-10', 400.00, 'Shipped'),
(14, 14, '2023-02-25', 250.00, 'Pending'),
(15, 15, '2023-03-30', 12000.00, 'Delivered'),
(16, 16, '2023-04-15', 400.00, 'Shipped'),
(17, 17, '2023-05-05', 300.00, 'Pending'),
(18, 18, '2023-06-20', 500.00, 'Delivered'),
(19, 19, '2023-07-25', 800.00, 'Shipped'),
(20, 20, '2023-08-01', 350.00, 'Pending'),
(21, 21, '2023-09-10', 120.00, 'Delivered'),
(22, 22, '2023-10-20', 750.00, 'Shipped'),
(23, 23, '2023-11-05', 500.00, 'Pending'),
(24, 24, '2023-12-15', 900.00, 'Delivered'),
(25, 25, '2023-01-22', 400.00, 'Shipped');


-- CHECKING VALUES INSERTED
SELECT * 
FROM orders;

-- finding sum of total amount per status
SELECT status, SUM(total_amount)
FROM orders
GROUP BY status
ORDER BY status;

-- oops order_id 1 had paid 4000 not 400 therefore needs to be updated
UPDATE orders
SET total_amount = 4000
WHERE order_id = 1 AND status = 'Shipped';

-- we join customers table and orders table using inner join (will give data that is shared among the two tables)
SELECT *
FROM customers INNER JOIN orders ON
customers.customer_id = orders.customer_id;

-- we select first_name, age, country,gender, total_amount, status,

SELECT first_name, age,country,gender, total_amount, status
FROM customers INNER JOIN orders ON
customers.customer_id = orders.customer_id
ORDER BY age;

-- we create a view of the above query result
-- benefits of views : improves security, you can hide data such as salary, passwords
-- improves reusability and consistency  thus saving on querrying time
-- reduces duplication and chance of mistake
CREATE VIEW customer_view AS
SELECT first_name, age,country,gender, total_amount, status
FROM customers INNER JOIN orders ON
customers.customer_id = orders.customer_id
ORDER BY age;


-- WE USE THE VIEW NOW
SELECT * FROM customer_view;

-- dropping a view
DROP VIEW customer_view;

-- using the inner join to find sum of total_amount  per country(USA) and indicate the status

SELECT country, status, SUM(total_amount) AS sum_total_amount
FROM customers INNER JOIN orders ON
customers.customer_id = orders.customer_id
WHERE country = 'USA'
GROUP BY country, status;