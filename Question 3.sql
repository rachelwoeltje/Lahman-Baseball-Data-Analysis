/* Q3
Find all players in the database who played at Vanderbilt University. 
Create a list showing each player’s first and last names as well 
as the total salary they earned in the major leagues. 
Sort this list in descending order by the total salary earned. 
Which Vanderbilt player earned the most money in the majors? */
SELECT schoolname, namefirst, namelast, SUM(salary) as total_salary
FROM schools
	LEFT JOIN (SELECT DISTINCT playerid, schoolid
			  FROM collegeplaying) AS cp
USING(schoolid)
LEFT JOIN people
USING(playerid)
LEFT JOIN salaries
USING(playerid)
WHERE schoolname = 'Vanderbilt University'
AND salary IS NOT NULL
GROUP BY schoolname, namefirst, namelast
ORDER BY total_salary DESC;