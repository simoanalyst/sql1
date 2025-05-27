use simo;
-- activating database read only mode
ALTER DATABASE simo READ ONLY = 1;
-- deactivating database read only mode
ALTER DATABASE simo READ ONLY = 0;

-- table renaming
RENAME TABLE customers TO clients;

ALTER TABLE  CLIENTS
ADD COLUMN county varchar(55);
select * from clients;


-- column dropping
ALTER TABLE CLIENTS
DROP COLUMN county;

-- collumn rename
ALTER TABLE clients
RENAME COLUMN gender TO Sex;

-- addin a column
ALTER TABLE clients
ADD COLUMN DATE_YEAR YEAR;

-- modifying data type
alter table clients
modify column date_year varchar(55);

-- MOVING POSITION OF A COLUMN
ALTER TABLE clients
MODIFY date_year varchar(55)
after last_name;


-- dropping a column
ALTER TABLE clients
DROP date_year; 

-- deleting a row in a table
DELETE FROM clients
WHERE customer_id = 1;

SET AUTOCOMMIT = OFF;
COMMIT;

SELECT * FROM clients;
DELETE FROM clients; 

ROLLBACK;
DELETE FROM clients
WHERE customer_id = 2;
commit;
select * from clients;

-- date functions
CREATE TABLE date_test(
my_date DATE,
my_current_time TIME,
my_date_time DATETIME );

SELECT * FROM date_test;

-- inserting date today, current time and datetime in  our date_test table
INSERT INTO date_test VALUES(
CURRENT_DATE(), CURRENT_TIME(), NOW());

-- UNIQUE CONSTRAINT
-- SUPPOSE WE FORGOT ADDING THE CONSTRAINT WHILE CREATING THE TABLE
select * from clients;
ALTER TABLE clients
ADD CONSTRAINT UNIQUE(email);

-- default constraint :- sets a value if not provided
CREATE TABLE transactions(
transaction_id INT,
trasaction_amount INT,
transaction_date DATETIME DEFAULT NOW()); -- default now() will give us the date and time any transaction is recorded.

alter table transactions
rename column trasaction_amount to transaction_amount;

INSERT INTO transactions (transaction_id, transaction_amount)
VALUES(1001, 25.00),(1002, 43.00); 
INSERT INTO transactions (transaction_id, transaction_amount)
VALUES(1003, 52.00); 
