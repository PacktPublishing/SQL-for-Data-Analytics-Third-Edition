SELECT 
  customer_id, 
  first_name, 
  last_name, 
  state, 
  date_added::DATE,
  RANK() OVER (
    PARTITION BY state ORDER BY date_added
  ) AS cust_rank
FROM 
  customers
ORDER BY
  state, cust_rank;
