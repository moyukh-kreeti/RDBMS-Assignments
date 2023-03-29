-- Postgres SQL


-- 1. From the following tables write a SQL query to find the details of an employee.
-- Return full name, email, salary, Department Name, postal code, and City.

SELECT e.first_name, e.last_name, e.email, e.salary, d.department_name, l.pin_code, city FROM employees e JOIN departments d ON e.department_id=d.department_id JOIN locations l ON d.location_id=l.location_id;

-- 2. From the following tables write a SQL query to find the departments whose location is in "Jammu Kashmir" or "Jharkhand". Return Department Name, state_province,street_address.

SELECT d.department_name, l.state_province, l.street_address FROM departments d JOIN locations l ON d.location_id=l.location_id WHERE l.city='Jammu Kashmir' OR l.city='Jharkhand';


-- 3. From the following tables write a SQL query to find the count of employees present in different jobs whose average salary is greater than 10,000. Return all the jobs with employee count, Job Name, and average salary.

SELECT count(e.employee_id),j.job_title,AVG(e.salary) FROM employees e JOIN jobs j ON e.job_id=j.job_id GROUP BY j.job_title;

-- 4. From the following table write a SQL query to find all the first_names and last_names in both dependents and employees tables Return the duplicate records as well and order the records in descending order of the last_name column.

SELECT first_name,last_name FROM employees UNION SELECT first_name,last_name FROM dependents ORDER BY last_name;

-- 5. From the following table write a SQL query to list every employee that has a manager with the name of his or her manager.

SELECT e2.first_name ||' '|| e2.last_name as Employee,e.first_name ||' '|| e.last_name as Manager FROM employees e INNER JOIN employees e2 ON e.employee_id=e2.manager_id;


-- 6. Find the departments that have more than 5 employees earning a salary greater than 50,000 and are located in either New York or California. Include the department name, location, and the number of employees meeting the criteria.


SELECT d.department_name, l.city, COUNT(e.employee_id) FROM employees e JOIN departments d ON e.department_id = d.department_id JOIN locations l ON d.location_id=l.location_id WHERE e.salary>=50000 AND (l.city='New York' OR l.city='California') GROUP BY (d.department_name,l.city);

-- 7. List any employees who have dependents and have a job title that includes the word 'manager', and sort the results by department name in ascending order.


SELECT e.first_name || ' ' || e.last_name as Employee,d.department_name,j.job_title FROM employees e JOIN dependents dn ON e.employee_id = dn.employee_id JOIN jobs j ON e.job_id=j.job_id JOIN departments d ON e.department_id=d.department_id WHERE j.job_title LIKE '%manager%' ORDER BY d.department_name ASC;



-- 8. Add a column in the dependent table called “city” depicting their current location of stay. Find all employees who have been hired in the past 3 years and have dependents living in a city that is different from the city they work in (if I work in Kolkata, then my dependent should not be in Kolkata).
-- Additionally, only include employees whose salary is greater than the average salary of their job title(suppose, my job_title is ”developer” and the salary is 80k, and the average salary under the same job_title “developer” is 70k), and whose manager's job title includes the word 'director'. Finally, include the department name and location of each employee, and sort the results by department name in ascending order


ALTER dependents ADD city VARCHAR(255);


SELECT e.first_name,d.department_name,l.city 
FROM 
employees e JOIN departments d ON e.department_id = d.department_id JOIN 
locations l ON d.location_id = l.location_id 
JOIN 
dependents dn ON e.employee_id=dn.employee_id 
WHERE (e.hire_date >= now() - '3 years'::interval) 
AND dn.city<>l.city 
AND e.salary>= (SELECT AVG(salary) FROM employees e2 WHERE e.job_id=e2.job_id) 
AND (SELECT j.job_title FROM employees e3 JOIN jobs j ON e3.job_id=j.job_id WHERE e.manager_id=e3.employee_id) LIKE '%director%'ORDER BY d.department_name;