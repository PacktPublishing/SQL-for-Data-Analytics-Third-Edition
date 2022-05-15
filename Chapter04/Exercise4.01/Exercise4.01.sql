SELECT 
  MIN(base_msrp), 
  MAX(base_msrp), 
  AVG(base_msrp), 
  STDDEV(base_msrp)
FROM 
  products;
