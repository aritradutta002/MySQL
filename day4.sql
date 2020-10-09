use hr;

#  built-in functions

select round(45.925,2),round(45.923,0);    
select truncate(45.925,2),truncate(45.923,0);
select ceil(25.09);
select floor(25.09);

select employee_id,last_name,department_id from employees where lower(last_name) = 'higgins';

select employee_id,last_name,department_id from employees where upper(last_name) = 'HIGGINS';

select concat('Hello','World');

select substr('HelloWorld',1,5);
select substr('HelloWorld',6,5);
select substr('HelloWorld',6);

select length('HelloWorld');

select instr('HelloWorld','W');
select instr('HelloWorld','z');
select instr('HelloWorld','Wo');
select instr('HelloWorld','Wow');

select lpad(salary,10,'*') from employees;

select rpad(salary,10,'*') from employees;

select replace('JACK and JUE','J','BL');

select  trim(trailing 'M' from 'MADAM');   # checks if last character is 'M' or not ,if yes remove it 
select  trim(trailing 'M' from 'MADAMS');
select  trim(leading 'M' from 'MADAM');    # checks if first character is 'M' or not ,if yes remove it
select  trim(leading 'M' from 'SMADAM');
select trim(both 'M' from 'MADAM');
select trim(both 'M' from 'SMADAM');
select trim('    MADAM ');

#Display employee id, firstname and last name combined, jod_id, length of last name, position of ‘a’ in last name for those job_id contains ‘REP’ and the last name with the character ‘a’.

select employee_id,concat(first_name,' ',last_name) as fullname,job_id,length(last_name) as length,instr(last_name,'a')
from employees 
where job_id like '%REP%' and last_name like '%a%';

# date functions

select last_name,hire_date, datediff(current_date,hire_date) from employees where department_id=90;
select last_name,hire_date, datediff(current_date,hire_date)/7 WEEKS from employees where department_id=90;

select adddate('2020/01/01',interval 1 year);
select adddate('2020/01/01',interval 1 month);
select adddate('2020/01/01',interval 1 week);
select adddate('2020/01/01',interval 1 day);
select adddate('2020/01/01',100);  # days

select subdate('2020/01/01',interval 1 year);
select subdate('2020/01/01',interval 2 month);
select subdate('2020/01/01',interval 3 week);
select subdate('2020/01/01',interval 10 day);

select period_diff(202105,202008);   # YYYYMM

select '2019/01/01',date_format(current_date,'%Y%m%d');  # '%Y' for full year ie 2020 , '%y' for short year ie 20
select '2019/01/01',date_format(current_date,'%y%m%d');


#display hire date, date after 100 days of joining and date before 1 Month of joining for those belong  department id 90

select hire_date, adddate(hire_date,100),subdate(hire_date,interval 1 month)
from employees
where department_id = 90;

# last day of this month

select last_day(current_date);

select concat(2,' test');
select concat(1,'1');


#4. Write a Query to display the date '01-01-2020' in the form of  ' January 01, 2020'.

select date_format('2020/01/01' , '%M %d, %Y');