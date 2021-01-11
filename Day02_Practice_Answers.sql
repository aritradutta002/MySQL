-- Section A
use hr;
-- 1 Write a query to display the name ( first name and last name ) for those employees who gets 
-- more salary than the employee whose ID is 163

select first_name, last_name 
from employees
where salary > (select salary from employees where employee_id = 163);
                                                            
-- 2. Write a query to display the employee id, employee name (first name and last name ) 
-- for all employees who earn more than the average salary.

select first_name, last_name
from employees
where salary > 
(select avg(salary) from employees);
                                
-- 3. Write a query to display the employee name( first name and last name ) and 
-- hiredate for all employees in the same department as Clara. Exclude Clara.

select first_name, last_name, hire_date
from employees
where department_id = 
(select department_id
from employees
where first_name like 'Clara')
and first_name <> 'Clara';
                                
-- 4. Write a query in SQL to display the first and last name, salary, and 
-- department ID for those employees who earn less than the average salary, 
-- and also work at the department where the employee Laura is working as a first name holder.

select first_name, last_name, department_id
from employees
where salary < (select avg(salary) from employees)
and
department_id = (select department_id from employees where first_name like 'Laura');

-- 5. Display first name ,last name of employees where deparment id is equal to 
-- Adam department id  and employee_id is 144 using subquery.

select first_name, last_name
from employees
where department_id = (select department_id from employees where first_name like 'Adam')
and employee_id = 144;

-- 6. Display all the employees who have their manager and department matching 
-- with the employee having an Employee ID of 121 or 200 but not 121 or 200 using subquery .

select *
from employees
where (manager_id,department_id) in 
									(select manager_id,department_id
                                    from employees
                                    where employee_id in (121,200))
and employee_id not in (121,200);

-- 7. Display 5th highest salary of employee using subquery

select *
from employees
where salary = (select distinct salary from employees order by salary desc limit 4,1);        
        
 -- 8. Display the employee number, name (first name and last name) and job title 
 -- for all employees whose salary is smaller than any salary of those employees 
 -- whose job title is MK_MAN using subquery.
 
 select employee_id, first_name, last_name, job_id
 from employees
 where salary < any (select salary from employees where job_id like 'MK_MAN');

 -- 9. Write a query to find the name (first_name, last_name) of the employees 
--  who have a manager and worked in a US based department using subquery. 
       
select first_name, last_name
from employees
where manager_id in (select employee_id
					from employees
					where department_id in 
											(select department_id 
											from departments
											where location_id in 
																(select location_id
																from locations
																where country_id = 'US')));

-- 10. Write a query in SQL to display the details of the current job for those 
-- employees who worked as a Sales Representative in the past

SELECT * 
 FROM jobs 
 WHERE job_id IN (SELECT job_id 
				 FROM employees 
				 WHERE employee_id IN (SELECT employee_id 
										 FROM job_history 
										 WHERE job_id='SA_REP'));


-- Section B
-- 1. Write a query to display net Salary of employees even if the commission is not given .
 
select first_name,last_name,salary * (1 + ifnull(commission_pct,0)) 'Net Salary'
from employees;

-- 2. Write a query to display employees information where department id is 10,20,30 or not defined.

select *
from employees
where department_id is null
or department_id in (10,20,30);

-- 3. Display first_name of the employees who are not receiving any commission and first 
-- name contains 't'

select first_name
from employees
where commission_pct is null
and first_name like '%t%';

-- 4. Display contactname and phone of customers ,if bizphone is not there homephone should show up.
 
 select contactname, ifnull(bizphone,homephone) 'Phone'
 from contacts;
 
CREATE TABLE IF NOT EXISTS contacts (
    contactid INT AUTO_INCREMENT PRIMARY KEY,
    contactname VARCHAR(20) NOT NULL,
    bizphone VARCHAR(15),
    homephone VARCHAR(15)
);
INSERT INTO contacts(contactname,bizphone,homephone)
VALUES('John Doe','(541) 754-3009',NULL),
      ('Cindy Smith',NULL,'(541) 754-3110'),
      ('Sue Greenspan','(541) 754-3010','(541) 754-3011'),
      ('Lily Bush',NULL,'(541) 754-3111');


-- 5. Display first_name ,commission and where commission ISNULL print 
-- 'Its Null' otherwise print 'Its not null

select first_name, commission_pct, if(commission_pct is null,'Its Null','Its not null')
from employees;

-- Section C
-- 1. Display the below given pattern
-- *
-- **
-- ***

select '*' from dual
union
select '**' from dual
union
select '***' from dual;


-- 2. Display system date ,total number of rows from employees and departments table in a single row and 3 columns

select sysdate(), (select count(employee_id) from employees) 'Total Employees', (select count(department_id) from departments) 'Total Departments';  

-- 3. Display the age if the date of birth is '1999-09-08'

SELECT DATE_FORMAT(FROM_DAYS(DATEDIFF(now(),'1999-09-08')), '%Y')+0 AS Age;
select floor(datediff(current_date,'1999-09-08')/365) from dual;


-- 4. Display '1' if 2<>0 condition is true otherwise display '0' 

select if(2<>0,1,0);

-- 5. Display the user name in mysql

select current_user();