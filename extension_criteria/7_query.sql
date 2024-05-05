SELECT
	CASE
		WHEN (TRIM(marital_status) = "Married-civ-spouse") THEN "isMarried"
		WHEN (TRIM(marital_status) = "Married-AF-spouse") THEN "isMarried"
		WHEN (TRIM(marital_status) = "Never-married") THEN "NeverMarried"
		WHEN (TRIM(marital_status) = "Divorced") THEN "HasBeenMarried"
		WHEN (TRIM(marital_status) = "Separated") THEN "HasBeenMarried"
		WHEN (TRIM(marital_status) = "Married-spouse-absent") THEN "IsMarried"
		WHEN (TRIM(marital_status) = "Widowed") THEN "HasBeenMarried"
		ELSE "n/a"
	END AS marital_status_short
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
