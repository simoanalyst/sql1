-- looking at having, distinct, wildcards, in, and, or case
-- creating a table employees
USE simo; -- specifying database to use
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    age INT,
    country VARCHAR(50)
);
-- inserting some dataset
INSERT INTO employees VALUES
(1, 'Alice Kim', 'IT', 75000, 29, 'Kenya'),
(2, 'Bob Otieno', 'HR', 50000, 45, 'Uganda'),
(3, 'Charlie Mwangi', 'IT', 85000, 35, 'Kenya'),
(4, 'Diana Okoth', 'Finance', 65000, 28, 'Tanzania'),
(5, 'Eve Kamau', 'HR', 50000, 45, 'Uganda'),
(6, 'Frank Njoroge', 'IT', 75000, 29, 'Kenya'),
(7, 'Grace Wambui', 'Finance', 70000, 33, 'Kenya'),
(8, 'Hassan Yusuf', 'IT', 85000, 35, 'Ethiopia'),
(9, 'Ivy Chebet', 'Marketing', 60000, 26, 'Kenya'),
(10, 'John Odhiambo', 'Marketing', 60000, 26, 'Tanzania');

select * from employees;
-- IN operator allows to specify multiple values in where clause
SELECT *
FROM employees
WHERE country IN('Kenya', 'Uganda')
ORDER BY age;

-- selecting departments that have employee count > 2 
-- HAVING is used because WHERE does not work with aggregating functions
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;


-- DINSTINCT: Removesduplicate results
SELECT DISTINCT country
FROM employees;

-- like wildcard
SELECT *
FROM employees
WHERE name LIKE 'D%' AND department = 'Finance';

-- combining HAVING with a subquery
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary)
               FROM employees);
               
-- selecting name, department, salary, country of those whose salay is above the average salary ..... had to use a subquery
select name, department, salary, country
from employees 
where salary > (select avg(salary) from employees);

-- case is used to check for a condition and return a value
SELECT name, department,salary,
CASE
WHEN salary >= 80000 THEN 'high'
WHEN salary >= 60000 THEN 'medium'
ELSE 'low'
END AS salary_category
FROM employees;

-- we can create a view of the above
CREATE VIEW employee_salary_category AS
SELECT name, department,salary,
CASE
WHEN salary >= 80000 THEN 'high'
WHEN salary >= 60000 THEN 'medium'
ELSE 'low'
END AS salary_category
FROM employees;

SELECT * FROM employee_salary_category;