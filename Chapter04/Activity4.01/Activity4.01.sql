-- Question 2
SELECT COUNT(*)
FROM sales;
-- Note that because each sales transaction contains a product_id, there is no NULL value. So COUNT(product_id) will also work.
-- Similarly, COUNT(sales_amount) will also work.

-- Question 3
SELECT c.state, SUM(s.sales_amount)::DECIMAL(12,2)
FROM sales s
JOIN customers c
ON s.customer_id = c.customer_id
GROUP BY c.state
ORDER BY 1;

-- Question 4
-- We use a LIMIT 5 together with a ORDER BY DESC here to generate the top 5 dealership.
-- However, LIMIT 5 will cut off the rest regardless of whether there is a tie between 5th and 6th element.
-- So in real world, you need to check the boundary condition carefully, 
--    i.e., check the value below the limit to make sure there is no tie. 
-- For this question, if we just aim at getting the dealership ID, the following SQL is good enough
-- However, if we would like to have the dealership details, we need to select the information from
--    the dealerships table, with a filter on the dealership IDs from the query below.
SELECT s.dealership_id, COUNT(*)
FROM sales s
WHERE channel <> 'internet'
GROUP BY s.dealership_id
ORDER BY 2 DESC
LIMIT 5;

-- Question 5
SELECT channel,  product_id, AVG(sales_amount)
FROM sales
GROUP BY grouping sets (
  (channel),
  (product_id),
  (channel, product_id)
);

-- Question 6
SELECT 1 - COUNT(dealership_id) * 1.0 / COUNT(*)
FROM sales;

-- Question 7
SELECT 
  TO_CHAR(sales_transaction_date, 'yyyy'), 
  SUM(sales_amount)
FROM sales
WHERE channel = 'internet'
GROUP BY 1
ORDER BY 1;

SELECT 
  TO_CHAR(sales_transaction_date, 'yyyy'), 
  SUM(CASE WHEN channel = 'internet' THEN sales_amount ELSE 0 END) AS internet_sales,
  SUM(CASE WHEN channel <> 'internet' THEN sales_amount ELSE 0 END) AS non_internet_sales
FROM sales
GROUP BY 1 
ORDER BY 1;
