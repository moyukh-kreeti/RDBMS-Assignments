-- 1. Select all records in table “Employees” whose last name starts with ‘Sah’

SELECT * FROM Employees e WHERE e.last_name LIKE 'Sah%';

-- 2. Select 10 employees who were hired between 1st June, 2021 to 15th February,
-- 2022. Start retrieving from the 4th record in the table

SELECT * FROM Employees e WHERE e.hire_date >= '2021-06-01' AND e.hire_date <  '2022-02-01' LIMIT 10 OFFSET 3;

-- 3. Find distinct top 5 salary values (only salary column), using alias for column as
-- “Top 5 salaries”

SELECT DISTINCT salary as "Top 5 salaries" FROM Employees e ORDER BY salary DESC LIMIT 5;

-- 4. Find first_name, last_name and email of employees from the employees table
-- where salary lies between 25000 to 45000

SELECT first_name, last_name,manager_id, salary FROM Employees e WHERE e.salary>=25000 AND e.salary<=45000;


-- 5. Write a query to find first_name, manager_id and salary where the
-- department_id is 101 and sort the result in ascending order of salary.

SELECT first_name,manager_id, salary FROM Employees e WHERE e.department_id=1 ORDER BY salary ASC;

-- 6. Find all the first_name that start with the letter “A”, and find all the last_name
-- that have “TH” in the 2nd and 3rd positions.

SELECT first_name FROM Employees e WHERE e.first_name LIKE 'A%';

SELECT last_name FROM Employees e WHERE e.last_name LIKE '_TH%';
