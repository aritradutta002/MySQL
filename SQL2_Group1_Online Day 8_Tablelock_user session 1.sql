set autocommit=0;

#Levels of locking
/* 1st type of classification
Table level
page level 
row level 
*/

/* 2nd Type - classification - Intention locks
Read lock  / Shared Lock
write lock - Exclusive lock
*/

#Scenario 1
start transaction;
select * from student lock in share mode;
commit;


#Scenario 2
start transaction;
select * from student for update;
commit;


#Scenario 3 
start transaction;
select * from student lock in share mode;
commit;



/********************************************
/

#Views - 

views are virtual tables
*/
Create or replace view view_m
as
Select * from student where gender='m';

select* from view_m;

create view order_bng
as 
select amount,date from orders
where location=bng;
 
 #To drop a view
 drop view view1;

# Types of views:

/*
Simple view - single , where , orderby 
complex views - joins , group by , having 
*/

/*
Static view - static no of columns
Dynamic view -  * - any new column added wld be displayed automatically.
*/

Create or replace view view_m
as
Select * from student where gender='m';


Create or replace view view_f
as 
Select * from student
where gender='f'
With Check option;

/* Probably mysql will not work fine with this with check option. PLease try and check once.*/