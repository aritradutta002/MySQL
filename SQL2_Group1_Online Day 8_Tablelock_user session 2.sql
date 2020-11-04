set autocommit=0;


#Scenario 1
start transaction;
select * from student lock in share mode;
commit;

#Scenario 2
start transaction;
select * from student;

insert into student 
values(114,	'k','xyz','8388889789',24,'f','2020-07-16');
commit;



#Scenario 3
start transaction;
select * from student for update;