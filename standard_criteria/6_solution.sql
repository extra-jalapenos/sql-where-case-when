-- Doctorate: Female 80, Male 289
-- General Pop: female 10771, male 21790

SELECT
	sex,
	ROUND(COUNT(CASE WHEN TRIM(education) = 'Doctorate' THEN 1 END) * 100.0 / COUNT(*), 2) AS doctorates_percentage
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
GROUP BY sex;
