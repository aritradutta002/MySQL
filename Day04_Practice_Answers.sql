#Section A

-- 1. Create a table named Customer_info with the below mentioned column
#Cust_name - should be of type character maximum 50 length ,must not accept nulls
#Cust_age - should be of type number type
#Cust_DOB - should be of type date 
use bootcamp;

create table Customer_info(
cust_name varchar(50) not null,
cust_age int,
cust_DOB date
);

-- 2.  Add a rule on age column ,that it should be greater than 17 years.

alter table customer_info add constraint ag check (cust_age>17);

-- 3. Add a column named phone of type number with a default rule of 0

alter table customer_info add column phone integer default 0;

-- 4. Add the column Cust_id of type number as a primary key.

alter table customer_info add column cust_id integer primary key;

-- 5. Rename the column phone to Mobile.

alter table customer_info rename column phone to mobile;

ALTER TABLE Customer_info Change phone Mobile int;

-- 6. Rename table name as Customer_info.

alter table customer_info rename to customer_information;

-- 7. Add a rule of uniqueness to the column mobile.

alter table customer_information add constraint uq unique(mobile);

-- 8.  Insert the values in table Customer_Information for the below mentioned columns only
#Cust_id,Cust_Name,Cust_age
#with these values
#1,'SampleName',34

insert into customer_information(cust_id,Cust_name,cust_age) values (1,'SampleName',34);

-- 9. Write a query to empty table Customer_Information.(Retain the structure)

truncate table customer_information;

#Section B

-- 1. Create a view named v1 with details department_id and total number of employees in each department.
use hr;

create view v1 as 
select department_id, count(employee_id)
from employees
group by department_id;

select * from v1;

-- 2. Create a view named v2 from employees table with details first_name as name and salary.
use hr;

create view v2 as
select first_name 'name', salary
from employees;

select * from v2;

-- 3. Update the view v2 By assigning the name 'Sara' in place of the name 'Valli'.

update v2 set name = 'Sara' where name = 'Valli';

select * from v2;

-- 4. Create a view named v3 with details first_name ,salary and department_id for the departmentId 30. And apply restriction so that no person is able to update it.

create view v3 as 
select first_name, salary, department_id
from employees
where department_id = 30
with check option;

select * from v3;

-- 5. Update the view v3. Assign the salary to be 6000 for those working in department 30.

update v3 set salary = 6000 where department_id = 30;

select * from v3;

#Section C
use bootcamp;
-- 1. Create an unique index on the column Mobile in table Customer_Information.

create unique index i1 on customer_information(mobile); 

-- 2. Display the index information on table Customer_Information.

show indexes from customer_information;

-- 3. Delete the index named idx from customer_information table.

drop index i1 on customer_information;

use hr;
-- 4. Create an index on last_name and first_name together in the  employees table.

create index i1 on employees(first_name,last_name);


#Section D
use orders;
-- 1. Pivot table in mysql for the number of orders delivered by each shipper to customer

with ord as (
select oc.CUSTOMER_ID, s.SHIPPER_ID, oi.ORDER_ID
from online_customer oc
join order_header oh
on oc.CUSTOMER_ID = oh.CUSTOMER_ID
join order_items oi
on oh.ORDER_ID = oi.ORDER_ID
join shipper s
on oh.SHIPPER_ID = s.SHIPPER_ID)
SELECT
  CUSTOMER_ID,
  COUNT(IF(SHIPPER_ID = 50001, ORDER_ID, NULL)) as shipper50001,
  COUNT(IF(SHIPPER_ID = 50002, ORDER_ID, NULL)) as shipper50002,
  COUNT(IF(SHIPPER_ID = 50003, ORDER_ID, NULL)) as shipper50003,
  COUNT(IF(SHIPPER_ID = 50004, ORDER_ID, NULL)) as shipper50004,
  COUNT(IF(SHIPPER_ID = 50005, ORDER_ID, NULL)) as shipper50005,
  COUNT(IF(SHIPPER_ID = 50006, ORDER_ID, NULL)) as shipper50006,
  COUNT(IF(SHIPPER_ID = 50007, ORDER_ID, NULL)) as shipper50007
FROM
  ord
GROUP BY
  CUSTOMER_ID;

-- 3. 5 year moving average of sales

with mv (year, amt) as (
select year(oh.order_date), sum(oi.PRODUCT_QUANTITY *  p.PRODUCT_PRICE) as total_priceperorder
FROM order_header oh
join order_items oi on oh.ORDER_ID = oi.ORDER_ID
join product p on oi.PRODUCT_ID = p.PRODUCT_ID
group by year(oh.order_date))
select year, amt,
avg(amt) OVER(ORDER BY year ROWS 4 PRECEDING ) as test 
from mv;

-- How many emplyees present in the facility?
SELECT COUNT(*) FROM (SELECT Emp_iD, COUNT(Punch) AS punch_count FROM punch_in_out
GROUP BY Emp_iD) a
WHERE punch_count%2 = 1;









