# IPL-2008-2016-Analytics
Data of 2008 to 2016 
Sure, here's the schema with a more presentable formatting for seniors:

**1. Ball_by_Ball**

| Column Name             | Data Type | Description                      |
|--------------------------|-----------|----------------------------------|
| `match_id`               | INTEGER   | Unique match identifier          |
| `over_id`                | INTEGER   | Unique over identifier           |
| `ball_id`                | INTEGER   | Unique ball identifier           |
| `innings_no`             | INTEGER   | Innings number in match          |
| `team_batting`           | INTEGER   | Batting team identifier          |
| `team_bowling`           | INTEGER   | Bowling team identifier          |
| `striker_batting_position` | INTEGER   | Striker's batting position       |
| `striker`                | INTEGER   | Striker's player identifier      |
| `non_striker`            | INTEGER   | Non-striker's player identifier  |
| `bowler`                 | INTEGER   | Bowler's player identifier       |

**2. Batsman_Scored**

| Column Name  | Data Type | Description                 |
|--------------|-----------|-----------------------------| 
| `match_id`   | INTEGER   | Unique match identifier     |
| `over_id`    | INTEGER   | Unique over identifier      |
| `ball_id`    | INTEGER   | Unique ball identifier      |
| `runs_scored`| INTEGER   | Runs scored by batsman      |
| `innings_no` | INTEGER   | Innings number in match     |

**3. Batting_Style**

| Column Name | Data Type | Description                     |
|-------------|-----------|----------------------------------|
| `batting_id`| INTEGER   | Unique batting style identifier |
| `batting_hand`| STRING    | Batting hand (e.g., right, left)|

**4. Bowling_Style**

| Column Name  | Data Type | Description                            |
|--------------|-----------|----------------------------------------|
| `bowling_id` | INTEGER   | Unique bowling style identifier        |
| `bowling_skill`| STRING  | Bowling skill (e.g., right-arm fast)   |

**5. City**

| Column Name | Data Type | Description                 |
|-------------|-----------|-----------------------------| 
| `city_id`   | INTEGER   | Unique city identifier      |
| `city_name` | STRING    | Name of the city            |
| `country_id`| INTEGER   | Country identifier for city |

**6. Country**

| Column Name  | Data Type | Description             |
|--------------|-----------|-------------------------|
| `country_id` | INTEGER   | Unique country identifier|
| `country_name`| STRING    | Name of the country      |

**7. Extra_Runs**

| Column Name   | Data Type | Description                 |
|---------------|-----------|-----------------------------| 
| `match_id`    | INTEGER   | Unique match identifier     |
| `over_id`     | INTEGER   | Unique over identifier      |
| `ball_id`     | INTEGER   | Unique ball identifier      |
| `extra_type_id`| INTEGER   | Extra run type identifier   |
| `extra_runs`  | INTEGER   | Number of extra runs        |
| `innings_no`  | INTEGER   | Innings number in match     |

**8. Extra_Type**

| Column Name | Data Type | Description                  |
|-------------|-----------|------------------------------| 
| `extra_id`  | INTEGER   | Unique extra run type identifier|
| `extra_name`| STRING    | Name of extra run type         |

**9. Match**

| Column Name    | Data Type | Description                             |
|----------------|-----------|------------------------------------------|
| `match_id`     | INTEGER   | Unique match identifier                  |
| `team_1`       | INTEGER   | Team 1 identifier                        |
| `team_2`       | INTEGER   | Team 2 identifier                        |
| `match_date`   | DATE      | Date of the match                        |
| `season_id`    | INTEGER   | Season identifier for the match          |
| `venue_id`     | INTEGER   | Venue identifier for the match           |
| `toss_winner`  | INTEGER   | Team that won the toss                   |
| `toss_decide`  | INTEGER   | Toss decision (bat/field) identifier     |
| `win_type`     | INTEGER   | Way the match was won                    |
| `win_margin`   | INTEGER   | Winning margin (runs/wickets)            |
| `outcome_type` | INTEGER   | Match outcome type identifier            |
| `match_winner` | INTEGER   | Winning team identifier                  |
| `man_of_the_match`| INTEGER   | Player awarded man of the match          |

**10. Out_Type**

| Column Name | Data Type | Description                |
|-------------|-----------|----------------------------|
| `out_id`    | INTEGER   | Unique out type identifier |
| `out_name`  | STRING    | Name of the out type       |

**11. Outcome**

| Column Name  | Data Type | Description                    |
|--------------|-----------|--------------------------------|
| `outcome_id` | INTEGER   | Unique outcome type identifier |
| `outcome_type`| STRING    | Description of the outcome type|

**12. Player**

| Column Name   | Data Type | Description                        |
|---------------|-----------|------------------------------------| 
| `player_id`   | INTEGER   | Unique player identifier           |
| `player_name` | STRING    | Name of the player                 |
| `dob`         | DATE      | Date of birth of player            |
| `batting_hand`| INTEGER   | Batting hand identifier            |
| `bowling_skill`| INTEGER   | Bowling skill identifier           |
| `country_name`| INTEGER   | Country identifier for the player  |

**13. Player_Match**

| Column Name | Data Type | Description                     |
|-------------|-----------|----------------------------------|
| `match_id`  | INTEGER   | Unique match identifier          |
| `player_id` | INTEGER   | Unique player identifier         |
| `role_id`   | INTEGER   | Role identifier for the player   |
| `team_id`   | INTEGER   | Team identifier for the player   |

**14. Rolee**

| Column Name | Data Type | Description              |
|-------------|-----------|--------------------------|
| `role_id`   | INTEGER   | Unique role identifier   |
| `role_desc` | STRING    | Description of the role  |

**15. Season**

| Column Name     | Data Type | Description                      |
|-----------------|-----------|----------------------------------|
| `season_id`     | INTEGER   | Unique season identifier         |
| `man_of_the_series`| INTEGER   | Player awarded man of the series |
| `orange_cap`    | INTEGER   | Player awarded orange cap        |
| `purple_cap`    | INTEGER   | Player awarded purple cap        |
| `season_year`   | YEAR      | Year of the season               |

**16. Team**

| Column Name | Data Type | Description             |
|-------------|-----------|-------------------------|
| `team_id`   | INTEGER   | Unique team identifier  |
| `team_name` | STRING    | Name of the team        |

**17. Toss_Decision**

| Column Name | Data Type | Description                  |
|-------------|-----------|------------------------------|
| `toss_id`   | INTEGER   | Unique toss decision identifier|
| `toss_name` | STRING    | Description of toss decision   |

**18. Umpire**

| Column Name     | Data Type | Description                      |
|-----------------|-----------|----------------------------------|
| `umpire_id`     | INTEGER   | Unique umpire identifier         |
| `umpire_name`   | STRING    | Name of the umpire               |
| `umpire_country`| INTEGER   | Country identifier for the umpire|

**19. Venue**

| Column Name | Data Type | Description                  |
|-------------|-----------|------------------------------|
| `venue_id`  | INTEGER   | Unique venue identifier      |
| `venue_name`| STRING    | Name of the venue            |
| `city_id`   | INTEGER   | City identifier for the venue|

**20. Wicket_Taken**

| Column Name  | Data Type | Description                         |
|--------------|-----------|-------------------------------------|
| `match_id`   | INTEGER   | Unique match identifier              |
| `over_i
