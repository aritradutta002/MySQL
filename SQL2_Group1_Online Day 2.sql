
#Nested Subqueries
#WAQ to get the details of all the employees who work 
#in the city London locations. (Solve using Subquery)

Select employee_id, first_name,last_name
from employees
where department_id IN (Select Department_id 
						from Departments 
						where location_id = (select location_id 
											from locations
											where City='London')
                                            
						);
#Nested Subqueries.
#oracle allows 255 levels of nesting.
# standard practice - 3 levels.


# WAQ to get the details of all the employees who earn a salary
# less than the average salary in the organisation.

Select employee_id,first_name,last_name,salary,department_id
from employees
where salary < (Select avg(salary) from employees);

# WAQ to get the details of all the employees who earn a salary
# less than the average salary of their department.

Select employee_id,first_name,last_name,salary,department_id
from employees oq
where salary <= (	Select avg(salary) 
					from employees iq
					where iq.department_id=  oq.department_id
				);
#Correlated Subquery - inner Query dependent on outer query for execution.
#If n rows are read by outer query from the table - then inner query runs n times.
# Everytime inner query runs, some value from outer query is dynamically picked up
#substituted and executed.

#WAQ to display the names of the employees who earn a salary 
# that is equal to the maximum salary in their department. 

Select employee_id,first_name,last_name,salary,department_id
from employees oq
where salary = ( Select max(salary)
				from employees iq
                where iq.department_id= oq.department_id);
                


SELECT employee_id,first_name,last_name,salary,department_id
from employees oq
where salary = (select max(salary) 
from employees iq
where iq.department_id=oq.department_id
);

#WAQ to get the details of the employees who get the minimum salary 
# for the job they work.

Select employee_id,first_name,last_name,salary,job_id
from employees oq
where salary = ( Select min(salary) 
					from employees iq
                    where iq.job_id= oq.job_id);

#using subquery in a select clause                    
#WAQ to display the names of the employees and average salary
#of his department.

Select employee_id,first_name,last_name,salary,
department_id, ( Select avg(salary) from employees iq
				where iq.department_id=oq.department_id) 'Dept_Avg'
from employees oq;


#using subquery in having clause
#WAQ to display the department ids /names whose average salary
# is greater than the average salary of dept 50.

Select department_id, avg(salary)
from employees 
group by department_id
having Avg(salary)  > (Select Avg(Salary) 
				from employees 
				where department_id=50);







