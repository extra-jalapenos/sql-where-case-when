SELECT native_country, workclass, capital_gain, education_num
FROM
	`bigquery-public-data.ml_datasets.census_adult_income`
WHERE (
	NOT TRIM(native_country) = "United-States"
	AND TRIM(workclass) IN ("Local-gov", "Federal-gov", "State-gov")
	AND capital_gain > 0
	AND education_num < 10
	)

-- there's 2 people
-- native_country	workclass	capital_gain	education_num
-- El-Salvador	 Local-gov	3411	7
-- Puerto-Rico	 Local-gov	7430	7
