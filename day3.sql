use hr;
select * from employees;
select first_name,last_name,salary from employees;
select first_name,last_name,(salary*12)+1000 as 'sal & bonus' from employees;
select first_name,last_name,salary,salary+(salary*commission_pct) 'salary with commission' from employees;
select distinct department_id from employees;
select distinct department_id , job_id from employees;

# immediate query data

select 10 + 20 Total;
select current_date();
select now();

select last_name , salary*12 as annual_sal
from employees
where salary*12 > 150000;  # cannot use 'annual_sal' in where clause as it is a temporary variable

select * from employees where job_id = 'IT_PROG';
select department_id,hire_date from employees where first_name in ('Neena','bruce');
select * from employees where manager_id is NULL;
select * from employees where job_id = 'IT_PROG' and salary >5000;
select * from employees where department_id not in (70,80,90);
select first_name,last_name,salary*12 'annual salary' from employees;
select department_id,job_id from employees where job_id like '%IT%';

# order by

select first_name,salary*12 as annsal from employees order by annsal;
select last_name,job_id,department_id,hire_date from employees order by 3;
select last_name,department_id,salary from employees order by department_id,salary desc;

select first_name,last_name from employees where last_name like '%LI%' order by first_name;

# limit

select first_name,salary from employees order by salary desc limit 5;
select first_name,last_name,salary from employees order by salary limit 2,1; # print third highest salary
select first_name,last_name,salary from employees order by salary limit 2,2; # print third,fourth highest salary

select * from employees where salary > 10000 limit 2;