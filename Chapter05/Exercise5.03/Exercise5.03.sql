-- Question 2
WITH 
  daily_sales as (
    SELECT 
      sales_transaction_date::DATE,
      SUM(sales_amount) as total_sales
    FROM 
      sales
    GROUP BY
      1
  ),
  sales_stats_30 AS (
    SELECT 
      sales_transaction_date, 
      total_sales,
      MAX(total_sales) OVER (
        ORDER BY sales_transaction_date 
        ROWS BETWEEN 30 PRECEDING and 1 PRECEDING
      ) AS max_sales_30
    FROM 
      daily_sales
    ORDER BY
      1
  )
SELECT 
  sales_transaction_date, 
  total_sales,
  max_sales_30
FROM 
  sales_stats_30
WHERE
  sales_transaction_date>='2019-01-01';

-- Step 3
WITH 
  daily_sales as (
    SELECT 
      sales_transaction_date::DATE,
      SUM(sales_amount) as total_sales
    FROM sales
    GROUP BY 1
  ),
  sales_stats_30 AS (
    SELECT 
      sales_transaction_date, 
      total_sales,
      MAX(total_sales) OVER (
        ORDER BY sales_transaction_date 
        ROWS BETWEEN 30 PRECEDING and 1 PRECEDING
      ) AS max_sales_30
    FROM 
      daily_sales
    ORDER BY 1
  )
SELECT 
  sales_transaction_date, 
  total_sales,
  max_sales_30
FROM 
  sales_stats_30
WHERE
  total_sales > max_sales_30 
AND
  sales_transaction_date>='2019-01-01';

 