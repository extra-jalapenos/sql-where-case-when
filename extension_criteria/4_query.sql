SELECT
	SUM(CASE WHEN TRIM(sex) = 'Male' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN TRIM(sex) = 'Male' THEN 1 ELSE 0 END) AS Male_Doctorates_Percent,
	SUM(CASE WHEN TRIM(sex) = 'Female' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN TRIM(sex) = 'Female' THEN 1 ELSE 0 END) AS Female_Doctorates_Percent,
	CASE
		WHEN SUM(CASE WHEN TRIM(sex) = 'Female' THEN 1 ELSE 0 END) = 0 THEN null
		ELSE
			ROUND((SUM(CASE WHEN TRIM(sex) = 'Male' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) / SUM(CASE WHEN TRIM(sex) = 'Male' THEN 1 ELSE 0 END))/(SUM(CASE WHEN TRIM(sex) = 'Female' AND TRIM(education) = 'Doctorate' THEN 1 ELSE 0 END) / SUM(CASE WHEN TRIM(sex) = 'Female' THEN 1 ELSE 0 END)), 2)
		END
	AS FemMalDocRatio
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
WHERE TRIM(native_country) = "Italy"

-- this makes sense because WHERE is evaluated before SELECT in execution
