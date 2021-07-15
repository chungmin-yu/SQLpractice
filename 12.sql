SELECT COUNT(M1.id) as homewin
FROM match_info M1
WHERE home_team_score> away_team_score
AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) );

SELECT COUNT(M1.id) as awaywin
FROM match_info M1
WHERE home_team_score< away_team_score
AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) );

SELECT COUNT(M1.id) as tie
FROM match_info M1
WHERE home_team_score = away_team_score
AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) );

SELECT Home.home_overall_rating, Away.away_overall_rating, Home.home_score, Home.away_score, Home.id
FROM 
(SELECT AVG(HH.overall_rating) as home_overall_rating, HH.id, MAX(HH.home_score) as home_score, MAX(HH.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as HH
GROUP BY HH.id) as Home,

(SELECT AVG(AA.overall_rating)as away_overall_rating, AA.id, MAX(AA.home_score) as home_score, MAX(AA.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score>M1.away_team_score
	AND ((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR (M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR (M1.SJH > M1.SJA AND M1.SJH > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as AA
GROUP BY AA.id) as Away
WHERE Home.id = Away.id AND 
	Home.home_overall_rating>Away.away_overall_rating
ORDER BY Home.id;


SELECT Home.home_overall_rating, Away.away_overall_rating, Home.home_score, Home.away_score, Home.id
FROM 
(SELECT AVG(HH.overall_rating) as home_overall_rating, HH.id, MAX(HH.home_score) as home_score, MAX(HH.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as HH
GROUP BY HH.id) as Home,

(SELECT AVG(AA.overall_rating)as away_overall_rating, AA.id, MAX(AA.home_score) as home_score, MAX(AA.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score<M1.away_team_score
	AND ((M1.B365A > M1.B365H AND M1.B365A > M1.B365D) OR (M1.WHA > M1.WHH AND M1.WHA > M1.WHD) OR (M1.SJA > M1.SJH AND M1.SJA > M1.SJD) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as AA
GROUP BY AA.id) as Away
WHERE Home.id = Away.id AND 
	Home.home_overall_rating<Away.away_overall_rating
ORDER BY Home.id;



SELECT Home.home_overall_rating, Away.away_overall_rating, Home.home_score, Home.away_score, Home.id
FROM 
(SELECT AVG(HH.overall_rating) as home_overall_rating, HH.id, MAX(HH.home_score) as home_score, MAX(HH.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.home_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.home_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.home_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as HH
GROUP BY HH.id) as Home,

(SELECT AVG(AA.overall_rating)as away_overall_rating, AA.id, MAX(AA.home_score) as home_score, MAX(AA.away_score) as away_score
FROM (SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_1) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_1, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_1 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_2) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_2, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_2 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_3) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_3, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_3 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_4) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_4, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_4 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_5) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_5, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_5 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_6) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_6, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_6 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_7) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_7, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_7 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_8) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_8, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_8 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_9) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_9, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_9 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_10) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_10, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_10 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id
UNION ALL
	SELECT H1.date, H1.player, P2.overall_rating, H1.d, H1.id, H1.home_score, H1.away_score
	FROM player_attributes P2,
	(SELECT MAX(P.date) as date, MAX(M.away_player_11) as player, MAX(M.date) as d, MAX(M.home_team_score) as home_score, MAX(M.away_team_score) as away_score, M.id
	FROM
	(SELECT M1.away_player_11, M1.home_team_score, M1.away_team_score, M1.date, M1.id
	FROM match_info M1
	WHERE M1.home_team_score=M1.away_team_score
	AND ((M1.B365D > M1.B365H AND M1.B365D > M1.B365A) OR (M1.WHD > M1.WHH AND M1.WHD > M1.WHA) OR (M1.SJD > M1.SJH AND M1.SJD > M1.SJA) ) )as M,
	(SELECT P1.player_api_id, date
	FROM player_attributes P1) as P
	WHERE M.away_player_11 = P.player_api_id AND
		M.date>P.date
	GROUP BY M.id) as H1
	WHERE H1.date = P2.date AND
		H1.player = P2.player_api_id) as AA
GROUP BY AA.id) as Away
WHERE Home.id = Away.id AND 
	Home.home_overall_rating=Away.away_overall_rating
ORDER BY Home.id;


