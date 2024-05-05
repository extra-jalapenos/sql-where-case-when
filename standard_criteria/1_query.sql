SELECT age,
  CASE
    WHEN age < 20 THEN "<20"
    WHEN (age >= 20 AND age <= 39) THEN "20-39"
    WHEN (age >= 40 AND age <= 59) THEN "40-59"
    WHEN (age >= 60 AND age <= 79) THEN "60-79"
    WHEN (age >= 80) THEN ">=80"
    ELSE "unknown"
  END as age_bracket,
FROM `bigquery-public-data.ml_datasets.census_adult_income` LIMIT 1000
