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
    as non_null_street_address,
  COUNT(*) OVER (ORDER BY date_added::DATE) 
    as total_street_address
FROM 
  customers
ORDER BY 
  date_added;


-- Step 3
WITH 
  daily_rolling_count as (
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
        as non_null_street_address,
      COUNT(*) OVER (ORDER BY date_added::DATE) 
        as total_street_address
    FROM 
      customers
  )
SELECT DISTINCT
  date_added,
  non_null_street_address,
  total_street_address,
  1 - 1.0 * non_null_street_address/total_street_address
    AS null_address_percentage 
FROM
  daily_rolling_count
ORDER BY 
  date_added;
