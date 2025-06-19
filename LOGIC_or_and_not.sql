-- SELECT, WHERE, ORDER BY, LIMIT, DISTINCT
-- use simo;

select * from employees;

SELECT * 
FROM employees
WHERE department = 'IT' and country = 'Kenya';

-- Order by one column
SELECT *
FROM employees
WHERE country IN ('Kenya', 'Uganda')
ORDER BY age;

-- Order by more than column
SELECT *
FROM employees
WHERE country IN ('Kenya', 'Uganda')
ORDER BY age, name DESC;

-- LIMIT decides the amount of records to be returned
SELECT *
FROM employees
WHERE country = 'Kenya'
ORDER BY salary DESC -- this will help return the highest paid individual in the table.
LIMIT 1; -- returns one record in the table

-- To confirm that this is the highest paid we can use max() function.
SELECT max(salary) AS high_pay
FROM employees;

-- Offsetting while using limit.
-- Skips a specified number of rows before beginning to return rows.
SELECT *
FROM employees
LIMIT 2 OFFSET 1; -- This will skip first row then return the next two rows. 
-- Useful while dealing with a large dataset.

-- DISTINCT: used to eliminate duplicate records in a select query
SELECT DISTINCT department
FROM employees;
-- can be used together with count() function.
SELECT COUNT(DISTINCT employee_id) AS employee_count
FROM employees;
-- use cases of DISTINCT clause: 
-- Removing duplicate entries from a dataset.
-- Identifying unique values or categories.
-- Supporting aggregation or filtering by distinct values. 


-- AND Operator: Returns TRUE only if all conditions connected by AND are true.
-- visual using truth  table
-- | Condition 1 | Condition 2 | Result |
-- | ----------- | ----------- | ------ |
-- | TRUE        | TRUE        | TRUE   |
-- | TRUE        | FALSE       | FALSE  |
-- | FALSE       | TRUE        | FALSE  |
-- | FALSE       | FALSE       | FALSE  |
SELECT * FROM employees
WHERE department = 'IT' AND country = 'Kenya'
ORDER BY employee_id; -- in this case or conditions are met


SELECT * FROM employees
WHERE department = 'IT' AND country = 'Somalia';

SELECT * FROM employees
WHERE department = 'Salesperson' AND country = 'Kenya';

SELECT * FROM employees
WHERE department = 'Salesperson' AND country = 'Somalia';

-- OR operator
-- Returns TRUE if any one of the conditions connected by OR is true.

-- | Condition 1 | Condition 2 | Result |
-- | TRUE        | TRUE        | TRUE   |
-- | TRUE        | FALSE       | TRUE   |
-- | FALSE       | TRUE        | TRUE   |
-- | FALSE       | FALSE       | FALSE  |

SELECT * 
FROM employees
WHERE department = 'IT' OR country = 'Somalia'; -- This returns records where department is IT

-- NOT operator: Inverts the result of a condition. It returns TRUE if the condition is false, and FALSE if the condition is true.
SELECT *
FROM employees
WHERE NOT country = 'Kenya';
-- | Condition | Result |
-- | --------- | ------ |
-- | TRUE      | FALSE  |
-- | FALSE     | TRUE   |

