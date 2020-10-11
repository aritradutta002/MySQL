use hr;

#Write a query displays the department id, number of employees of those groups that have more than 2 employees
SELECT department_id, count(*) as no_of_employees
    FROM employees
    GROUP BY department_id
    HAVING count(employee_id) >2;


SELECT department_id, count(*) as no_of_employees
    FROM employees
    GROUP BY department_id
    HAVING department_id IN (30,80,90);
    
#contraints

create table person
(
id int not null,
last_name varchar(50) not null,
first_name varchar(50) not null,
age int
);    
desc person;
insert into person(id,last_name,age) values(101,'Kumar',25);
alter table person modify age int not null;
alter table person modify age int default 50;
insert into person(id,last_name,first_name) values(101,'Kumar','Ajay');
select * from person;
alter table person alter age drop default;   # drop a constraint of a column
