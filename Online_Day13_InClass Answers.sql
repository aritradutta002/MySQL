CREATE SCHEMA IF NOT EXISTS Day13;
USE Day13;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

create table Airline_Details
(
Flight_ID int not null,
Name varchar(50) not null,
country varchar(20) check (country in ('United Kingdom', 'USA', 'India', 'Canada', 'Singapore')),
primary key (Flight_ID)
);

-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q5. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q6. Only passengers having age greater than 18 are allowed.
-- -- Q7. Assign primary key to Traveller_ID

create table Passengers
(
Traveller_ID int not null,
PNR int not null,
age int check(age>18),
primary key (Traveller_ID)
);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- Questions for table Passengers:  
-- -- Q8. PNR status should be unique and should not be null.
-- -- Q9. Flight Id should not be null.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

alter table Passengers change PNR 
PNR int(10) unique not null;

alter table Airline_Details change Flight_ID
Flight_ID int not null;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 3. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q10. Column Traveller_ID should not contain any null value.
-- -- Q11. Assign primary key to Traveller_ID
-- -- Q12. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.

create table Senior_Citizen_Details
(
Traveller_ID int not null,
primary key (Traveller_ID),
foreign key (Traveller_ID) references Passengers(Traveller_ID) on update cascade on delete restrict
);

