SELECT R.province, R.city, R.elementary_school_count as cnt
FROM region R
WHERE R.province <> R.city
ORDER BY elementary_school_count DESC
LIMIT 3;
