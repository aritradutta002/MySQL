#WAQ to display the names of the employees and average salary
#of his department.

#Using correlated SubQuery
Select employee_id , first_name,last_name, department_id,
salary ,(Select avg(salary) 
		from employees iq
        where iq.department_id= oq.department_id ) as 'Dept_avg'
from employees oq;

#Subquery in from clause
Select employee_id , first_name,last_name, e.department_id,
salary ,da.dept_avg
from employees e
JOIN (Select department_id ,avg(salary)  as 'dept_avg'
		from employees 
		group by department_id) da
on e.department_id=da.department_id;


#window function
Select employee_id , first_name,last_name, department_id,
salary , avg(salary) over (partition by department_id) as dept_avg,
max(salary) over (partition by department_ID) as max_sal
from employees ;

#The other columns are at their default granularity, and the column
#which we use with window function will be at a granularity mentioned in 
# the partition by clause.

# WAQ to display the employee names, their salary, department ids, 
# the maximum and minimum salaries offered in their departments.
select employee_id,first_name, last_name,salary,department_id,
max(salary) OVER (partition by department_id) as max_salary,
min(salary) over (partition by department_id) as min_salary 
from employees;



# WAQ to display the employee names, their salary, department ids, job_ids 
# the maximum and minimum salaries offered in their category (department and
#job_id together).

select employee_id,first_name, last_name,salary,department_id,job_id,
max(salary) OVER (partition by department_id,job_id) as max_salary,
min(salary) over (partition by department_id,job_id) as min_salary 
from employees;


#WAQ to display the employee details , and the total number of employees 
#working in his department.
select employee_id,first_name, last_name,salary,department_id,
count(employee_id) OVER (partition by department_id) as dept_count
from employees;

#WAQ to display the employee details and assign a rank to the
# employees based on the salary they draw.

Select employee_id,first_name, last_name,salary,department_id,
RANK() over ( order by salary desc)
from employees;
Select employee_id,first_name, last_name,salary,department_id,
DENSE_RANK() over ( order by salary desc)
from employees;

#WAQ to display the employee details and assign a rank to the
# employees based on the salary they draw in their department.

Select employee_id, firsT_name,last_name,salary,department_Id,
RANK() over (partition by department_id order by salary desc)
from employees;

Select employee_id, firsT_name,last_name,salary,department_Id,
DENSE_RANK() over (partition by department_id order by salary desc)
from employees;


