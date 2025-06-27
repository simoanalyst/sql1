create database changes;

use changes;
create table customers(
customer_id int primary key not null,
customer_name varchar(55),
age int not null,
gender varchar(55) not null,
country varchar(55) not null,
check(age >= 18));

insert into customers values (2,'Sharline', 24,'female', 'Uganda'),
(3,'Mugambi', 34, 'male', 'Tanzania'),
(4, 'James', 43, 'male', 'Kenya'),
(5, 'Mauline', 35, 'female', 'Kenya');

select * from customers;
select * from orders;

create table orders(
order_id int primary key not null,
customer_id int not null,
product varchar(55) not null,
amount int not null,
foreign key (customer_id) references customers(customer_id));

insert into orders values (2, 2,'Sugar', 160),
(3,3, 'Milk', 110),
(4,4, 'Wheat flour', 210),
(5, 5, 'Orange Juice', 230);


select * from customers
inner join orders on
customers.customer_id = orders.order_id;

UPDATE customers
SET customer_name = CONCAT(
    UPPER(LEFT(customer_name, 1)),
    LOWER(SUBSTRING(customer_name, 2))
);

select * from customers;
select * from customers
order by age
limit 3;

select country, avg(age) as avg_age
from customers
group by country
order by avg_age desc
limit 3;

select country,age,  avg(age) as avg_age
from customers
group by country, age
having age > 30;

create view custom_orders as (
select * from customers);

