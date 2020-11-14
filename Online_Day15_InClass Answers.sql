Create database Day15;
Use Day15;
#Create Table:
CREATE TABLE BANK_CUSTOMER ( customer_id INT , 
			     customer_name VARCHAR(20), 
			     Address     VARCHAR(20),
			     state_code  VARCHAR(3) ,         
			     Telephone   VARCHAR(10)    );
		    
#Insert records:
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",      "CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow",     "NY" , "1897614000");

# Q.1 Suppose there is no customer_id: 123009 in the bank_customer table,
#One of the first user is trying to update the customer_id details with condition customer_id > 123008 and
# updating telephone as NULL.
#At the same time, if some other user is trying to insert a record with customer_id : 123009 with values ( 123009, 'Ropert' , '99-Bechkingam', 'CA' , 1867888950).
#During the above two transactions occuring at a same time, After first user checks the database , he recieves an additional record entry of 123009 which he doesn't expect.
#How will you restrict the second user entry?

set autocommit = 0;
#session 1:

set transaction isolation level serializable;
start transaction;
update BANK_CUSTOMER set telephone = null where customer_id > 123008;

#session 2:

start transaction;
insert into BANK_CUSTOMER values (123009, 'Ropert' , '99-Bechkingam', 'CA' , 1867888950);


# Q.2 Write a query such that users can perform concurrent DML operations on the same customer_id = 123002 in bank_customer. 
# One user performs an updates House Address for that customer_id with "2999 New brighton" 
# Other user performs an update Telephone number with 189891899

#session 1:

set transaction isolation level read uncommitted;
start transaction;
update BANK_CUSTOMER set address = '2999 New brighton' where customer_id = 123002;
commit;

#session 2:

set transaction isolation level read uncommitted;
start transaction;
update BANK_CUSTOMER set telephone = 189891899 where customer_id = 123002;
commit;

# Q.3 Write a transaction on customer Id = 123001 in table: bank_customer to acquire shared lock . So others can also acquire the 
# shared lock but cannot modify any rows in the bank_customer table

#session 1:

start transaction;
select * from bank_customer where customer_id = 123001 lock in share mode;

#session 2:

select * from bank_customer where customer_id = 123001 for update;

#it'll throw an error

#############################################################################################################################################
CREATE TABLE BANK_ACCOUNT ( Customer_id INT, 		   			  
							Account_Number VARCHAR(19),
							Account_type VARCHAR(25),
							Balance_amount INT ,
                            Account_status VARCHAR(10), 
                            Relationship_type varchar(1) ) ;
INSERT INTO BANK_ACCOUNT  VALUES (123001, "4000-1956-3456",  "SAVINGS"            , 200000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO BANK_ACCOUNT  VALUES (123002, "4000-1956-2001",  "SAVINGS"            , 400000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123003, "4000-1956-2900",  "SAVINGS"            ,750000,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123004, "4000-1956-3401",  "SAVINGS"            , 655000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123005, "4000-1956-5102",  "SAVINGS"            , 300000 ,"ACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123006, "4000-1956-5698",  "SAVINGS"            , 455000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "5000-1700-9800",  "SAVINGS"            , 355000 ,"ACTIVE" ,"P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S"); 
INSERT INTO BANK_ACCOUNT  VALUES (123007, "9000-1700-7777-4321",  "CREDITCARD"    ,0      ,"INACTIVE","P"); 
INSERT INTO BANK_ACCOUNT  VALUES (123008, "5000-1700-7755",  "SAVINGS"            ,NULL   ,"INACTIVE","P"); 

select * from bank_account;
# Q.4 Write a transactional query such that a 3% interest is added in the balance_amount of all account_numbers 
# of a customer Id = 123001 in bank_account table. Make sure that no other users is able to make any update to the table

#session 1:
start transaction;
select * from BANK_ACCOUNT for update;

#as it is a exclusive lock no other users will able to make any update to the table.

# Q.5 Three users are performing DML operations;
# Out of three users, one user increases  balance_amount by 0.03% of customer_id = 123001; in bank_account table.
# Write transactional query such that after the above update users can insert two different balance_amount concurrently for an account : '4000-1956-3401' parallely without any deadlock

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
		START transaction;
		SELECT * from bank_account where account_number = '4000-1956-3401' for UPDATE;
         UPDATE bank_account set balance_amount = balance_amount +  0.03 * balance_amount where customer_id = 123001;
         commit;
#After transaction of session -1 is complete with commit , below two transactions can be done at a time.
#Session-2: ( insert intention lock -1 ) 

         START TRANSACTION;
         INSERT INTO bank_account (account_number, Balance_amount)
         VALUES ( '4000-1956-3401', 7700 ) ;

#Session-3: ( insert intention lock -2 )

         START TRANSACTION;
         INSERT INTO bank_account (account_number, Balance_amount)
         VALUES ( '4000-1956-3401', 7750 ) ;
