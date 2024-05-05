SELECT count(education), education
FROM `bigquery-public-data.ml_datasets.census_adult_income`
GROUP BY education
LIMIT 1000
