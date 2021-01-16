use bootcamp;
-- 1. Add a column named phone of type number with a default rule of 0

alter table customer_info add column phone integer default 0;

-- 2. Rename table name as Customer_info.

alter table customer_info rename to customer_information;

-- 3. Write a query to empty table Customer_Information.

truncate table customer_information;

use hr;
-- 4. Create a view named v2 from employees table with details first_name as name and salary.

create view v2 as
select first_name 'name', salary
from employees;

-- 5. Update the view v3. Assign the salary to be 6000 for those working in department 30.

update v3 set salary = 6000 where department_id = 30;

use bootcamp;
-- 6. Create an index pnx on the column prmo_name in table promotions.

create index pnx on promotions(prmo_name);

-- 7. Display the index information on table promotions.

show indexes from promotions;

-- 8. Delete the index named pnx from promotions table.

drop index pnx on promotions;

-- 9. Create an index on team_id and team_name together in the teams table.

create index i1 on teams(team_id,team_name);

use hr;
-- 10. Write a query to find out one 1st Tire paid employee, one 2nd Tire paid employee, one 3rd Tire paid employee and one 4th Tire paid employee from the entire office.By 1st Tire we mean the Salary should be in the 4th quartile,by 2nd Tire paid we mean the Salary should be in the 3rd quartile, by 3rd Tire paid we mean the Salary should be in the 2nd quartile and by 4th Tire paid we mean the rating should be in the 1st quartile

select * 
from 
(
select *,
row_number() over (partition by quartile order by salary desc) as sal_rank
from 
(select *
from 
(select first_name,salary,ntile(4) over (order by salary desc) as quartile from employees) a
)a2
)a3
where sal_rank=1;
