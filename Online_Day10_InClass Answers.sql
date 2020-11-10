USE Day9;

#Q1. Display the passenger_no and first_name of all the passenger whose name starts with the letter 'A'

select passenger_no , first_name from titanic_ds where first_name in (select first_name from titanic_ds where first_name like 'A%');

#Q2. Display the passenger_no, first_name, last_name and embark_town from the given table where the embark_town should end with 'on'.

select passenger_no , first_name, last_name , embark_town from titanic_ds where embark_town in (select embark_town from titanic_ds where embark_town like '%on');

#Q3. From the given table retrieve the passenger_no, first_name, last_name of the passengers who are alive. (Note : alive = yes ; not_alive = no).

select passenger_no , first_name, last_name from titanic_ds where alive in (select alive from titanic_ds where alive = 'yes');

#Q4. Extract the first_name, last_name and passenger_no of the passengers who were on deck 90.

select passenger_no , first_name, last_name from titanic_ds where deck_number in (select deck_number from titanic_ds where deck_number = 90);

#Q5. Display the sex, age, fare and deck_number of the passenger having name 'Steven King'.

select sex, age , fare , deck_number from titanic_ds where concat(first_name,' ',last_name) in (select concat(first_name,' ',last_name) from titanic_ds where concat(first_name,' ',last_name) like 'Steven King');

#Q6. Display the passengers who belong to the third class.

select * from titanic_ds where class in (select class from titanic_ds where class = 'Third');

# Dataset used: youtube_11.csv

#Q7. Display the video Id and the number of likes of the video that has got maximum likes

select video_id , likes from youtube_11 where likes in (select max(likes) from youtube_11);

#Q8. Write a query to print video_id and channel_title where channel_title ends with 'a' and contains 8 characters.

select video_id , channel_title from youtube_11 where channel_title in (select channel_title from titanic_ds where channel_title like '_______a');