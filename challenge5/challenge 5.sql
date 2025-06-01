use wency;

-- Create the employees table
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INTEGER
);

-- Insert data into the employees table
INSERT INTO employees (emp_id, emp_name, dept_name, salary) VALUES
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh', 'Finance', 5000),
(107, 'Preet', 'HR', 7000),
(108, 'Maryam', 'Admin', 4000),
(109, 'Sanjay', 'IT', 6500),
(110, 'Vasudha', 'IT', 7000),
(111, 'Melinda', 'IT', 8000),
(112, 'Komal', 'IT', 10000),
(113, 'Gautham', 'Admin', 2000),
(114, 'Manisha', 'HR', 3000),
(115, 'Chandni', 'IT', 4500),
(116, 'Satya', 'Finance', 6500),
(117, 'Adarsh', 'HR', 3500),
(118, 'Tejaswi', 'Finance', 5500),
(119, 'Cory', 'HR', 8000),
(120, 'Monica', 'Admin', 5000),
(121, 'Rosalin', 'IT', 6000),
(122, 'Ibrahim', 'IT', 8000),
(123, 'Vikram', 'IT', 10000),
(124, 'Dheeraj', 'IT', 11000);

select * from employees;
-- List employees with salaries between 5000 and 8000 (inclusive).
select *
from employees
where salary between 5000 and 8000;

-- Display all departments along with their total salary expenditure
select dept_name, sum(salary) as sum_salary
from employees
group by dept_name;

-- Find the employee(s) with the minimum salary in the Finance department.

select *
from employees
where salary = (select min(salary)
from employees 
where dept_name = 'Finance') and dept_name = 'Finance';

select emp_id, emp_name, dept_name,salary,
min(salary) over(partition by dept_name order by salary) as min_salary
from employees
where dept_name = 'Finance';

-- Show the number of employees in each department who earn more than 5000.
select dept_name, count(*) as number_of_employees
from employees
where salary > 5000
group by dept_name;

-- Which department has the highest average salary?
select dept_name, avg(salary) as n
from employees
group by dept_name
order by n desc
limit 1;

-- List all employees whose salary is above the average salary of all employees.
select *
from employees
where salary > (select avg(salary)
				from employees);
                
-- Show employees whose salary is equal to the maximum salary in their department.
select emp_id, emp_name, dept_name, salary
from 
employees a
where salary = (select max(salary) 
from employees
where dept_name= a.dept_name);

-- List all departments and how many employees earn less than 4000 in each.
select dept_name,count(*)
from employees
where salary < 4000
group by dept_name;

-- Find all employees who earn more than any employee in the Admin department.
select *
from employees
where salary > (
select max(salary)
from employees
where dept_name = 'Admin');

-- Show departments sorted by total salary paid, in descending order.
select dept_name, sum(salary) as total_salary
from employees 
group by dept_name
order by total_salary desc;

-- Find the difference between the highest and lowest salary in each department.
select dept_name,(max(salary) - min(salary)) as range_a
from employees
group by dept_name;

-- List the employee(s) who have the third highest salary in the company.
SELECT emp_id, emp_name, dept_name, salary
FROM employees
WHERE salary = (
    SELECT DISTINCT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2
);

-- Find employees whose salary is above the department average but below the overall average.
select *
from employees e
where salary >(
select avg(salary)
from employees 
where dept_name = e.dept_name) and salary < (
select avg(salary)
from employees);