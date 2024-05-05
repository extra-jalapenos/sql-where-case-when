SELECT
  COUNT(CASE WHEN TRIM(sex) = "Male" THEN 1 END) AS TotMales,
  COUNT(CASE WHEN TRIM(sex) = "Female" THEN 1 END) AS TotFemales
FROM
  `bigquery-public-data.ml_datasets.census_adult_income`
