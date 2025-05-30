create table Customers (
customer_id int primary key,
first_name varchar(55),
last_name varchar(55),
age int,
country varchar(55),
check (age >= 18));
-- inserting values in our table Customers
insert into Customers (customer_id, first_name, last_name, age, country) values
(1, 'John', 'Doe',31, 'USA'),
(2,'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE');


-- creating orders table
create table Orders(
orders_id int primary key,
item varchar(55),
amount int,
customer_id int,
foreign key(customer_id) references Customers(customer_id));

-- inserting values to Orders table
insert into Orders (orders_id, item, amount, customer_id)
values (1, 'Keyboard', 400, 4),
       (2, 'Mouse', 300, 4),
       (3, 'Monitor', 12000, 3),
       (4, 'Keyboard', 400, 1),
       (5, 'Mousepad', 250, 2);
       
-- Find the customer(s) who made the highest single order (by amount).
select first_name, item, max(amount) as high_order_amount 
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
where (select max(amount)
from Orders)
group by first_name, item;

-- List customers who spent above the average total spend of all customers.
select first_name, last_name, item, amount
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
where amount > (select avg(amount)
                from Orders);
                
-- Rank customers by their total spending (highest first), include ties. 
select first_name, last_name, sum(amount),
rank() over(order by sum(amount) desc) as amount_rank
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
group by Customers.customer_id;


-- List countries where every customer has placed at least one order.
select country
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
group by country
having count(Orders.customer_id) >= 1;


-- Find the most frequently ordered item and the number of times it was ordered.
select distinct item, count(*)
from Orders
group by item
order by count(*) desc
limit 1;

--  Identify customers who only ordered items that cost less than 500.
select first_name, last_name, amount
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
group by Customers.customer_id
having max(amount) < 500;

-- Get customers who ordered multiple different items on the same day.
select first_name, last_name
from Customers
inner join Orders on
Customers.customer_id = Orders.customer_id
group by Orders.customer_id
having count(*) > 1;


SELECT first_name, last_name
FROM Customers inner join Orders on Customers.customer_id = Orders.customer_id
GROUP BY Orders.customer_id
HAVING COUNT(DISTINCT item) > 1;


--  Which customers share the same last name but are from different countries?
select distinct c1.last_name
from Customers c1
join Customers c2 on
c1.last_name = c2.last_name
where c1.last_name = c2.last_name and c1.country != c2.country;


