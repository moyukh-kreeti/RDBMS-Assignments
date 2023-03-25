-- POSTGRES SQL

-- 1. Write the query to get the department and department wise total(sum) salary,
-- display it in ascending order according to salary.

SELECT department_name,SUM(salary) from employees e, departments d WHERE e.department_id=d.department_id GROUP BY department_name;


-- 2. Write the query to get the department, total no. employee of each department,
-- total(sum) salary with respect to department from "Employee" table.

SELECT department_name,COUNT(first_name) as "Total people",SUM(salary) as "Total department Salary" FROM employees e, departments d WHERE e.department_id=d.department_id GROUP BY department_name;


-- 3. Get department wise maximum salary from "Employee" table order by salary
-- ascending

SELECT department_name,MAX(salary) as "Maximum Salary" FROM employees e , departments d WHERE e.department_id=d.department_id GROUP BY department_name ORDER BY MAX(salary) ASC;

-- 4. Write a query to get the departments where average salary is more than 60k

SELECT department_name FROM employees e , departments d WHERE e.department_id=d.department_id GROUP BY department_name HAVING AVG(salary) >=60000 ;

-- 5. Write down the query to fetch department name assign to more than one
-- Employee

SELECT department_name FROM employees e , departments d WHERE e.department_id=d.department_id GROUP BY department_name HAVING COUNT(department_name)>1 ;

-- 6. Write a query to show department_name and assignedTo where assignedTo
-- will be “One candidate” if its assigned to only one employee otherwise
-- “Multiple candidates”

SELECT department_name,
CASE 
    WHEN COUNT(department_name)=1 THEN 'One candidate'
    WHEN COUNT(department_name)>1 THEN 'Multiple candidates'
    END
AS "assignedTo"
 FROM employees e , departments d WHERE e.department_id=d.department_id GROUP BY department_name;

