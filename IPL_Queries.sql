/* Identify the venues from the first season,the number of matches played there and the total number of sixes hit at each venue. */

Select v.venue_name ,
COUNT(DISTINCT m.match_id) as Match_Played,
SUM(CASE WHEN runs_scored = 6 THEN 1 ELSE 0 end ) as Total_Sixes 
FROM batsman_scored b
INNER JOIN match m
ON b.match_id = m.match_id
INNER JOIN venue v 
ON v.venue_id = m.venue_id
WHERE m.season_id = 1
GROUP BY v.venue_name ;


/* How many fours and sixes were scored each season, sorted by season year? */

SELECT s.season_year AS Season_Year,
SUM (CASE WHEN b.runs_scored = 4 THEN 1 ELSE 0 END) AS Fours,
SUM (CASE WHEN b.runs_scored = 6 THEN 1 ELSE 0 END) as Sixes
FROM batsman_scored b
INNER JOIN match m
ON b.match_id = m.match_id
INNER JOIN season s
ON m.season_id = s.season_id
GROUP BY s.season_year
ORDER BY s.season_year ASC ;


/* Which countries dominated the batting charts in the 2016 season? */

SELECT c.country_name AS Country,
s.season_year as Year, 
SUM(runs_scored) as Total_Runs_Scored
FROM ball_by_ball bb
INNER JOIN batsman_scored b
ON bb.match_id = b.match_id AND bb.innings_no = b.innings_no AND bb.over_id = b.over_id AND bb.ball_id = b.ball_id
INNER JOIN player p 
on bb.striker = p.player_id
INNER JOIN match m 
on bb.match_id = m.match_id
INNER JOIN season s 
on s.season_id= m.season_id
INNER JOIN country c 
on p.country_name = c.country_id
WHERE s.season_year = 2016
GROUP BY c.country_name,s.season_year
Order by 3 DESC;