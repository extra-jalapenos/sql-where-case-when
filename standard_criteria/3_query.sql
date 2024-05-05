SELECT race, sex, education, count(race) as count
FROM `bigquery-public-data.ml_datasets.census_adult_income`
WHERE (TRIM(race) = "White" AND TRIM(sex) = "Male" AND education_num = 16)
GROUP BY race, sex, education
