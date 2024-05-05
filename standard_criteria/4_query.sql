SELECT TRIM(sex) as sex, count(sex) as count
FROM `bigquery-public-data.ml_datasets.census_adult_income`
WHERE (TRIM(race) = "White" AND education_num = 16)
GROUP BY sex

-- Female 80, Male 289
