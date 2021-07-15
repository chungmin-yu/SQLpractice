SELECT PP.preferred_foot, ROUND(AVG(PP.long_shots),2) as avg_long_shots 
FROM player_attributes PP,
(SELECT MAX(P.date) as date, P.player_api_id
FROM player_attributes P, 
(SELECT DISTINCT M.home_player_1 as playerid
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_2
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_3
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_4
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_5
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_6
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_7
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_8
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_9
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_10
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.home_player_11
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_1
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_2
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_3
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_4
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_5
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_6
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_7
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_8
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_9
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_10
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id
UNION
SELECT DISTINCT M.away_player_11
FROM match_info M, league L
WHERE M.season = '2015/2016' AND
	L.name = 'Italy Serie A' AND
	M.league_id = L.id) as P2
WHERE P.player_api_id = P2.playerid
GROUP BY P.player_api_id) as PL
WHERE PP.date = PL.date
AND PP.player_api_id=PL.player_api_id
GROUP BY PP.preferred_foot
LIMIT 2;

