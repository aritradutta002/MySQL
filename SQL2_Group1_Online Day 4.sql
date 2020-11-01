# Some Analytical Fucntions

#Rank Function / Dense Rank Function
# WAQ to rank the Employees based on the salary they draw in their
#department.

Select employee_id,first_name,last_name,department_id, salary ,
RANK() over (partition by department_id order by salary desc) as sal_rank
From employees;
#or
Select employee_id,first_name,last_name,department_id, salary ,
Dense_RANK() over (partition by department_id order by salary desc) as sal_rank
From employees;

#
# WAQ to display row numbers to the employee data in hr database.
Select * ,row_number() over () as rowno
From employees;


#NTILE
# There is a sports event occuring and i would like to create 10 
#teams out of all the employees in my company. 
# Help me generate the lists.

Select * ,ntile(10) over () as Team_id
from Employees;


# Scenario 1 : 10lakhs - 1 lakh to each student who has scored top marks?
# Scenario 2: xxx lakhs- 1 lakh to each student -rank <=10

#Scenario 1:
# RANK()  - 1 2 3 3 3 6 7 8 8 8 8 11 12 13 ..........
# RANK<=10

#Scenario 2: 
# DENSE_RANK - 1 2 3 3 3 4 5 6 6 6 7 8 9 10 ........
#Dense_rank<=10

# Scenario : 
#P C M - 80 90 90 = 260
#P C M - 80 90 90 = 260
#AGE 

#WAQ to rank employees based on the salary in his/her department.
# Get the details of employees who earn 3rd highest salary in each
#of the department.
select * 
from 
(
select *,
dense_rank() over (partition by department_id order by salary desc) as sal_rank
from employees
) a
where sal_rank=3;


#PErcent Rank -gives percentile ranking 
select *,
percent_rank() over (partition by department_id order by salary) as sal_rank
from employees;


#Cumulative distribution - gives probability of the current value 
#being equal to current value or less
select *,
Cume_Dist() over (partition by department_id order by salary) 
from employees;




use classicmodels;

#WAQ to display the customer and order details ,also show the date on which 
# customer placed his first order , so that a anniversary greeting can be sent

#FIRST_VALUE FUNCTION
Select c.customerNumber, o.orderNumber,o.orderDate,
FIRST_VALUE(orderDate) 
OVER(partition by CustomerNumber order by orderDate ) 'First_order_date'
from customers c
join orders o 
on c.customerNumber=o.CustomerNumber
order by c.customerNumber;

#LAST VALUE
Select c.customerNumber, o.orderNumber,o.orderDate,
LAST_VALUE(orderDate)
OVER(partition by customerNumber order by orderDate
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 'Recent_order_date'
from customers c
join orders o 
on c.customerNumber=o.CustomerNumber
order by c.customerNumber;


#LEAD Function - customer details, current order date and next order date.alter
Select c.customerNumber, o.orderNumber,o.orderDate,
LAG(orderDate,2) 
OVER(partition by CustomerNumber order by orderDate ) 'next_order_date'
from customers c
join orders o 
on c.customerNumber=o.CustomerNumber
order by c.customerNumber;


#LAG FUNCTION - customer details, current order date and previous order date
Select c.customerNumber, o.orderNumber,o.orderDate,
LAG(orderDate,1) 
OVER(partition by CustomerNumber order by orderDate ) 'prev_order_date'
from customers c
join orders o 
on c.customerNumber=o.CustomerNumber
order by c.customerNumber;
