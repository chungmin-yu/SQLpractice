SELECT COUNT(S.cold) as cnt
FROM search_trend S
WHERE S.cold>0.2
