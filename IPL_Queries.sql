-- Identify the venues from the first season,the number of matches played there and the total number of sixes hit at each venue.

SELECT 
    v.venue_name,
    COUNT(DISTINCT m.match_id) AS Match_Played,
    SUM(CASE WHEN b.runs_scored = 6 THEN 1 ELSE 0 END) AS Total_Sixes
FROM 
    batsman_scored b
INNER JOIN match m 
  ON b.match_id = m.match_id
INNER JOIN venue v 
  ON v.venue_id = m.venue_id
WHERE 
    m.season_id = 1
GROUP BY 
    v.venue_name;


-- How many fours and sixes were scored each season, sorted by season year? 

SELECT 
    s.season_year AS Season_Year,
    SUM(CASE WHEN b.runs_scored = 4 THEN 1 ELSE 0 END) AS Fours,
    SUM(CASE WHEN b.runs_scored = 6 THEN 1 ELSE 0 END) AS Sixes
FROM 
    batsman_scored b
INNER JOIN 
    match m ON b.match_id = m.match_id
INNER JOIN 
    season s ON m.season_id = s.season_id
GROUP BY 
    s.season_year
ORDER BY 
    s.season_year ASC;


-- Which countries dominated the batting charts in the 2016 season?

SELECT 
    c.country_name AS Country,
    s.season_year AS Year, 
    SUM(runs_scored) AS Total_Runs_Scored
FROM 
    ball_by_ball bb
INNER JOIN 
    batsman_scored b
    ON bb.match_id = b.match_id 
    AND bb.innings_no = b.innings_no 
    AND bb.over_id = b.over_id 
    AND bb.ball_id = b.ball_id
INNER JOIN player p 
    ON bb.striker = p.player_id
INNER JOIN match m 
    ON bb.match_id = m.match_id
INNER JOIN season s 
    ON s.season_id = m.season_id
INNER JOIN country c 
    ON p.country_name = c.country_id
WHERE 
    s.season_year = 2016
GROUP BY 
    c.country_name, s.season_year
ORDER BY 
    Total_Runs_Scored DESC;


-- List out the names of the bowlers who have bowled a maiden over in the IPL 2016 tournament.Also, add the count of maiden overs bowled by each bowler.

WITH OverDetails AS (
    SELECT b.match_id, innings_no, over_id, bowler
      FROM ball_by_ball b
           JOIN match m
           ON b.match_id = m.match_id
     WHERE m.season_id = 9 -- Filter matches for year 2016
     GROUP BY b.match_id, innings_no, over_id, bowler
),
RunsScored AS (
    SELECT match_id, innings_no, over_id, 
    COALESCE(SUM(runs_scored), 0) AS total_runs_scored
      FROM batsman_scored
     GROUP BY match_id, innings_no, over_id
),
ExtraRuns AS (
    SELECT match_id, innings_no, over_id, 
    COALESCE(SUM(extra_runs), 0) AS total_extra_runs
      FROM extra_runs
     WHERE extra_type_id IN (2, 4)
     GROUP BY match_id, innings_no, over_id
),
TotalRuns AS (
    SELECT od.match_id, od.innings_no, od.over_id, od.bowler, 
    COALESCE(rs.total_runs_scored, 0) + COALESCE(er.total_extra_runs, 0) AS total_runs_scored
      FROM OverDetails od
           LEFT JOIN RunsScored rs
           ON od.match_id = rs.match_id
                AND od.innings_no = rs.innings_no
                AND od.over_id = rs.over_id
           LEFT JOIN ExtraRuns er
           ON od.match_id = er.match_id
                AND od.innings_no = er.innings_no
                AND od.over_id = er.over_id
)
SELECT od.bowler AS player_id,
       p.player_name,
       COUNT(DISTINCT CONCAT(od.over_id, '-', od.match_id, '-', od.innings_no)) AS total_overs,
       SUM(CASE
             WHEN tr.total_runs_scored = 0 THEN 1 ELSE 0 END) AS overs_with_zero_runs
  FROM OverDetails od
       JOIN TotalRuns tr
       ON od.match_id = tr.match_id
            AND od.innings_no = tr.innings_no
            AND od.over_id = tr.over_id
            AND od.bowler = tr.bowler
       JOIN player p
       ON od.bowler = p.player_id
 GROUP BY od.bowler, p.player_name
HAVING SUM(CASE WHEN tr.total_runs_scored = 0 THEN 1 ELSE 0 END) > 0; -- At least one over with zero runs












