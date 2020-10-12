# Question 1:
# 1) Create a Database Bank

create database Bank;

# Question 2:
# 2) Create a table with the name “Bank_Inventory” with the following columns
-- Product  with string data type and size 10 --
-- Quantity with numerical data type --
-- Price with data type that can handle all real numbers
-- purcahase_cost with data type which always shows two decimal values --
-- estimated_sale_price with data type float --

create table Bank_Inventory
(
Product varchar(10),
Quantity int,
Price float,
purchase_cost float(7,2),
estimated_sale_price float 
);

# Question 3:
# 3) Display all columns and their datatype and size in Bank_Inventory

desc bank_inventory;

# Question 4:
# 4) Insert two records into Bank_Inventory .
-- 1st record with values --
			-- Product : PayCard
			-- Quantity: 2 
			-- price : 300.45 
			-- Puchase_cost : 8000.87
			-- estimated_sale_price: 9000.56 --

-- Product : PayPoints --
			-- Quantity: 4
			-- price : 200.89 
			-- Puchase_cost : 7000.67
			-- estimated_sale_price: 6700.56

insert into bank_inventory values ('PayCard' , 2 , 300.45 , 8000.87 , 9000.56);
insert into bank_inventory values ('PayPoints' , 4 , 200.89 , 7000.67 , 6700.56);

# Question 5:
# 5) Add a column : Geo_Location to the existing Bank_Inventory table with data type varchar and size 20 

alter table bank_inventory add Geo_Location varchar(20);

# Question 6:
# 6) Alter the Product field from CHAR to VARCHAR in Bank_Inventory 

alter table bank_inventory modify Product varchar(10);

# Question 7:
# 7) Reduce the size of the Product field from 10 to 6 and check if it is possible 

alter table bank_inventory modify Product varchar(6);   # it's not possible as we have 'Product' data with size more than 6

# Question 8:
# 8) Bank_inventory table consists of ‘PayCard’ product details .
-- Using ‘PayCard’ product, perform below DML 
-- a) Update the quantity from 2 to 10  
-- b) Update the Geo_Location field from NULL to ‘Delhi-City’ 
 
update bank_inventory set Quantity = 10 , Geo_Location = 'Delhi-City' where product = 'PayCard';
 
 # Question 9:
# 9) Create a table named as Bank_Holidays with below fields 
-- a) Holiday field which displays only date 
-- b) Start_time field which displays hours and minutes 
-- c) End_time field which also displays hours and minutes and timezone 

create table bank_holiday
(
Holiday date,
start_time time,
end_time timestamp
);
                         
 # Question 10:
# 10) Step 1: Insert today’s date details in all fields of Bank_Holidays 
-- Step 2: After step1, perform the below 
-- Postpone Holiday to next day by updating the Holiday field 

insert into Bank_holiday values (current_date(), current_time() , current_timestamp());
update bank_holiday set holiday = current_date() + 1;

# Question 11:
# 11) Update the Start_time with today’s date with time: 12 AM 

update bank_holiday set start_time = current_date();

# Question 12:
# 12) Update the End_time with current european time. 

update bank_holiday set end_time = utc_timestamp() ;

# Question 13:
# 13) Select all columns from Bank_Inventory without mentioning any column name

select * from bank_inventory;
