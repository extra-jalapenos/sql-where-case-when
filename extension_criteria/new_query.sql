SELECT
  TRIM(sex) as sex,
  COUNT(*) AS total_population,
  COUNT(CASE WHEN TRIM(education) = 'Doctorate' THEN 1 END) AS doctorates,
  ROUND(COUNT(CASE WHEN TRIM(education) = 'Doctorate' THEN 1 END) * 100.0 / COUNT(*), 2) AS doctorates_percentage
FROM
  `bigquery-public-data.ml_datasets.census_adult_income`
GROUP BY
  sex;
