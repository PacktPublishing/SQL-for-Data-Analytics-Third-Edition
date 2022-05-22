-- Step 2
SELECT 
  customer_id, 
  street_address, 
  date_added::DATE,
  COUNT(
    CASE 
      WHEN street_address IS NOT NULL THEN customer_id 
      ELSE NULL 
    END
  ) OVER (ORDER BY date_added::DATE) 
    as total_customers_filled_street
FROM 
  customers
ORDER BY 
  date_added;

-- Step 3
SELECT 
  date_added,
  1 - 1.0 * COUNT(street_address) / COUNT(*) AS pct_null_address 
FROM
  customers
GROUP BY 1
ORDER BY 1;
