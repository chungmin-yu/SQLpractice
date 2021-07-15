SELECT TT.team_long_name, ROUND(AVG(W.diff),2) as avg_win_score
FROM team TT,
(SELECT MM1.home_team_score-MM1.away_team_score as diff, MM1.home_team_id as five, T.wscore as wscore
FROM match_info MM1,
	(SELECT SUM(S.score)/SUM(S.plays) as wscore, S.team
	FROM
	(SELECT SUM(home.score) as score, SUM(home.plays) as plays, home.team
	FROM 
		(SELECT 2*COUNT(M1.home_team_score) as score, COUNT(M1.home_team_score) as plays, M1.home_team_id as team
		FROM match_info M1
		WHERE M1.home_team_score > M1.away_team_score AND
			M1.season = '2015/2016'
		GROUP BY M1.home_team_id
		UNION ALL
		SELECT COUNT(M3.home_team_score) as score, COUNT(M3.home_team_score) as plays, M3.home_team_id as team
		FROM match_info M3
		WHERE M3.home_team_score = M3.away_team_score AND
			M3.season = '2015/2016'
		GROUP BY M3.home_team_id
		UNION ALL
		SELECT 0*COUNT(M5.home_team_score) as score, COUNT(M5.home_team_score) as plays, M5.home_team_id as team
		FROM match_info M5
		WHERE M5.home_team_score < M5.away_team_score AND
			M5.season = '2015/2016'
		GROUP BY M5.home_team_id) as home
	GROUP BY home.team

	UNION ALL
	SELECT SUM(away.score) as score, SUM(away.plays) as plays, away.team
	FROM 
		(SELECT 2*COUNT(M2.away_team_score) as score, COUNT(M2.away_team_score) as plays, M2.away_team_id as team
		FROM match_info M2
		WHERE M2.away_team_score > M2.home_team_score AND
			M2.season = '2015/2016'
		GROUP BY M2.away_team_id
		UNION ALL
		SELECT COUNT(M4.away_team_score) as score, COUNT(M4.away_team_score) as plays, M4.away_team_id as team
		FROM match_info M4
		WHERE M4.away_team_score = M4.home_team_score AND
			M4.season = '2015/2016'
		GROUP BY M4.away_team_id
		UNION ALL
		SELECT 0*COUNT(M6.away_team_score) as score, COUNT(M6.away_team_score) as plays, M6.away_team_id as team
		FROM match_info M6
		WHERE M6.away_team_score < M6.home_team_score AND
			M6.season = '2015/2016'
		GROUP BY M6.away_team_id) as away
	GROUP BY away.team ) as S
	GROUP BY S.team
	ORDER BY SUM(S.score)/SUM(S.plays) DESC
	LIMIT 5) as T
WHERE MM1.home_team_id = T.team AND
	MM1.season = '2015/2016'
UNION ALL
SELECT MM2.away_team_score-MM2.home_team_score as diff, MM2.away_team_id as five, T.wscore as wscore
FROM match_info MM2,
	(SELECT SUM(S.score)/SUM(S.plays) as wscore, S.team
	FROM
	(SELECT SUM(home.score) as score, SUM(home.plays) as plays, home.team
	FROM 
		(SELECT 2*COUNT(M1.home_team_score) as score, COUNT(M1.home_team_score) as plays, M1.home_team_id as team
		FROM match_info M1
		WHERE M1.home_team_score > M1.away_team_score AND
			M1.season = '2015/2016'
		GROUP BY M1.home_team_id
		UNION ALL
		SELECT COUNT(M3.home_team_score) as score, COUNT(M3.home_team_score) as plays, M3.home_team_id as team
		FROM match_info M3
		WHERE M3.home_team_score = M3.away_team_score AND
			M3.season = '2015/2016'
		GROUP BY M3.home_team_id
		UNION ALL
		SELECT 0*COUNT(M5.home_team_score) as score, COUNT(M5.home_team_score) as plays, M5.home_team_id as team
		FROM match_info M5
		WHERE M5.home_team_score < M5.away_team_score AND
			M5.season = '2015/2016'
		GROUP BY M5.home_team_id) as home
	GROUP BY home.team

	UNION ALL
	SELECT SUM(away.score) as score, SUM(away.plays) as plays, away.team
	FROM 
		(SELECT 2*COUNT(M2.away_team_score) as score, COUNT(M2.away_team_score) as plays, M2.away_team_id as team
		FROM match_info M2
		WHERE M2.away_team_score > M2.home_team_score AND
			M2.season = '2015/2016'
		GROUP BY M2.away_team_id
		UNION ALL
		SELECT COUNT(M4.away_team_score) as score, COUNT(M4.away_team_score) as plays, M4.away_team_id as team
		FROM match_info M4
		WHERE M4.away_team_score = M4.home_team_score AND
			M4.season = '2015/2016'
		GROUP BY M4.away_team_id
		UNION ALL
		SELECT 0*COUNT(M6.away_team_score) as score, COUNT(M6.away_team_score) as plays, M6.away_team_id as team
		FROM match_info M6
		WHERE M6.away_team_score < M6.home_team_score AND
			M6.season = '2015/2016'
		GROUP BY M6.away_team_id) as away
	GROUP BY away.team ) as S
	GROUP BY S.team
	ORDER BY SUM(S.score)/SUM(S.plays) DESC
	LIMIT 5) as T
WHERE MM2.away_team_id = T.team AND
	MM2.season = '2015/2016') as W
WHERE W.five = TT.id
GROUP BY W.five
ORDER BY AVG(W.wscore) DESC;




