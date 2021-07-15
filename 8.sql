SELECT L.name, ROUND(up.plays/down.plays, 4) as prob
FROM league L,
(SELECT AA.homeplays+BB.awayplays as plays, AA.league_id 
FROM
	(SELECT COUNT(MA1.home_team_score) as homeplays, MA1.league_id
	FROM match_info MA1, 
		(SELECT H.height, H.id
		FROM 
		(SELECT AVG(P1.height) as height, home.id
		FROM player P1, 
			(SELECT DISTINCT M1.home_player_1 as playerid, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_2, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_3, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_4, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_5, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_6, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_7, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_8, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_9, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_10, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_11, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' ) as home
		WHERE P1.player_api_id = home.playerid
		GROUP BY home.id) as H
		WHERE H.height >180) as Hteam
	WHERE MA1.id = Hteam.id
	GROUP BY MA1.league_id) as AA,
	(SELECT COUNT(MA2.away_team_score) as awayplays, MA2.league_id
	FROM match_info MA2, 
		(SELECT A.height, A.id
		FROM
		(SELECT AVG(P2.height) as height, away.id
		FROM player P2, 
			(SELECT DISTINCT M2.away_player_1 as playerid, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_2, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_3, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_4, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_5, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_6, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_7, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_8, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_9, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_10, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_11, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' ) as away
		WHERE P2.player_api_id = away.playerid
		GROUP BY away.id) as A
		WHERE A.height >180) as Ateam
	WHERE MA2.id = Ateam.id
	GROUP BY MA2.league_id) as BB 
	WHERE AA.league_id = BB.league_id) as down,

(SELECT SAA.homeplays+SBB.awayplays as plays, SAA.league_id 
FROM
	(SELECT COUNT(SMA1.home_team_score) as homeplays, SMA1.league_id
	FROM match_info SMA1, 
		(SELECT H.height, H.id
		FROM 
		(SELECT AVG(P1.height) as height, home.id
		FROM player P1, 
			(SELECT DISTINCT M1.home_player_1 as playerid, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_2, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_3, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_4, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_5, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_6, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_7, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_8, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_9, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016'
			UNION
			SELECT DISTINCT M1.home_player_10, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' 
			UNION
			SELECT DISTINCT M1.home_player_11, M1.id
			FROM match_info M1
			WHERE M1.season = '2015/2016' ) as home
		WHERE P1.player_api_id = home.playerid
		GROUP BY home.id) as H
		WHERE H.height >180) as Hteam
	WHERE SMA1.id = Hteam.id AND
		SMA1.home_team_score > SMA1.away_team_score
	GROUP BY SMA1.league_id) as SAA,

	(SELECT COUNT(SMA2.away_team_score) as awayplays, SMA2.league_id
	FROM match_info SMA2, 
		(SELECT A.height, A.id
		FROM
		(SELECT AVG(P2.height) as height, away.id
		FROM player P2, 
			(SELECT DISTINCT M2.away_player_1 as playerid, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_2, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_3, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_4, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_5, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_6, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_7, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_8, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_9, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016'
			UNION
			SELECT DISTINCT M2.away_player_10, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' 
			UNION
			SELECT DISTINCT M2.away_player_11, M2.id
			FROM match_info M2
			WHERE M2.season = '2015/2016' ) as away
		WHERE P2.player_api_id = away.playerid
		GROUP BY away.id) as A
		WHERE A.height >180) as Ateam
	WHERE SMA2.id = Ateam.id AND
		SMA2.away_team_score > SMA2.home_team_score
	GROUP BY SMA2.league_id) as SBB 
	WHERE SAA.league_id = SBB.league_id) as up
WHERE up.league_id = down.league_id AND
	L.id = up.league_id
ORDER BY L.name ASC;
