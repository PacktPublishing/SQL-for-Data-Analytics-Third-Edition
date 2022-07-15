
-- Step 2
SELECT 
  sales_transaction_date 
INTO 
  lemon_sales 
FROM 
  sales 
WHERE 
  product_id=3;

-- Step 3
SELECT 
  count(sales_transaction_date) 
FROM 
  lemon_sales;

-- Step 4
SELECT 
  max(sales_transaction_date) 
FROM 
  lemon_sales;

-- Step 5
ALTER TABLE 
  lemon_sales 
ALTER COLUMN 
  sales_transaction_date TYPE DATE;

-- Step 6
SELECT 
  sales_transaction_date,
  COUNT(sales_transaction_date) 
INTO 
  lemon_sales_count 
FROM 
  lemon_sales 
GROUP BY 
  sales_transaction_date 
ORDER BY 
  sales_transaction_date;

-- Step 7
SELECT 
  *, 
  sum(count) OVER (ORDER BY sales_transaction_date) 
INTO 
  lemon_sales_sum 
FROM 
  lemon_sales_count;

-- Step 8
SELECT 
  *, 
  lag(sum, 7) OVER (ORDER BY sales_transaction_date) 
INTO 
  lemon_sales_delay 
FROM 
  lemon_sales_sum;

-- Step 9
SELECT 
  *, 
  (sum-lag)/lag AS volume 
INTO 
  lemon_sales_growth 
FROM 
  lemon_sales_delay;

-- Step 10
SELECT 
  * 
FROM 
  lemon_sales_growth 
ORDER BY 
  Sales_transaction_date
LIMIT 
  22;
