/* Q2
Find the name and height of the shortest player in the database. 
How many games did he play in? What is the name of the team for which he played? */
SELECT namefirst, namelast, name, yearid, MIN(height) AS min_height, SUM(appearances.g_all) as total_games 
FROM people
LEFT JOIN appearances
USING(playerid)
LEFT JOIN teams
USING(teamid, yearid)
GROUP BY namefirst, namelast, playerid, appearances.teamid, yearid, name
ORDER BY min_height ASC;