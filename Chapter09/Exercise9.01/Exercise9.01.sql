-- Step 2
SELECT 
  model, base_msrp, production_start_date 
FROM 
  Products 
WHERE 
  product_type='scooter'
ORDER BY 
  base_msrp;

-- Step 3
SELECT 
  model, product_id 
FROM 
  Products 
WHERE 
  product_type='scooter';

-- Step 4
SELECT 
  model, product_id 
INTO 
  product_names 
FROM 
  Products 
WHERE 
  product_type='scooter';

SELECT 
  * 
FROM 
  product_names;
