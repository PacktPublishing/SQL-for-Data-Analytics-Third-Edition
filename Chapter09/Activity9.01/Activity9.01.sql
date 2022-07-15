-- Step 2
SELECT 
  *, 
  sum(count) OVER (ORDER BY sales_date) 
INTO 
  bat_sales_growth 
FROM 
  bat_sales_daily;

-- Step 3
SELECT 
  *, 
  lag(sum, 7) OVER (ORDER BY sales_date) 
INTO 
  bat_sales_daily_delay 
FROM 
  bat_sales_growth;

-- Step 4
SELECT 
  * 
FROM 
  bat_sales_daily_delay 
ORDER BY 
  Sales_date
LIMIT 
  15;

-- Step 5
SELECT 
  *, 
  (sum-lag)/lag AS volume 
INTO 
  bat_sales_delay_vol 
FROM 
  bat_sales_daily_delay;

-- Step 6
SELECT 
  * 
FROM 
  bat_sales_delay_vol 
LIMIT 
  22;
	
