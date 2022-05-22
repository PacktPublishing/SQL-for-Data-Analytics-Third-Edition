
-- Question 2
SELECT 
  sales_transaction_date::date, 
  SUM(sales_amount) sales_amount
FROM 
  sales
WHERE
  sales_transaction_date::date BETWEEN '20210101' AND '20211231'
GROUP BY
  sales_transaction_date::date;


-- Question 3
WITH 
  daily_sales as (
    SELECT 
      sales_transaction_date::date, 
      SUM(sales_amount) sales_amount
    FROM 
      sales
    WHERE
      sales_transaction_date::date BETWEEN '20210101' AND '20211231'
    GROUP BY
      sales_transaction_date::date
  )
SELECT
  sales_transaction_date,
  sales_amount,
  AVG(sales_amount) OVER w AS moving_avg
FROM 
  daily_sales 
WINDOW w AS (
  ORDER BY sales_transaction_date 
  ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING
)
ORDER BY 1;

-- Question 4
WITH 
  daily_sales as (
    SELECT 
      sales_transaction_date::date, 
      SUM(sales_amount) sales_amount
    FROM 
      sales
    WHERE
      sales_transaction_date::date BETWEEN '20210101' AND '20211231'
    GROUP BY
      sales_transaction_date::date
  ),
  moving_avg AS (
    SELECT
      sales_transaction_date,
      sales_amount,
      AVG(sales_amount) OVER w AS moving_avg
    FROM 
      daily_sales 
    WINDOW w AS (
      ORDER BY sales_transaction_date 
      ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING
    )
  )
SELECT
  sales_transaction_date,
  sales_amount,
  moving_avg,
  NTILE(10) OVER (ORDER BY moving_avg DESC) AS decile
FROM 
  moving_avg m
WHERE 
  moving_avg IS NOT NULL
ORDER BY 
  decile;
