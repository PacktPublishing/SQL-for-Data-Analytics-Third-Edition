-- Step 2
\d sales

-- Step 3
SELECT 
  model, 
  customer_id, 
  sales_transaction_date::DATE as sales_date, 
  sales_amount, 
  channel, 
  dealership_id 
INTO 
  products_sales 
FROM 
  Sales 
INNER JOIN 
  product_names 
ON 
  sales.product_id=product_names.product_id;

-- Step 4
DROP TABLE IF EXISTS products_sales;

-- Step 5
SELECT 
  *
FROM 
  products_sales 
LIMIT 
  5;

-- Step 6
SELECT 
  * 
FROM 
  products_sales 
WHERE 
  model='Bat' 
ORDER BY 
  sales_date;

-- Step 7
SELECT 
  COUNT(model) 
FROM 
  products_sales 
WHERE 
  model='Bat';

-- Step 8
SELECT 
  MAX(sales_date) 
FROM 
  products_sales 
WHERE 
  model='Bat';

-- Step 9
SELECT 
  * 
INTO 
  bat_sales 
FROM 
  products_sales 
WHERE 
  model='Bat' 
ORDER BY 
  sales_date;

-- Step 10
SELECT 
  * 
FROM 
  bat_sales 
ORDER BY 
  sales_date
LIMIT 
  5;

-- Step 11
SELECT 
  sales_date, 
  COUNT(sales_date) 
INTO 
  bat_sales_daily 
FROM 
  bat_sales 
GROUP BY 
  sales_date 
ORDER BY 
  sales_date;

-- Step 12
SELECT 
  * 
FROM 
  bat_sales_daily 
ORDER BY 
  sales_date
LIMIT 
  22;

