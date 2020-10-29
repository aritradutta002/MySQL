#Student - student_id, name, marks
# WAQ to get the details of all the students 
#who scored below average so that we can conduct
# a remedial session for them.

Select * 
from students
where marks < (Select avg(marks) from students);


Select avg(marks) from students;

#Types  - Independent Subquery  
#		- Correlated Subquery


# WAQ to get the details of employees who work in 
# Accounting department.

#join
Select employee_id, first_name, last_name,salary,email
from employees e
Join departments d
on e.department_id=d.department_id
Where department_name ='Accounting';

#
Select employee_id, first_name, last_name,salary,email
from employees 
where department_id = ( SElect department_id
							from departments 
						where department_name='Accounting');


#IQ- returning a single row and a single column
#  -Single row Subqueries. / Single column subquery 
#  -singleton operators - = != < > <= >=


# WAQ to get the details of employees who work in 
# Accounting and Finance department.

Select employee_id,first_name,last_name,salary,email
from employees
Where department_id  IN  (SElect department_id
						from departments 
						where department_name='Accounting' 
                        or department_name='Finance');


#IQ- returning a more than 1 row
#  -Multiple row Subquery
#  -set operators - IN , NOT IN


#WAQ to get the details of all the Sales rep employees who earn a salary greater 
#than any of the Sales manager.
select employee_id,first_name,last_name,salary, JOB_ID
from employees 
where job_id = 'SA_REP'
and salary > ANY  ( Select salary 
					from employees
					where job_id='SA_MAN');


#WAQ to get the details of all the Sales rep who earn a salary less than 
#all the sales managers.


select employee_id,first_name,last_name,salary, JOB_ID
from employees 
where job_id = 'SA_REP'
and salary < ALL ( Select salary 
					from employees
					where job_id='SA_MAN');

# Use ANY and ALL keywords along with singleton operators like = != < > <= >=
#Lets us check for multiples values at a time.


# WAQ to display the names of the employees who work in the 
# same department as Bruce Ernst.

Select first_name ,last_name ,department_id
from employees 
where department_id = ( Select department_id 
						from employees 
                        where first_name='Bruce' and last_name='Ernst');

# WAQ to display the names of the employees who work in the 
# same department  and job id as Bruce.
Select first_name ,last_name ,department_id,job_id
from employees 
where department_id = ( Select department_id 
						from employees 
                        where first_name='Bruce' and last_name='Ernst')

and JOB_ID = ( Select job_id 
				from employees
                where first_name='Bruce' and last_name='Ernst')
;

#Multiple column Subquery.
Select first_name ,last_name ,department_id,job_id
from employees 
where (department_id,job_id) = ( Select department_id ,job_id
						from employees 
                        where first_name='Bruce' and last_name='Ernst')
                        ;

# WAQ to display the names of the employees who work in the 
# same department  Steven and have a job id as Lex.

Select first_name 
from employees 
where department_id = (Select department_id
						from employees 
						where first_name='Steven' and last_name='King')
                        
and job_id =( Select job_id 
				from employees 
			where First_name='Lex' and last_name ='De Haan');


/*
#Topics Covered on SQL2 -Online session 1:
Subqueries

- Definition,example
- Types - Independent ,correlated
- Why subquery?
- Other types - single row, multiple row
- Keywords - ANY , ALL 
- Existance test - concepts
- Multiple column subquery
/*