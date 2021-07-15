SELECT R.province, COUNT(*) as cnt
FROM weather W, region R
WHERE W.code = R.code AND
	W.date LIKE '2016-05-__' AND
	W.avg_relative_humidity >70
GROUP BY R.province
ORDER BY cnt DESC
LIMIT 3;
