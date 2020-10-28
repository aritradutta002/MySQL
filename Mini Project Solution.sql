use ipl;
# 1. Show the percentage of wins of each bidder in the order of highest to lowest percentage.

select bidder_id , bidder_name ,total_points , concat(round((total_points/(select sum(total_points) from ipl_bidder_points))*100,2),'%') 'Winning Percentage' , ibp.Remarks
from ipl_bidder_points ibp join ipl_bidder_details using(bidder_id) 
group by bidder_id order by round((total_points/(select sum(total_points) from ipl_bidder_points))*100,2) desc;

# 2. Display the number of matches conducted at each stadium with stadium name,city from the database.

select stadium_name , city , count(match_id) 'Number of Matches'
from ipl_match_schedule
join ipl_stadium  using (stadium_id)
group by stadium_id;

# 3. In a given stadium, what is the percentage of wins by a team which has won the toss?

select stadium_id , stadium_name , concat(round(sum(if(match_winner=toss_winner,1,0))/count(stadium_id)*100,2),'%') 'Winning Percentage'
from ipl_match
join ipl_match_schedule using(match_id)
join ipl_stadium using (stadium_id)
group by stadium_id
order by stadium_id;


# 4.Show the total bids along with bid team and team name.

select (select count(bidder_id) from ipl_bidding_details) 'Total Bids', bidder_id , bid_team , team_name
from ipl_bidding_details ibd
join ipl_team it on ibd.bid_team = it.team_id;
select * from ipl_bidding_details;

# 5.Show the team id who won the match as per the win details.

select match_id , if(match_winner = 1 , team_id1 , team_id2) 'Team Id' , team_name 'Winning Team' , win_details
from ipl_match im
left join ipl_team on  if(match_winner = 1 , team_id1 , team_id2)= team_id;

# 6.Display total matches played, total matches won and total matches lost by team along with its team name.

select team_name , sum(matches_played) 'Total Matches Played' , sum(matches_won) 'Total Matches Won' , sum(matches_lost) 'Total Matches Lost'
from ipl_team_standings
join ipl_team using (team_id)
group by team_id;

# 7.Display the bowlers for Mumbai Indians team.

select Player_name from
ipl_team_players itp join ipl_player ip on itp.player_id = ip.player_id and player_role = 'Bowler'
join ipl_team it on itp.team_id = it.team_id and team_name = 'Mumbai Indians';

# 8.How many all-rounders are there in each team, Display the teams with more than 4 all-rounder in descending order.

select team_name , count(player_id) 'Number of Allrouders'
from ipl_team_players itp join ipl_team it on itp.team_id = it.team_id and player_role = 'All-Rounder'
group by team_name
having count(player_id) > 4
order by count(player_id) desc;