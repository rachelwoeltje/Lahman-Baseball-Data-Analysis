/* Q6
Find the player who had the most success stealing bases in 2016, 
where success is measured as the percentage of 
stolen base attempts which are successful. 
(A stolen base attempt results either in a stolen base or being caught stealing.) 
Consider only players who attempted at least 20 stolen bases. */
	SELECT B.PLAYERID,
	PL.NAMEFIRST,
	PL.NAMELAST,
	B.SB::decimal,
	B.CS::decimal,
	ROUND((B.SB::decimal / (B.SB::decimal + B.CS::decimal)),2) AS SB_SUCCESS
FROM BATTING AS B
LEFT JOIN PEOPLE AS PL ON B.PLAYERID = PL.PLAYERID
WHERE B.YEARID = '2016'
	AND B.SB + B.CS >= 20
ORDER BY SB_SUCCESS DESC