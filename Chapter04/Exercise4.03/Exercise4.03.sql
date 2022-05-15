SELECT 
  state, COUNT(*)
FROM 
  customers
GROUP BY 
  state
HAVING 
  COUNT(*)>=1000
ORDER BY 
  state;
