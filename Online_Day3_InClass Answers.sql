use Property_Price_Train_new;

# Q1. Write MySQL query to print details of Property_Price_Train_new whose Brick_Veneer_Type ends with e and contains 4 alphabets.

select * from property_price_train_new where brick_veneer_type like '___e';

# Q2. Fetch the 3 highest value of column Brick_Veneer_Area from Property_Price_Train_new table

select brick_veneer_area from property_price_train_new order by brick_veneer_area desc limit 3;

# Q3.Extract total Sale_Price for each year_sold column of Property_Price_Train_new table.

select year_sold , sum(sale_price) "Total_Sales" from property_price_train_new group by year_sold;

# Q4.Count all duplicate values of column Brick_Veneer_Type from tbale Property_Price_Train_new

select count(brick_veneer_type) from property_price_train_new group by  brick_veneer_type having count(brick_veneer_type) > 1;

# Q5. Find all the players from both matches.

select * from cricket_1 union select * from cricket_2;

# Q6.Write MySQL query to extract maximum runs of players get only top two players

select player_name , runs from cricket_1 order by runs desc limit 2;

# Q7.Create the table with following table regions (region_id, region_name) with following details
/*region_id        - int unsigned
region_name - varchar(25)*/

create table regions
(
region_id int unsigned,
region_name varchar(25),
primary key (region_id)
);
#8 Create the table with following schema countries (country_id, country_name_region_id) with following details
/*country_id -   char(2)
country_name - varchar(40)
region_id  - int unsigned (region_id is referencing regions table)*/

create table countries
(
country_id char(2),
country_name varchar(40),
region_id int unsigned,
foreign key (region_id) references regions(region_id)
);
