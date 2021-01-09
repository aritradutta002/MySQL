use li;
-- 1. 	Write a query to print the Genre of the books that has got the best Revenue Increase 
-- from the year 2017 to 2018

select title,genre, (sell_count_2018 * price_per_book) - (sell_count_2017 * price_per_book) Revenue_diff
from book
order by Revenue_diff desc;

-- 2.	Write a query to print the number of books with non available data for language_code.

select count(*) 'Number of Books'
from book
where language_code is Null or language_code like '';

-- 3.	Write a query to print the Genre of the books  that have got 5 least Revenue in the year 2017.

select title,genre 
from book
order by sell_count_2017 * price_per_book asc
limit 5;

-- 4. Write a query to show the Department & Joining year for Jennice & Daniel.

select depertment, year_of_joining 
from employee
where `employee name` in ('Jennice','Daniel');

-- 5. Write a query to show the employee detail where Sr. Leads are earning more than Asst. Managers.

select * 
from employee 
where Designation = 'Sr. Lead' 
and Salary > (select min(Salary) from employee where Designation = 'Asst. Manager');

-- 6. Using the HR Schema, Write a Query to print the name and  a message 'Well Paid' or 'Underpaid' if the salary is above or below 6500$ respectively.
use hr;

select concat(first_name,' ',last_name) 'Employee Name', if(salary>6500,'Well Paid','Underpaid') 'Salary Status'
from employees;

-- 7. Using HR Schema, Write a Query to fetch all the departments and the names of the person managing them.

select concat(first_name,' ',last_name) 'Employee Name', department_name
from departments d left join employees e on  d.manager_id = e.employee_id;

-- 8. Using HR Schema, Write a query to list the names of all people who report to the same person in department Accounting (i.e.110).

SELECT e1.employee_id,concat(e1.first_name,' ',e1.last_name) 'Employee Name', e2.employee_id 'Manager_Id', concat(e2.first_name,' ',e2.last_name) 'Manager Name',e2.department_id
FROM employees e1 
JOIN employees e2
ON e1.manager_id=e2.manager_id 
AND e1.employee_id!=e2.employee_id
WHERE e2.department_id=110;

-- 9. Write a query in SQL to display the department name, city, and state province for each department.

select department_name, city, state_province
from departments join locations using (location_id);

-- 10. Write a query in SQL to display the job title, department name, full name (first and last name ) of employee, and starting date for all the jobs which started on or after 1st January, 1993 and ending with on or before 31 August, 1997.

select job_title, department_name, concat(first_name,' ',last_name) 'Employee Name', hire_date
from employees join departments using (department_id) 
join jobs using (job_id) 
join job_history using (job_id)
where start_date >= '1993-01-01' and end_date <= '1997-08-31'; 