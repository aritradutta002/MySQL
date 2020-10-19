/* Prerequisites */
-- Use the bank_inventory table to answer the below questions
# Question 1:
use bank;
# 1) Show Geo_location in capital letters in Bank_Holiday

select upper(geo_location) from bank_inventory;

# Question 2:
# 2) What is the first position of ‘City’ Geo_location in capital letters in the Bank_Inventory table.

select instr(geo_location , 'City') from bank_inventory;

# Question 3:
# 3) In Bank_Inventory, 
-- a) convert Quantity data type from numeric to character 
-- b) Add then, add zeros before the Quantity field.  

alter table bank_inventory modify quantity char(10);

# To answer 4th question there are few prerquisites to be followed
# PRE - REQUISITE:
Insert into bank_Inventory values ( 'MaxGain',    6 , 220.39, 4690.67, 4890 , 'Riverdale-village' ) ;
Insert into bank_Inventory values ( 'SuperSave', 7 , 290.30, NULL, 3200.13 ,'Victoria-Town') ;


# Question 4:
# 4) Replace "_"  with spaces (" ") in geo_location field  of bank_inventory

select replace(geo_location , '-' , ' ') from bank_inventory;


-- Use the Players1And2 table to answer the below questions
use property_price_train_new;
# Question 5:
# Q5. Separate all Player_Id into single ids (example PL1 =  1).

select replace(player_id , 'PL' , '') Player_id from cricket_1
union
select replace(player_id , 'PL' , '') Player_id from cricket_2;

# Question 6:
# Q6. Select Player_Name,charisma, Runs columns and combine column values into a single column, name that column as Details  and separate those values with comma.

select concat(player_name,',',charisma,',',runs) Details from cricket_2;
