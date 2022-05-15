SELECT 
  product_type, 
  MIN(base_msrp), 
  MAX(base_msrp), 
  AVG(base_msrp), 
  STDDEV(base_msrp)
FROM 
  products
GROUP BY 
  1
ORDER BY 
  1;
