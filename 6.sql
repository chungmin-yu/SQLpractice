SELECT Today.date, ROUND(Today.coronavirus,2) as coronavirus, Today.confirmed as confirmed_accumulate, Today.confirmed-Lastday.confirmed as confirmed_add, Today.deceased as dead_accumulate, Today.deceased-Lastday.deceased as dead_add
FROM (SELECT S1.date, S1.coronavirus, T1.confirmed, T1.deceased
	FROM search_trend S1, time T1,
	(SELECT STDDEV(S2.coronavirus) as dev, AVG(S2.coronavirus) as aver
	FROM search_trend S2
	WHERE S2.date >= '2019-12-25' AND S2.date <='2020-06-29') as C1
	WHERE S1.date=T1.date AND
		S1.coronavirus > C1.aver+2*C1.dev )as Today,
	(SELECT S3.date, T2.confirmed, T2.deceased
	FROM search_trend S3, time T2	
	WHERE S3.date = T2.date AND
	S3.date in
	(SELECT date_add(S4.date,interval -1 day)
	FROM search_trend S4,
	(SELECT STDDEV(S5.coronavirus) as dev, AVG(S5.coronavirus) as aver
	FROM search_trend S5
	WHERE S5.date >= '2019-12-25' AND S5.date <='2020-06-29') as C2
	WHERE S4.coronavirus > C2.aver+2*C2.dev ) )as Lastday
WHERE Today.date = date_add(Lastday.date,interval 1 day);
