Use Property_Price_Train_new;
#Q1.Write An MySQL Query To Print The First Three Characters Of  Exterior1st From Property_Price_Train_new Table.

select substr(exterior1st,1,3) from property_price_train_new;

#Q2. Write MySQl query to print nearest largest integer value of column Garage_Area from Property_Price_Train_new

select ceil(garage_area) from property_price_train_new;

#Q3 .Write a Query to find the number of days elapsed since the beginning of new year.

select datediff(curdate(),'2020/01/01');

#Q4.Write a Query to subtract 6 months from the date 01-01-2020.

select subdate('2020/01/01',interval 6 month);

#Q5.Write a Query to display the string '01-01-2020' as date type.

select convert('2020/01/01',date);

#Q6.Write a Query to identify the day on which new year falls for next year.

select date_format('2021/01/01' , '%a');
select date_format('2021/01/01' , '%W');
select dayofweek('2021/01/01');
select dayname('2021/01/01');

#Q7.Write a Query to divide the number 100 by 3 and print the remainder after division.

select 100%3;
select mod(100,3);

#Q8.Write a Query to divide the number 100 by 3 and print the result upto 2 decimal values.

select round(100/3,2);
