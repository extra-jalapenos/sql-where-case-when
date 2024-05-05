SELECT
  ROUND(AVG(capital_gain), 0) as average_capital_gain,
  sex
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
WHERE (
  TRIM(marital_status) IN ("Married-civ-spouse", "Married-AF-spouse", "Married-spouse-absent")
  AND capital_gain > 0
  AND TRIM(race) = "Amer-Indian-Eskimo"
  AND TRIM(native_country) = "United-States"
  )
GROUP BY sex
