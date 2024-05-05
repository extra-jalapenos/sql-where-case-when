SELECT
  *,
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
WHERE (
  TRIM(marital_status) IN ("Married-civ-spouse", "Married-AF-spouse", "Married-spouse-absent")
  AND capital_gain > 0
  AND TRIM(race) = "Amer-Indian-Eskimo"
  AND TRIM(native_country) = "United-States"
  )

-- I don't know how to reference the new column already in the WHEN statement. Subquery?

-- There are 11 people, though:
-- age	workclass	functional_weight	education	education_num	marital_status	occupation	relationship	race	sex	capital_gain	capital_loss	hours_per_week	native_country	income_bracket	marital_status_short
-- 74	 ?	33114	 10th	6	 Married-civ-spouse	 ?	 Husband	 Amer-Indian-Eskimo	 Male	1797	0	30	 United-States	 <=50K	isMarried
-- 51	 Private	101722	 7th-8th	4	 Married-civ-spouse	 Exec-managerial	 Husband	 Amer-Indian-Eskimo	 Male	3908	0	47	 United-States	 <=50K	isMarried
-- 46	 Self-emp-inc	320124	 HS-grad	9	 Married-civ-spouse	 Exec-managerial	 Wife	 Amer-Indian-Eskimo	 Female	15024	0	40	 United-States	 >50K	isMarried
-- 65	 ?	178931	 HS-grad	9	 Married-civ-spouse	 ?	 Husband	 Amer-Indian-Eskimo	 Male	3818	0	40	 United-States	 <=50K	isMarried
-- 35	 Private	91839	 Bachelors	13	 Married-civ-spouse	 Other-service	 Husband	 Amer-Indian-Eskimo	 Male	7688	0	20	 United-States	 >50K	isMarried
-- 51	 Private	215404	 Bachelors	13	 Married-civ-spouse	 Prof-specialty	 Husband	 Amer-Indian-Eskimo	 Male	15024	0	40	 United-States	 >50K	isMarried
-- 22	 Private	31387	 Bachelors	13	 Married-civ-spouse	 Adm-clerical	 Own-child	 Amer-Indian-Eskimo	 Female	2885	0	25	 United-States	 <=50K	isMarried
-- 41	 Private	113555	 Some-college	10	 Married-civ-spouse	 Craft-repair	 Husband	 Amer-Indian-Eskimo	 Male	7298	0	50	 United-States	 >50K	isMarried
-- 42	 Self-emp-inc	23813	 Some-college	10	 Married-civ-spouse	 Prof-specialty	 Husband	 Amer-Indian-Eskimo	 Male	2885	0	30	 United-States	 <=50K	isMarried
-- 48	 Self-emp-not-inc	243631	 Some-college	10	 Married-civ-spouse	 Craft-repair	 Husband	 Amer-Indian-Eskimo	 Male	7688	0	40	 United-States	 >50K	isMarried
-- 45	 Self-emp-not-inc	239093	 Some-college	10	 Married-civ-spouse	 Exec-managerial	 Husband	 Amer-Indian-Eskimo	 Male	3137	0	40	 United-States	 <=50K	isMarried
