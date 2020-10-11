use hr;

select e.first_name , e.last_name , e.department_id , d.department_name from employees e 
join departments d
on e.department_id = d.department_id;

select e.first_name , e.last_name , e.department_id , d.department_name , l.city , l.state_province from employees e 
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id;

# which departments has no employee?
select d.department_id , d.department_name from employees e 
right join departments d
on e.department_id = d.department_id 
where e.employee_id is null;

select * from jobs;
select job_title , concat(first_name,' ',last_name) Full_name , max_salary-salary Diff from employees e join jobs j on e.job_id = j.job_id; 

SET sql_mode='PIPES_AS_CONCAT';
select job_title , first_name || ' ' || last_name Full_name , max_salary-salary Diff from employees e join jobs j on e.job_id = j.job_id; 

select e.first_name , e.last_name , e.salary 
from employees e join employees e1 on e.salary < e1.salary
where e1.employee_id = 182;

#Display the first name of all employees along with the first name of their manager.
select e1.first_name Employee_name , e.first_name Manager_Name 
from employees e join employees e1 on e.employee_id = e1.manager_id;


#display the full name (first and last name ) of employees, job title and the salary differences to their own job for those employees who is working in the department ID 80.
select first_name || ' ' || last_name Full_name , job_title , max_salary - salary Salary_difference from employees join jobs using (job_id) where department_id = 80;

select department_name , count(employee_id) from employees join departments using(department_id) group by department_name;


#Write a query in SQL to display the full name (first and last name), and salary of those employees who working in  department located in London
select first_name || ' ' || last_name Full_name , salary from employees join departments using (department_id) join locations using (location_id) where city = 'London';


#employee name if the employee joined before his manager.
select e1.first_name Employee_name from employees e join employees e1 on e.employee_id = e1.manager_id and e1.hire_date > e.hire_date;