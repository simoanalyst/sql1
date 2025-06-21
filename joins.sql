use simo;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Alice', 'Nairobi'),
(2, 'Bob', 'Mombasa'),
(3, 'Charles', 'Kisumu'),
(4, 'Diana', 'Nakuru'),
(5, 'Eunice', 'Eldoret');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, Product, OrderDate) VALUES
(101, 1, 'Laptop', '2025-06-01'),
(102, 1, 'Phone', '2025-06-02'),
(103, 3, 'Tablet', '2025-06-04');


insert into Orders (OrderID, Product, OrderDate) VALUES
(104, 'Printer', '2025-06-05');


-- join/inner join: returns an intersection of the two tables
select * from Customers
inner join Orders on 
Customers.customerID = Orders.CustomerID;

-- we select specified columns
select Customers.CustomerID, Customers.CustomerName, Customers.City, Orders.OrderID, Orders.Product, Orders.OrderDate, extract(year from Orders.OrderDate) as year_of_purchase
from Customers inner join Orders on
Customers.CustomerID = Orders.CustomerID
ORDER BY OrderDate;

-- let's convert the above to a view
create view  simoo as (
select Customers.CustomerID, Customers.CustomerName, Customers.City, Orders.OrderID, Orders.Product, Orders.OrderDate, extract(year from Orders.OrderDate) as year_of_purchase
from Customers inner join Orders on
Customers.CustomerID = Orders.CustomerID
ORDER BY OrderDate
);



-- LEFT JOIN : returns all data in the table in left hand side
Select * from Customers
left join Orders on
Customers.customerID = Orders.customerID;

select * from Orders
left join Customers on
Orders.CustomerID = Customers.CustomerID;


-- right join: The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1)
select * from Customers
right join Orders on
Customers.CustomerID = Orders.CustomerID;


-- full ourter join:The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
-- not supported in Mysql therefore chose this method.

SELECT Customers.CustomerName, Orders.Product
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.Product
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


