CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.

select name , platform,
sum(na_sales) over (partition by platform) 'Total Sales in North America'
from video_Games_sales;

# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.

select name , platform, genre, 
sum(na_sales) over (partition by genre) 'Genre_Sales',
sum(global_sales) over (partition by platform) 'Platform_Sales',
sum(global_sales) over () 'Total_Sales'
from video_Games_sales;

# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.

select * , row_number() over (partition by platform order by year_of_release) 'Row_Number'
from video_games_sales;

# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
   
select * , avg(global_sales) over(partition by year_of_release) 'Average Global Sales'
from video_games_sales
order by year_of_release desc;

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 

select * 
from 
(select publisher, name, Critic_Score, 
dense_rank() over (partition by publisher order by Critic_Score desc) as ranks 
from video_games_sales) as t
where ranks<=5;
