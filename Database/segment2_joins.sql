SELECT *
INTO nba_players_college
FROM nba_players as nba
INNER JOIN nba_college_stats as college
on (nba.Player = college.player_name)