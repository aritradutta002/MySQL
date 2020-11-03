SET autocommit = 0;

#Repeatable Read - Default mode
#SET transaction isolation level REPEATABLE READ;
Start transaction;
select * from student;
Commit;


#READ COMMITTED 
SET transaction isolation level READ COMMITTED;
Start transaction;
select * from student;
Commit;



#READ UNCOMMITTED 
SET transaction isolation level READ UNCOMMITTED;
Start transaction;
select * from student;
Commit;

#serializable
SET transaction isolation level serializable;
Start transaction;
select * from student;

Insert into student 
values(112,'j','xyz','3446483476',23,'m','2020-07-15');
commit;
