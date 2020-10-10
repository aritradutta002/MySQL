use hr;
select salary, if(salary>10000 , 'High','Low') as sal_grade from employees;
select ifnull(salary,10000) from  employees;

#Display salay, and sal_grade as ‘Good’ if salary >15000 other wise ‘Bad’
select salary , if(salary>15000,'Good','Bad') as SalGrade from employees;

#Display id, firstname,department_id salary and list 0 if commission_pct value is NULL for those employees belong to department id 80 and 90
select employee_id , first_name, department_id, salary, ifnull(commission_pct,0) from employees where department_id in (80,90);

select nullif(25,'Hello');
select nullif(25,25);


select last_name , job_id, salary , 
case job_id when 'IT_PROG'  then 1.10*salary
			when 'ST_CLERK' then 1.15*salary
			when 'SA_REP'	then 1.20*salary
else 		salary end as REVISED_SALARY
from employees;

#Categorize the salary as category1 : 5000 – 8000, category2: 8001 – 12000, category3: 12001-15000, others as special category as sal_category
SELECT last_name, job_id, salary,      
 CASE         
WHEN salary between 5000 and 8000  THEN  'category1'		
WHEN salary between 8001 and 12000 THEN  'category2'		
WHEN salary between 12001 and 15000   THEN  'category3'       
ELSE  'special category' 
END AS sal_category
FROM   Employees;


select count(*) from employees;

#Write a query to tag department as per the number of employees accordingly:
#when employee belongs to particular department  is 1 "Junior department“, 2 or 3 is "Intermediate department“  above 3 is "Senior Department“ provide lable as "Level"
select department_id , count(employee_id) as total,
case
when count(employee_id)=1 then 'Junior department'
when count(employee_id) in (2 ,3) then 'Intermediate Department'
when count(employee_id)>3 then 'Senior Department'
end as "LEVEL"
 from employees group by department_id;
 
select count(coalesce(commission_pct,0)) from employees;   # to replace null value with zero
select count(commission_pct) from employees;     # not include null values

#Write a query to get the number of employees  with the same job. 
select job_id , count(employee_id) from employees group by job_id;

select manager_id , min(salary) from employees group by manager_id order by min(salary);

select year(hire_date) , count(*) from employees group by year(hire_date);

select department_id,count(*), sum(salary) from employees group by department_id;