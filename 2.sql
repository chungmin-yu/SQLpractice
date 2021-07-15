SELECT DISTINCT P.infection_case
FROM patient_info P
WHERE P.age<30 AND
	P.province = 'Seoul' AND
	P.city = 'Gangnam-gu' AND
	P.sex = 'male'
ORDER BY P.infection_case ASC;
