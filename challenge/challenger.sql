-- SQL CHALLENGER QUESTIONS

-- Who is the youngest employee in each department?
select name, department, age
from employees
where age = (select min(age)as min_age
from employees);

-- List employees earning more than the average salary of their department.
select *
from employees
where salary > (select avg(salary) from employees
where department = department);

-- Find the second highest salary in the entire table.
select max(salary) as second_largest_salary
from employees 
where salary < (select max(salary)
from employees);
select * from employees;
-- List employees who are from the same country and department as at least one other employee.
select *
from employees e
where exists (
select 1
from employees 
where country = e.country and department = e.department and employee_id != e.employee_id);


-- Find employees who have the exact same salary and age. 😥
select * 
from employees e
where exists
(select 1
from employees 
where salary = e.salary and
      age = e.age and
      employee_id != e.employee_id);
      
-- Find the department with the most employees from Kenya. 😤😤😤
select department
from employees 
where country = 'Kenya'
group by department
order by count(*) desc
limit 1;

-- Display each country and the average age of its employees, only if the average age is below 35.
select country, avg(age) as avg_age
from employees 
group by country
having avg(age) < 35;


-- List departments where all employees are younger than 40.
select department
from employees 
group by department
having max(age) < 40;


