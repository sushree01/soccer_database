drop database if exists soccer;
create database soccer;
use soccer;
select * from venue;
alter table venue change `ï»¿venue_id` venue_id int;

desc player_mast;
alter table player_mast add column date_f_birth date;
update player_mast set date_f_birth=dt_of_bir;
alter table player_mast drop column dt_of_bir;
alter table player_mast change date_f_birth dt_of_bir date;
select * from player_mast; 

desc goal_details;

desc match_mast;
alter table match_mast add column p_date date;
update match_mast set p_date=trim(play_date);
alter table match_mast drop column play_date;
alter table match_mast change p_date play_date date;
select * from match_mast;
update match_mast set goal_score=trim(goal_score);

#write a SQL query to count the number of venues for EURO cup 2016. Return number of venues.
select count(venue_id) as total_venues from venue;

#write a SQL query to count the number of countries that participated in the 2016-EURO Cup
select count(distinct(team_id)) as total_countries from player_mast;

#write a SQL query to find the number of goals scored within normal play during the EURO cup 2016.
select count(goal_id) as total_goals from goal_details;

#write a SQL query to find the number of matches that ended with a result.
select count(match_no) from match_mast where results='WIN';

#write a SQL query to find the number of matches that ended in draws.
select count(match_no) from match_mast where results='DRAW';

#From the following table, write a SQL query to find out when the Football EURO cup 2016 will begin.
select min(play_date) from match_mast;

#write a SQL query to find the number of self-goals scored during the 2016 European Championship.
select count(goal_id) from goal_details where goal_type='O';

#write a SQL query to count the number of matches ended with a results in-group stage.
select count(match_no) from match_mast where play_stage='G' and results='WIN';

#write a SQL query to find the number of matches that resulted in a penalty shootout.
select count(distinct(match_no)) from penalty_shootout;

# write a SQL query to find number of matches decided by penalties in the Round 16.
select count(match_no) from match_mast where decided_by='P' and play_stage='R';

#write a SQL query to find the number of goals scored in every match within a normal play schedule. 
#Sort the result-set on match number. Return match number, number of goal scored.
select match_no,count(goal_id) as goal_scored from goal_details
group by match_no
order by match_no;

#write a SQL query to find the matches in which no stoppage time was added during the first half of play. 
#Return match no, date of play, and goal scored.
select match_no, play_date, goal_score from match_mast where
stop1_sec=0;

