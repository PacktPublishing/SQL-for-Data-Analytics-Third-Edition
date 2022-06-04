-- Step 1
SELECT * FROM customer_survey limit 5;

-- Step 2
SELECT 
  UNNEST(STRING_TO_ARRAY(feedback, ' ')) AS word, 
  rating 
FROM   
  customer_survey 
LIMIT 
  10;

-- Step 3
SELECT
  (
    TS_LEXIZE(
      'english_stem',
      UNNEST(
        STRING_TO_ARRAY(
          REGEXP_REPLACE(feedback, '[^a-zA-Z]+', ' ', 'g'),
          ' '
        )
      )
    )
  )[1] AS token,
  rating
FROM 
  customer_survey
LIMIT 
  10;


-- Step 4
SELECT
  (
    TS_LEXIZE(
      'english_stem',
      UNNEST(
        STRING_TO_ARRAY(
          REGEXP_REPLACE(feedback, '[^a-zA-Z]+', ' ', 'g'),
          ' '
        )
      )
    )
  )[1] AS token,
  AVG(rating) AS avg_rating
FROM 
  customer_survey
GROUP BY 
  1
HAVING 
  COUNT(1) >= 3
ORDER BY 
  2
;

-- Step 5
SELECT 
  * 
FROM 
  customer_survey 
WHERE 
  feedback ILIKE '%pop%';

