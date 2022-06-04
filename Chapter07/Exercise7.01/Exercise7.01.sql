-- Step 1
SELECT
  TO_CHAR(sales_transaction_date, 'yyyymm') AS month_date,
  COUNT(1) AS number_of_sales 
FROM 
  sales
WHERE 
  EXTRACT(year FROM sales_transaction_date) = 2021 
GROUP BY 
  1
ORDER BY 
  1;

-- Step 2
SELECT
  TO_CHAR(date_added, 'yyyymm') AS month_date,
  COUNT(1) AS number_of_new_customers
FROM 
  customers
WHERE 
  EXTRACT(year FROM date_added) = 2021
GROUP BY 
  1
ORDER BY 
  1;
