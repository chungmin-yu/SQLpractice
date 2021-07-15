SELECT Away.id, Home.home_player_avg_age, Away.away_player_avg_age, Home.home_player_avg_rating, Away.away_player_avg_rating
FROM
(SELECT ROUND(SUM(HH.age)/COUNT(HH.age),2) as home_player_avg_age, ROUND(SUM(HH.rate)/COUNT(HH.rate),2) as home_player_avg_rating, HH.id
FROM
	(SELECT I1.playerid, I1.age, i1.rate, I1.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_1, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_1=PL1.player_api_id
	GROUP BY H1.id) as I1
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_1, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_1=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i1 
	ON I1.playerid=i1.playerid AND
		I1.id = i1.id
UNION ALL
	SELECT I2.playerid, I2.age, i2.rate, I2.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_2, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_2=PL1.player_api_id
	GROUP BY H1.id) as I2
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_2, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_2=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i2
	ON I2.playerid=i2.playerid AND
		I2.id = i2.id
UNION ALL
	SELECT I3.playerid, I3.age, i3.rate, I3.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_3, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_3=PL1.player_api_id
	GROUP BY H1.id) as I3
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_3, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_3=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i3
	ON I3.playerid=i3.playerid AND
		I3.id = i3.id
UNION ALL
	SELECT I4.playerid, I4.age, i4.rate, I4.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_4, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_4=PL1.player_api_id
	GROUP BY H1.id) as I4
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_4, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_4=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i4 
	ON I4.playerid=i4.playerid AND
		I4.id = i4.id
UNION ALL
	SELECT I5.playerid, I5.age, i5.rate, I5.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_5, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_5=PL1.player_api_id
	GROUP BY H1.id) as I5
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_5, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_5=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i5 
	ON I5.playerid=i5.playerid AND
		I5.id = i5.id
UNION ALL
	SELECT I6.playerid, I6.age, i6.rate, I6.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_6, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_6=PL1.player_api_id
	GROUP BY H1.id) as I6
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_6, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_6=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i6 
	ON I6.playerid=i6.playerid AND
		I6.id = i6.id
UNION ALL
	SELECT I7.playerid, I7.age, i7.rate, I7.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_7, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_7=PL1.player_api_id
	GROUP BY H1.id) as I7
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_7, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_7=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i7 
	ON I7.playerid=i7.playerid AND
		I7.id = i7.id
UNION ALL
	SELECT I8.playerid, I8.age, i8.rate, I8.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_8, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_8=PL1.player_api_id
	GROUP BY H1.id) as I8
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_8, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_8=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i8 
	ON I8.playerid=i8.playerid AND
		I8.id = i8.id
UNION ALL
	SELECT I9.playerid, I9.age, i9.rate, I9.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_9, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_9=PL1.player_api_id
	GROUP BY H1.id) as I9
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_9, M1.id
	FROM match_info M1	
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_9=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i9 
	ON I9.playerid=i9.playerid AND
		I9.id = i9.id
UNION ALL	
	SELECT I10.playerid, I10.age, i10.rate, I10.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_10, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_10=PL1.player_api_id
	GROUP BY H1.id) as I10
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_10, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_10=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i10 
	ON I10.playerid=i10.playerid AND
		I10.id = i10.id
UNION ALL
	SELECT I11.playerid, I11.age, i11.rate, I11.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.home_player_11, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.home_player_11=PL1.player_api_id
	GROUP BY H1.id) as I11
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.home_player_11, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.home_player_11=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i11 
	ON I11.playerid=i11.playerid AND
		I11.id = i11.id) as HH
GROUP BY HH.id

UNION

SELECT ROUND(SUM(AA.age)/COUNT(AA.age),2) as home_player_avg_age, ROUND(SUM(AA.rate)/COUNT(AA.rate),2) as home_player_avg_rating, AA.id
FROM
	(SELECT I1.playerid, I1.age, i1.rate, I1.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_1, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_1=PL1.player_api_id
	GROUP BY A1.id) as I1
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_1, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_1=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i1 
	ON I1.playerid=i1.playerid AND
		I1.id = i1.id
UNION ALL
	SELECT I2.playerid, I2.age, i2.rate, I2.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_2, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_2=PL1.player_api_id
	GROUP BY A1.id) as I2
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_2, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_2=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i2 
	ON I2.playerid=i2.playerid AND
		I2.id = i2.id
UNION ALL
	SELECT I3.playerid, I3.age, i3.rate, I3.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_3, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_3=PL1.player_api_id
	GROUP BY A1.id) as I3
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_3, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_3=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i3 
	ON I3.playerid=i3.playerid AND
		I3.id = i3.id
UNION ALL
	SELECT I4.playerid, I4.age, i4.rate, I4.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_4, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_4=PL1.player_api_id
	GROUP BY A1.id) as I4
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_4, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_4=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i4 
	ON I4.playerid=i4.playerid AND
		I4.id = i4.id
UNION ALL
	SELECT I5.playerid, I5.age, i5.rate, I5.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_5, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_5=PL1.player_api_id
	GROUP BY A1.id) as I5
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_5, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_5=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i5 
	ON I5.playerid=i5.playerid AND
		I5.id = i5.id
UNION ALL
	SELECT I6.playerid, I6.age, i6.rate, I6.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_6, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_6=PL1.player_api_id
	GROUP BY A1.id) as I6
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_6, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_6=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i6 
	ON I6.playerid=i6.playerid AND
		I6.id = i6.id
UNION ALL
	SELECT I7.playerid, I7.age, i7.rate, I7.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_7, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_7=PL1.player_api_id
	GROUP BY A1.id) as I7
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_7, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_7=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i7 
	ON I7.playerid=i7.playerid AND
		I7.id = i7.id
UNION ALL
	SELECT I8.playerid, I8.age, i8.rate, I8.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_8, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_8=PL1.player_api_id
	GROUP BY A1.id) as I8
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_8, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_8=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i8 
	ON I8.playerid=i8.playerid AND
		I8.id = i8.id
UNION ALL
	SELECT I9.playerid, I9.age, i9.rate, I9.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_9, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_9=PL1.player_api_id
	GROUP BY A1.id) as I9
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_9, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_9=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i9 
	ON I9.playerid=i9.playerid AND
		I9.id = i9.id
UNION ALL
	SELECT I10.playerid, I10.age, i10.rate, I10.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_10, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_10=PL1.player_api_id
	GROUP BY A1.id) as I10
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_10, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_10=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i10 
	ON I10.playerid=i10.playerid AND
		I10.id = i10.id
UNION ALL
	SELECT I11.playerid, I11.age, i11.rate, I11.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.home_player_11, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.home_player_11=PL1.player_api_id
	GROUP BY A1.id) as I11
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.home_player_11, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.home_player_11=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i11 
	ON I11.playerid=i11.playerid AND
		I11.id = i11.id) as AA
GROUP BY AA.id) as Home,


(SELECT ROUND(SUM(HH.age)/COUNT(HH.age),2) as away_player_avg_age, ROUND(SUM(HH.rate)/COUNT(HH.rate),2) as away_player_avg_rating, HH.id
FROM
	(SELECT I1.playerid, I1.age, i1.rate, I1.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_1, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_1=PL1.player_api_id
	GROUP BY H1.id) as I1
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_1, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_1=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i1 
	ON I1.playerid=i1.playerid AND
		I1.id = i1.id
UNION ALL
	SELECT I2.playerid, I2.age, i2.rate, I2.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_2, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_2=PL1.player_api_id
	GROUP BY H1.id) as I2
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_2, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_2=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date > PL2.date
	GROUP BY H1.id) as i2
	ON I2.playerid=i2.playerid AND
		I2.id = i2.id
UNION ALL
	SELECT I3.playerid, I3.age, i3.rate, I3.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_3, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_3=PL1.player_api_id
	GROUP BY H1.id) as I3
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_3, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_3=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i3
	ON I3.playerid=i3.playerid AND
		I3.id = i3.id
UNION ALL
	SELECT I4.playerid, I4.age, i4.rate, I4.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_4, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_4=PL1.player_api_id
	GROUP BY H1.id) as I4
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_4, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_4=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i4 
	ON I4.playerid=i4.playerid AND
		I4.id = i4.id
UNION ALL
	SELECT I5.playerid, I5.age, i5.rate, I5.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_5, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_5=PL1.player_api_id
	GROUP BY H1.id) as I5
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_5, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_5=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i5 
	ON I5.playerid=i5.playerid AND
		I5.id = i5.id
UNION ALL
	SELECT I6.playerid, I6.age, i6.rate, I6.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_6, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_6=PL1.player_api_id
	GROUP BY H1.id) as I6
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_6, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_6=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i6 
	ON I6.playerid=i6.playerid AND
		I6.id = i6.id
UNION ALL
	SELECT I7.playerid, I7.age, i7.rate, I7.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_7, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_7=PL1.player_api_id
	GROUP BY H1.id) as I7
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_7, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_7=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i7 
	ON I7.playerid=i7.playerid AND
		I7.id = i7.id
UNION ALL
	SELECT I8.playerid, I8.age, i8.rate, I8.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_8, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_8=PL1.player_api_id
	GROUP BY H1.id) as I8
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_8, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_8=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i8 
	ON I8.playerid=i8.playerid AND
		I8.id = i8.id
UNION ALL
	SELECT I9.playerid, I9.age, i9.rate, I9.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_9, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_9=PL1.player_api_id
	GROUP BY H1.id) as I9
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_9, M1.id
	FROM match_info M1	
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_9=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i9 
	ON I9.playerid=i9.playerid AND
		I9.id = i9.id
UNION ALL	
	SELECT I10.playerid, I10.age, i10.rate, I10.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_10, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_10=PL1.player_api_id
	GROUP BY H1.id) as I10
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_10, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_10=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i10 
	ON I10.playerid=i10.playerid AND
		I10.id = i10.id
UNION ALL
	SELECT I11.playerid, I11.age, i11.rate, I11.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, H1.date)) as age, AVG(PL1.player_api_id) as playerid, H1.id
	FROM
	(SELECT M1.date, M1.away_player_11, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE H1.away_player_11=PL1.player_api_id
	GROUP BY H1.id) as I11
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, H1.id as id
	FROM
	(SELECT M1.date, M1.away_player_11, M1.id
	FROM match_info M1
	WHERE M1.home_team_score-M1.away_team_score >=5 AND
		((M1.B365H > M1.B365A AND M1.B365H > M1.B365D) OR 
		(M1.WHH > M1.WHA AND M1.WHH > M1.WHD) OR
		(M1.SJH > M1.SJA AND M1.SJH > M1.SJD) )) as H1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE H1.away_player_11=PL2.player_api_id
	AND H1.date < date_add(PL2.date, interval 6 MONTH)
	AND H1.date >= PL2.date
	GROUP BY H1.id) as i11 
	ON I11.playerid=i11.playerid AND
		I11.id = i11.id) as HH
GROUP BY HH.id

UNION

SELECT ROUND(SUM(AA.age)/COUNT(AA.age),2) as away_player_avg_age, ROUND(SUM(AA.rate)/COUNT(AA.rate),2) as away_player_avg_rating, AA.id
FROM
	(SELECT I1.playerid, I1.age, i1.rate, I1.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_1, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_1=PL1.player_api_id
	GROUP BY A1.id) as I1
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_1, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_1=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i1 
	ON I1.playerid=i1.playerid AND
		I1.id = i1.id
UNION ALL
	SELECT I2.playerid, I2.age, i2.rate, I2.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_2, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_2=PL1.player_api_id
	GROUP BY A1.id) as I2
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_2, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_2=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i2 
	ON I2.playerid=i2.playerid AND
		I2.id = i2.id
UNION ALL
	SELECT I3.playerid, I3.age, i3.rate, I3.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_3, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_3=PL1.player_api_id
	GROUP BY A1.id) as I3
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_3, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_3=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i3 
	ON I3.playerid=i3.playerid AND
		I3.id = i3.id
UNION ALL
	SELECT I4.playerid, I4.age, i4.rate, I4.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_4, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_4=PL1.player_api_id
	GROUP BY A1.id) as I4
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_4, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_4=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i4 
	ON I4.playerid=i4.playerid AND
		I4.id = i4.id
UNION ALL
	SELECT I5.playerid, I5.age, i5.rate, I5.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_5, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_5=PL1.player_api_id
	GROUP BY A1.id) as I5
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_5, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_5=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i5 
	ON I5.playerid=i5.playerid AND
		I5.id = i5.id
UNION ALL
	SELECT I6.playerid, I6.age, i6.rate, I6.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_6, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_6=PL1.player_api_id
	GROUP BY A1.id) as I6
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_6, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_6=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i6 
	ON I6.playerid=i6.playerid AND
		I6.id = i6.id
UNION ALL
	SELECT I7.playerid, I7.age, i7.rate, I7.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_7, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_7=PL1.player_api_id
	GROUP BY A1.id) as I7
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_7, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_7=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i7 
	ON I7.playerid=i7.playerid AND
		I7.id = i7.id
UNION ALL
	SELECT I8.playerid, I8.age, i8.rate, I8.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_8, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_8=PL1.player_api_id
	GROUP BY A1.id) as I8
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_8, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_8=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i8 
	ON I8.playerid=i8.playerid AND
		I8.id = i8.id
UNION ALL
	SELECT I9.playerid, I9.age, i9.rate, I9.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_9, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_9=PL1.player_api_id
	GROUP BY A1.id) as I9
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_9, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_9=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date > PL2.date
	GROUP BY A1.id) as i9 
	ON I9.playerid=i9.playerid AND
		I9.id = i9.id
UNION ALL
	SELECT I10.playerid, I10.age, i10.rate, I10.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_10, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_10=PL1.player_api_id
	GROUP BY A1.id) as I10
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_10, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_10=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i10 
	ON I10.playerid=i10.playerid AND
		I10.id = i10.id
UNION ALL
	SELECT I11.playerid, I11.age, i11.rate, I11.id
	FROM
	(SELECT AVG(TIMESTAMPDIFF(YEAR, PL1.birthday, A1.date)) as age, AVG(PL1.player_api_id) as playerid, A1.id
	FROM
	(SELECT M2.date, M2.away_player_11, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P2.player_api_id, P2.birthday
	FROM player P2) as PL1
	WHERE A1.away_player_11=PL1.player_api_id
	GROUP BY A1.id) as I11
	LEFT OUTER JOIN
	(SELECT AVG(PL2.player_api_id) as playerid, AVG(PL2.overall_rating) as rate, A1.id as id
	FROM
	(SELECT M2.date, M2.away_player_11, M2.id
	FROM match_info M2
	WHERE M2.away_team_score-M2.home_team_score >=5 AND
		((M2.B365A > M2.B365H AND M2.B365A > M2.B365D) OR 
		(M2.WHA > M2.WHH AND M2.WHA > M2.WHD) OR
		(M2.SJA > M2.SJH AND M2.SJA > M2.SJD) )) as A1,
	(SELECT P1.player_api_id, P1.date, P1.overall_rating
	FROM player_attributes P1) as PL2
	WHERE A1.away_player_11=PL2.player_api_id
	AND A1.date < date_add(PL2.date, interval 6 MONTH)
	AND A1.date >= PL2.date
	GROUP BY A1.id) as i11 
	ON I11.playerid=i11.playerid AND
		I11.id = i11.id) as AA
GROUP BY AA.id) as Away
WHERE Home.id=Away.id
ORDER BY Away.id;


