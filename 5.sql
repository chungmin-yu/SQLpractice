SELECT T1.province, T1.date
FROM time_province T1, 
	(SELECT T.province, MAX(T.confirmed) as confirmed
	FROM time_province T
	GROUP BY T.province) as T2
	WHERE T1.province = T2.province AND
		T1.confirmed = T2.confirmed AND
		T1.province IN 
		(SELECT R1.province
		FROM region R1
		WHERE R1.province = R1.city AND 
		R1.elderly_population_ratio > ( SELECT AVG(elderly_population_ratio)	FROM region R2	WHERE R2.province = R2.city) )
ORDER BY T1.date;
