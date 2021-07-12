/* Q8
Using the attendance figures from the homegames table, 
find the teams and parks which had the top 5 average attendance per game in 2016 
(where average attendance is defined as total attendance divided by number of games). 
Only consider parks where there were at least 10 games played. 
Report the park name, team name, and average attendance. 
Repeat for the lowest 5 average attendance. */
--TOP 5 HIGHEST ATTENDANCE FOR 2016
WITH top_5_attendance AS (SELECT team,
								SUM(hg.attendance) AS attend_2016,
								SUM(hg.games) AS games,
								ROUND((SUM(hg.attendance)/sum(hg.games)), 2) AS avg_attend
								FROM homegames AS hg 
								WHERE hg.year = 2016
								GROUP BY team
						  			HAVING SUM(hg.games) >= 10
								ORDER BY avg_attend DESC
								LIMIT 5)
								
SELECT DISTINCT(teams.name),
		teams.park,
		top.avg_attend
FROM top_5_attendance AS top INNER JOIN teams
ON teams.teamid = top.team
WHERE teams.yearid = 2016
ORDER BY top.avg_attend DESC;

--LOWEST 5 ATTENDANCE
WITH bottom_5_attendance AS (SELECT team,
								SUM(hg.attendance) AS attend_2016,
								SUM(hg.games) AS games,
								ROUND((SUM(hg.attendance)/sum(hg.games)), 2) AS avg_attend
								FROM homegames AS hg 
								WHERE hg.year = 2016
								GROUP BY team
						  			HAVING SUM(hg.games) >= 10
								ORDER BY avg_attend
								LIMIT 5)
								
SELECT DISTINCT(teams.name),
		teams.park,
		bot.avg_attend
FROM bottom_5_attendance AS bot INNER JOIN teams
ON teams.teamid = bot.team
WHERE teams.yearid = 2016
ORDER BY bot.avg_attend;