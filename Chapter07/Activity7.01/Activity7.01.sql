-- Step 1
DROP MATERIALIZED VIEW IF EXISTS customer_search;

CREATE MATERIALIZED VIEW customer_search AS ( 
  SELECT
    customer_json -> 'customer_id' AS customer_id, 
    customer_json,
    to_tsvector('english', customer_json) AS search_vector 
  FROM 
    customer_sales
);

-- Step 2
SELECT
  customer_json
FROM
  customer_search
WHERE
  search_vector @@ plainto_tsquery('english', 'Danny Bat');

-- Step 3
SELECT DISTINCT
  p1.model, 
  p2.model
FROM
  products p1
CROSS JOIN 
  products p2
WHERE 
  p1.product_type = 'scooter' 
AND 
  p2.product_type = 'automobile'
AND 
  p1.model NOT ILIKE '%Limited Edition%';

-- Step 4
SELECT DISTINCT
  plainto_tsquery('english', p1.model) 
    && 
    plainto_tsquery('english', p2.model)
FROM
  products p1 
CROSS JOIN  
  products p2 
WHERE 
  p1.product_type = 'scooter' 
AND 
  p2.product_type = 'automobile'
AND 
  p1.model NOT ILIKE '%Limited Edition%';

-- Step 5
SELECT
  sub.query, 
  (
    SELECT 
      COUNT(1)
    FROM 
      customer_search
    WHERE 
      customer_search.search_vector @@ sub.query
  ) 
FROM (
  SELECT DISTINCT
    plainto_tsquery('english', p1.model) 
      && 
      plainto_tsquery('english', p2.model) AS query
  FROM 
    products p1
  CROSS JOIN 
    products p2 
  WHERE 
    p1.product_type = 'scooter'
  AND 
    p2.product_type = 'automobile'
  AND 
    p1.model NOT ILIKE '%Limited Edition%'
) sub
ORDER BY 
  2 DESC;
