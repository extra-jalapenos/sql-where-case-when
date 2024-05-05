SELECT race, sex, education
FROM `bigquery-public-data.ml_datasets.census_adult_income`
WHERE (TRIM(race) = "White" AND TRIM(sex) = "Male" AND education_num = 16)

-- 289 rows
