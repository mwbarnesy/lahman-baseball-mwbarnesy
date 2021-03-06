/*
    QUESTION ::
        Using the fielding table, group players into three groups based on their position: label players 
		with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and 
		those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these 
		three groups in 2016.

    SOURCES ::
        Fielding table

    DIMENSIONS ::
        po, pos
		
    FACTS ::
       	SUM(PO)

    FILTERS ::
        HAVING yearid = '2016'

    DESCRIPTION ::
        Intially I started with a CASE statement, but I think I was approaching the problem in the wrong order.
		When I decided to focus on SUM of POs, I was then able to tack on the CASE statement and GROUP BY the 
		various postion_groups (Outfield, Infield, and battery).

    ANSWER ::
        29560 - Outfield
		58934 - Infield
		41424 - Battery
*/

SELECT 
	yearid,
	SUM(PO) AS total_putouts,
	CASE
			WHEN pos = '1B' THEN 'Infield' 
			WHEN pos = '2B' THEN 'Infield'
			WHEN pos = 'SS' THEN 'Infield'
			WHEN pos = '3B' THEN 'Infield'
			WHEN pos = 'OF' THEN 'Outfield'
			WHEN pos = 'P' THEN 'Battery'
			WHEN pos = 'C' THEN 'Battery'
		END AS position_groups
FROM fielding
GROUP BY position_groups, yearid
HAVING yearid = '2016'
;
