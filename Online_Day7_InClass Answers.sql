# Pre-Requsites
# Assuming Candidates are familiar with “Group by” and “Grouping functions” because these are used along with JOINS in the questionnaire. 

# Create below DB objects 
Create Database Day7;
use Day7;
CREATE TABLE BANK_CUSTOMER ( customer_id INT ,
             	customer_name VARCHAR(20),
             	Address 	VARCHAR(20),
             	state_code  VARCHAR(3) ,    	 
             	Telephone   VARCHAR(10)	);
INSERT INTO BANK_CUSTOMER VALUES (123001,"Oliver", "225-5, Emeryville", "CA" , "1897614500");
INSERT INTO BANK_CUSTOMER VALUES (123002,"George", "194-6,New brighton","MN" , "1897617000");
INSERT INTO BANK_CUSTOMER VALUES (123003,"Harry", "2909-5,walnut creek","CA" , "1897617866");
INSERT INTO BANK_CUSTOMER VALUES (123004,"Jack", "229-5, Concord",  	"CA" , "1897627999");
INSERT INTO BANK_CUSTOMER VALUES (123005,"Jacob", "325-7, Mission Dist","SFO", "1897637000");
INSERT INTO BANK_CUSTOMER VALUES (123006,"Noah", "275-9, saint-paul" ,  "MN" , "1897613200");
INSERT INTO BANK_CUSTOMER VALUES (123007,"Charlie","125-1,Richfield",   "MN" , "1897617666");
INSERT INTO BANK_CUSTOMER VALUES (123008,"Robin","3005-1,Heathrow", 	"NY" , "1897614000");

CREATE TABLE BANK_CUSTOMER_EXPORT ( customer_id CHAR(10),
customer_name CHAR(20),
Address CHAR(20),
state_code  CHAR(3) ,    	 
Telephone  CHAR(10));
    
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123001 ","Oliver", "225-5, Emeryville", "CA" , "1897614500") ;
INSERT INTO BANK_CUSTOMER_EXPORT VALUES ("123002 ","George", "194-6,New brighton","MN" , "189761700");
CREATE TABLE Bank_Account_Details(Customer_id INT,           	 
                             	Account_Number VARCHAR(19),
                              	Account_type VARCHAR(25),
                           	    Balance_amount INT,
                               	Account_status VARCHAR(10),             	 
                               	Relationship_type varchar(1) ) ;
INSERT INTO Bank_Account_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , 200000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123001, "5000-1700-3456", "RECURRING DEPOSITS" ,9400000 ,"ACTIVE","S");  
INSERT INTO Bank_Account_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS", 400000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" ,750000,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123004, "5000-1700-6091", "RECURRING DEPOSITS" ,7500000 ,"ACTIVE","S");
INSERT INTO Bank_Account_Details  VALUES (123004, "4000-1956-3401",  "SAVINGS" , 655000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123005, "4000-1956-5102",  "SAVINGS" , 300000 ,"ACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, "4000-1956-5698",  "SAVINGS" , 455000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , 355000 ,"ACTIVE" ,"P");
INSERT INTO Bank_Account_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , 7025000,"ACTIVE" ,"S");
INSERT INTO Bank_Account_Details  VALUES (123007, "9000-1700-7777-4321",  "Credit Card"	,0  ,"INACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123007, '5900-1900-9877-5543', "Add-on Credit Card" ,   0   ,"ACTIVE", "S");
INSERT INTO Bank_Account_Details  VALUES (123008, "5000-1700-7755",  "SAVINGS"   	,0   	,"INACTIVE","P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5800-1700-9800-7755', "Credit Card"   ,0   	,"ACTIVE", "P");
INSERT INTO Bank_Account_Details  VALUES (123006, '5890-1970-7706-8912', "Add-on Credit Card"   ,0   	,"ACTIVE", "S");



# CREATE TABLE Bank_Account_Relationship_Details

CREATE TABLE Bank_Account_Relationship_Details
                             	( Customer_id INT,
								Account_Number VARCHAR(19),
                            	Account_type VARCHAR(25),
                             	Linking_Account_Number VARCHAR(19));
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "4000-1956-3456",  "SAVINGS" , "");
INSERT INTO Bank_Account_Relationship_Details  VALUES (123001, "5000-1700-3456",  "RECURRING DEPOSITS" , "4000-1956-3456");  
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "4000-1956-2001",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123002, "5000-1700-5001",  "RECURRING DEPOSITS" , "4000-1956-2001" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123003, "4000-1956-2900",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-6091",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123004, "5000-1700-7791",  "RECURRING DEPOSITS" , "4000-1956-2900" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "5000-1700-9800",  "SAVINGS" , "" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (123007, "4000-1956-9977",  "RECURRING DEPOSITS" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, "9000-1700-7777-4321",  "Credit Card" , "5000-1700-9800" );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5900-1900-9877-5543', 'Add-on Credit Card', '9000-1700-7777-4321' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5800-1700-9800-7755', 'Credit Card', '4000-1956-5698' );
INSERT INTO Bank_Account_Relationship_Details  VALUES (NULL, '5890-1970-7706-8912', 'Add-on Credit Card', '5800-1700-9800-7755' );



# CREATE TABLE BANK_ACCOUNT_TRANSACTION

CREATE TABLE BANK_ACCOUNT_TRANSACTION (  
              	Account_Number VARCHAR(19),
              	Transaction_amount Decimal(18,2) ,
              	Transcation_channel VARCHAR(18) ,
             	Province varchar(3) ,
             	Transaction_Date Date) ;


INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3456",  -2000, "ATM withdrawl" , "CA", "2020-01-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -4000, "POS-Walmart"   , "MN", "2020-02-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -1600, "UPI transfer"  , "MN", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -6000, "Bankers cheque", "CA", "2020-03-23");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  -3000, "Net banking"   , "CA", "2020-04-24");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-2001",  23000, "cheque deposit", "MN", "2020-03-15");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-6091",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5000-1700-7791",  40000, "ECS transfer"  , "NY", "2020-02-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-3401",   8000, "Cash Deposit"  , "NY", "2020-01-19");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5102",  -6500, "ATM withdrawal" , "NY", "2020-03-14");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-5698",  -9000, "Cash Deposit"  , "NY", "2020-03-27");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "4000-1956-9977",  50000, "ECS transfer"  , "NY", "2020-01-16");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -5000, "POS-Walmart", "NY", "2020-02-17");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -8000, "Shopping Cart", "MN", "2020-03-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "9000-1700-7777-4321",  -2500, "Shopping Cart", "MN", "2020-04-21");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( "5800-1700-9800-7755", -9000, "POS-Walmart","MN", "2020-04-13");
INSERT INTO BANK_ACCOUNT_TRANSACTION VALUES ( '5890-1970-7706-8912', -11000, "Shopping Cart" , "NY" , "2020-03-12") ;



# CREATE TABLE BANK_CUSTOMER_MESSAGES

CREATE TABLE BANK_CUSTOMER_MESSAGES (  
              	Event VARCHAR(24),
              	Customer_message VARCHAR(75),
              	Notice_delivery_mode VARCHAR(15)) ;


INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Adhoc", "All Banks are closed due to announcement of National strike", "mobile" ) ;
INSERT INTO BANK_CUSTOMER_MESSAGES VALUES ( "Transaction Limit", "Only limited withdrawals per card are allowed from ATM machines", "mobile" );
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    10000.00     ,'ECS transfer',     'MN' ,    '2020-02-16' ) ;  
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    40000.00     ,'ECS transfer',     'MN' ,    '2020-03-18' ) ;
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    60000.00     ,'ECS transfer',     'MN' ,    '2020-04-18' ) ;
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    20000.00     ,'ECS transfer',     'MN' ,    '2020-03-20' ) ;
INSERT INTO `bank_account_transaction`(`Account_Number`, `Transaction_amount`, `Transcation_channel`, `Province`, `Transaction_Date`) VALUES
('4000-1956-9977' ,    49000.00     ,'ECS transfer',     'MN' ,    '2020-06-18' ) ;




# CREATE TABLE BANK_INTEREST_RATE

CREATE TABLE BANK_INTEREST_RATE(  
            	account_type varchar(24),
              	interest_rate decimal(4,2),
            	month varchar(2),
            	year  varchar(4)
             	)	;

INSERT  INTO BANK_INTEREST_RATE VALUES ( "SAVINGS" , 0.04 , '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES ( "RECURRING DEPOSITS" , 0.07, '02' , '2020' );
INSERT  INTO BANK_INTEREST_RATE VALUES   ( "PRIVILEGED_INTEREST_RATE" , 0.08 , '02' , '2020' );


############################################ Questions ############################################
# Question 1:
# 1) Print customer Id, customer name and average account_balance maintained by each customer for all of his/her accounts in the bank.

select a.customer_id , c.customer_name , avg(a.balance_amount)
from bank_account_details a 
join bank_customer c on a.customer_id = c.customer_id 
group by a.customer_id;

# Question 2:
# 2) Print customer_id , account_number and balance_amount , 
# condition that if balance_amount is nil then assign transaction_amount  for account_type = "Credit Card"

Select customer_id , ba.account_number,
Case when ifnull(balance_amount,0) = 0 then   Transaction_amount else balance_amount end  as balance_amount
from Bank_Account_Details ba  
inner join
bank_account_transaction bat
on ba.account_number = bat.account_number
and account_type = "Credit Card";

# Question 3:
# 3) Print customer_id , account_number and balance_amount , 
# conPrint account number,  balance_amount, transaction_amount from Bank_Account_Details and bank_account_transaction 
# for all the transactions occurred during march,2020 and april, 2020

Select ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba  
inner join bank_account_transaction bat
on ba.account_number = bat.account_number
And ( Transaction_Date between "2020-03-01" and "2020-04-30");


# Question 4:
# 4) Print all of the customer id, account number,  balance_amount, transaction_amount from bank_customer, 
# Bank_Account_Details and bank_account_transaction tables where excluding all of their transactions in march, 2020  month 

Select
ba.Customer_id,
ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details ba  
Left join bank_account_transaction bat
on ba.account_number = bat.account_number
And NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );


# Question 5:
# 5) Print only the customer id, customer name, account_number, balance_amount who did transactions during the first quarter. 
# Do not display the accounts if they have not done any transactions in the first quarter.

Select
ba.Customer_id,
ba.Account_Number, Balance_amount , transaction_amount , transaction_date from
Bank_Account_Details ba  
Inner join bank_account_transaction bat
on ba.account_number = bat.account_number
And ( date_format(Transaction_Date , '%Y-%m') <= "2020-03" );


# Question 6:
# 6) Print account_number, Event adn Customer_message from BANK_CUSTOMER_MESSAGES and Bank_Account_Details to display an “Adhoc" 
# Event for all customers who have  “SAVINGS" account_type account.

select account_number , event , customer_message 
from bank_account_details cross join bank_customer_messages 
on event = 'adhoc' and account_type = 'SAVINGS';

# Question 7:
# 7) Print Customer_id, Account_Number, Account_type, and display deducted balance_amount by  
# subtracting only negative transaction_amounts for Relationship_type = "P" ( P - means  Primary , S - means Secondary ) .

select customer_id , account_number , account_type , balance_amount + transaction_amount Balance
from bank_account_details natural join bank_account_transaction 
where relationship_type = 'P' and transaction_amount like '-%';
select * from bank_account_transaction;

# Question 8:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 

select br1.account_number primary_account , br1.account_type primary_account_type , br2.account_number secondary_account , br2.account_type secondary_account_type
from bank_account_relationship_details br1 
left join bank_account_relationship_details br2 on br1.account_number = br2.linking_account_number;

# Question 9:
# a) Display records of All Accounts , their Account_types, the transaction amount.
# b) Along with first step, Display other columns with corresponding linking account number, account types 
# c) After retrieving all records of accounts and their linked accounts, display the  transaction amount of accounts appeared  in another column.

select br1.account_number primary_account , br1.account_type primari_account_type , br2.account_number secondary_account , br2.account_type secondary_account_type , br3.transaction_amount
from bank_account_relationship_details br2 
right join bank_account_relationship_details br1 on br2.account_number = br1.linking_account_number
left join bank_account_transaction br3 on br1.account_number = br3.account_number;

# Question 10:
# 10) Display all saving account holders have “Add-on Credit Cards" and “Credit cards" 

select a.account_number primary_account, a.account_type primary_account_type , b.account_number secondaty_account , b.account_type secondary_account_type
from bank_account_relationship_details a join bank_account_relationship_details b 
on a.account_number = b.linking_account_number
and b.account_type like '%Credit%';

