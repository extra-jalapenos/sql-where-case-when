SELECT TRIM(sex) as sex, count(sex) as count
FROM `bigquery-public-data.ml_datasets.census_adult_income`
GROUP BY sex

-- female 10771, male 21790
