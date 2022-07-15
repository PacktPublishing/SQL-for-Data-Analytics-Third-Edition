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
