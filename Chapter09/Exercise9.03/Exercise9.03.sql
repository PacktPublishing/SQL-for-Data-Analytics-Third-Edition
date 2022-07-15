-- Step 2
SELECT * FROM products;

-- Step 3
SELECT 
  * 
FROM 
  products 
WHERE 
  product_type='scooter';

-- Step 4
SELECT * FROM sales LIMIT 5;

-- Step 5
SELECT 
  products.model, 
  sales.sales_transaction_date 
INTO 
  bat_ltd_sales 
FROM 
  sales 
INNER JOIN 
  products 
ON 
  sales.product_id=products.product_id 
WHERE 
  sales.product_id=8 
ORDER BY 
  sales.sales_transaction_date;

-- Step 6
SELECT * FROM bat_ltd_sales LIMIT 5;

-- Step 7
SELECT COUNT(model) FROM bat_ltd_sales;

-- Step 8
SELECT MAX(sales_transaction_date) FROM bat_ltd_sales;

-- Step 9
ALTER TABLE 
  bat_ltd_sales 
ALTER COLUMN 
  sales_transaction_date TYPE date;

-- Step 10
SELECT 
  * 
FROM 
  bat_ltd_sales 
LIMIT 
  5;

-- Step 11
SELECT 
  sales_transaction_date, 
  count(sales_transaction_date) 
INTO 
  bat_ltd_sales_count 
FROM 
  bat_ltd_sales  
GROUP BY 
  sales_transaction_date 
ORDER BY 
  sales_transaction_date;

-- Step 12
SELECT 
  * 
FROM 
  bat_ltd_sales_count
ORDER BY
  sales_transaction_date;

-- Step 13
SELECT 
  *, 
  sum(count) OVER (ORDER BY sales_transaction_date) 
INTO 
  bat_ltd_sales_growth 
FROM 
  bat_ltd_sales_count;

-- Step 14
SELECT 
  * 
FROM 
  bat_ltd_sales_growth 
ORDER BY
  sales_transaction_date
LIMIT 
  22;

-- Step 15
SELECT 
  * 
FROM 
  bat_sales_growth 
ORDER BY
  sales_date
LIMIT 
  22;

-- Step 16
SELECT 
  *, 
  lag(sum , 7) OVER (ORDER BY sales_transaction_date) 
INTO 
  bat_ltd_sales_delay 
FROM 
  bat_ltd_sales_growth;

-- Step 17
SELECT 
  *, 
  (sum-lag)/lag AS volume 
INTO 
  bat_ltd_sales_vol 
FROM 
  bat_ltd_sales_delay;

-- Step 18
SELECT 
  * 
FROM 
  bat_ltd_sales_vol 
ORDER BY
  Sales_transaction_date
LIMIT 
  22;

