-- Is this result significant? Why?
-- Yes it is???
-- let's compare it by country

SELECT
	TRIM(native_country) as country,
	SUM(CASE WHEN TRIM(sex) = 'Male' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN TRIM(sex) = 'Male' THEN 1 ELSE 0 END), 0) AS Male_Doctorates_Percent,
	SUM(CASE WHEN TRIM(sex) = 'Female' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN TRIM(sex) = 'Female' THEN 1 ELSE 0 END), 0) AS Female_Doctorates_Percent,
	ROUND((SUM(CASE WHEN TRIM(sex) = 'Male' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN TRIM(sex) = 'Male' THEN 1 ELSE 0 END), 0)) / NULLIF(SUM(CASE WHEN TRIM(sex) = 'Female' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / NULLIF(SUM(CASE WHEN TRIM(sex) = 'Female' THEN 1 ELSE 0 END), 0), 0), 2) AS Male_To_Female
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
GROUP BY country
ORDER BY Male_To_Female DESC
