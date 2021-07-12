/* Q11
Is there any correlation between number of wins and team salary? Use data from 2000 
and later to answer this question. As you do this analysis, keep in mind that salaries
across the whole league tend to increase together, so you may want to look on a 
year-by-year basis. */

WITH team_wins_salaries as (SELECT s.teamid, s.yearid::text as year, SUM(s.salary) as team_salary, (t.w) as wins
							FROM salaries AS s LEFT JOIN teams AS t
								ON s.teamid=t.teamid
								AND s.yearid=t.yearid
							WHERE s.yearid >= 2000
							GROUP BY s.teamid, s.yearid, t.w
							ORDER BY s.teamid, s.yearid)
SELECT DISTINCT year, CORR(wins, team_salary) OVER(PARTITION BY year) as correlation
FROM team_wins_salaries
ORDER BY year;
