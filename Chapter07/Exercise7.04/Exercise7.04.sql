-- Step 1
CREATE TEMP TABLE customer_sales_single_sale_json AS (
  SELECT
    customer_json,
    JSONB_ARRAY_ELEMENTS(customer_json -> 'sales') AS sale_json
  FROM 
    customer_sales 
  LIMIT 
    10
);

-- Step 2
SELECT DISTINCT 
  customer_json 
FROM 
  customer_sales_single_sale_json 
WHERE 
  sale_json ->> 'product_name' = 'Blade';

-- Step 3
SELECT DISTINCT 
  JSONB_PRETTY(customer_json) 
FROM 
  customer_sales_single_sale_json 
WHERE 
  sale_json ->> 'product_name' = 'Blade';

-- Step 4
CREATE TEMP TABLE blade_customer_sales AS (
  SELECT
    jsonb_path_query(
      customer_json,
      '$ ? (@.sales[*].product_name == "Blade")'
    ) AS customer_json
  FROM 
    customer_sales
);

SELECT 
  JSONB_PRETTY(customer_json) 
FROM 
  blade_customer_sales;

-- Step 5
SELECT 
  COUNT(1) 
FROM 
  blade_customer_sales;
