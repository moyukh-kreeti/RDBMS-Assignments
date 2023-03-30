-- Postgres SQL

-- 1) Find all the departments where the minimum salary is less than 2000.

SELECT d.department_name FROM departments d WHERE EXISTS (SELECT department_id FROM employees e WHERE d.department_id=e.department_id AND e.salary<2000);

-- 2) Find all the countries where no employees exist.

SELECT c.country_name FROM countries c WHERE c.country_id NOT IN 
(SELECT country_id FROM locations WHERE location_id IN 
(SELECT location_id FROM departments WHERE department_id IN 
(SELECT DISTINCT department_id from employees)));



-- 3) From the following tables write a query to find all the jobs, having at least 2 employees in a single department.(don’t use joins)


SELECT job_title,job_id FROM jobs j WHERE EXISTS ( SELECT DISTINCT e1.job_id FROM employees e1 WHERE (SELECT COUNT(employee_id) FROM employees e2 WHERE e1.department_id = e2.department_id)>=2 AND j.job_id=e1.job_id );




-- 4)From the following tables write a query to find all the countries, having cities with all the city names starting with 'a'.(don’t use joins)


SELECT country_name FROM countries c WHERE EXISTS (SELECT country_id FROM locations l  WHERE l.city LIKE 'a%' AND l.country_id = c.country_id);

-- 5)From the following tables write a query to find all the departments, having no cities.

SELECT department_name FROM departments d WHERE EXISTS (SELECT location_id FROM locations l WHERE d.location_id=l.location_id AND l.city=NULL);