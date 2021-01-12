use hr;
-- 1. Write a query to display the employee id, employee name (first name and last name ) 
-- for all employees who earn more than the average salary.

select first_name, last_name
from employees
where salary > 
(select avg(salary) from employees);                               
                                
-- 2. Write a query in SQL to display the first and last name, salary, and 
-- department ID for those employees who earn less than the average salary, 
-- and also work at the department where the employee Laura is working as a first name holder.

select first_name, last_name, salary, department_id
from employees
where salary < (select avg(salary) from employees)
and
department_id = (select department_id from employees where first_name like 'Laura');

-- 3. Display all the employees who have their manager and department matching 
-- with the employee having an Employee ID of 121 or 200 but not 121 or 200 using subquery .

select *
from employees
where (manager_id,department_id) in 
									(select manager_id,department_id
                                    from employees
                                    where employee_id in (121,200))
and employee_id not in (121,200);

-- 4. Display 5th highest salary of employee using subquery

select *
from employees
where salary = (select distinct salary from employees order by salary desc limit 4,1);     

 -- 5. Write a query to display the name ( first name and last name ), salary, department id for 
 -- those employees who earn such amount of salary which is the smallest salary of any of the departments.
       
select first_name, last_name, salary, department_id
from employees
where salary = any (select min(salary)
					from employees 
                    group by department_id);
       
-- 6. Display the employee details for whom commission is not mentioned.

select *
from employees
where commission_pct is null;

-- 7. Display first_name of the employees who are not receiving any commission and first 
-- name contains 't'

select first_name
from employees
where commission_pct is null
and first_name like '%t%';

-- 8. Display the below given pattern
-- #*#
-- #**#
-- #***#

select '#*#' from dual
union
select '#**#' from dual
union
select '#***#' from dual;

-- 9. Display the age if the date of birth is 15th Jan 1950

SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'1950-01-15')), '%Y')+0 AS Age;

-- 10. Display the user name in mysql

select current_user() from dual;