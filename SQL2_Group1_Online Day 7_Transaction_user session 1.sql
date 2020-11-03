#Transaction processing
/* 
Start transaction
if everything is executed fine -  COMMIT the changes
If something goes wrong then - ROLLBACK the changes done so far.
SAVEPOINT - bookmarks that can be created at different stages of transactions.
*/
SET autocommit = 0;
/*
DDL - create alter drop truncate rename - committed auto commit.
DML - insert update delete - explicitly commit 
*/
select * from student;

Start transaction;

savepoint a1;
Insert into student 
values(101,'b','xyz','8888889999',23,'m','2020-07-15');
savepoint a2;

Insert into student 
values(102,'c','xyz','8888889799',24,'f','2020-07-16');
Insert into student 
values(103,'d','xyz','8888889789',24,'f','2020-07-16');

commit;

# HElps release savpoints before a commit is hit. 
 #Release savepoint a1;


/* Account transfer b/w Aswin and ashish
Account_details - account number, balance
transaction_Details table - 
Transaction id, ref id, account number,tran_date, tran_amt, balance

Create a savepoint - tran_begin  - aswin has 10000rs in account and ashish has 1000.

Step 1: Debit from  Rs 10000 from Aswin's Account

Insert the transaction details in transaction table.

Step 2: Update the balance of Aswin in account table

Update Account_Details set his balance = current_balance-10000

	Step 2a: Send debit message to Aswin
    send sms of debit
    
Step 3 : Credit the Rs 10000 to Ashish

Insert a statment in transaction details table for Ashish's  credit 


Step 4: Update the balance of Ashish's account

update ashish's account set the balance = current balance+10000

	Step 4a: Send credit message to Ashish
    sms to ashish
	Step 5: Send successfull message to both the persons
    sms /email
    
If all statement successfull 
	then commit;
    
else 
	rollback to tran_begin;
*/

select * from student;


Start transaction;
Insert into student 
values(110,'j','xyz','3446583476',23,'m','2020-07-15');
Insert into student 
values(109,'i','xyz','3444583476',23,'m','2020-07-15');

select * from student;

commit;

rollback;

Set transaction isolation level read committed;
start transaction;
select * from student;
commit;