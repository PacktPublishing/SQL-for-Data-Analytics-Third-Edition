(
  SELECT 
    first_name, last_name, 'Customer' as guest_type
  FROM 
    customers
  WHERE 
    city='Los Angeles'
    AND state='CA'
)
UNION
(
  SELECT 
    first_name, last_name, 
    'Employee' as guest_type
  FROM 
    salespeople s
  INNER JOIN 
    dealerships d ON d.dealership_id=s.dealership_id
  WHERE 
    d.city='Los Angeles'
    AND d.state='CA'
);

-- Comparing UNION and UNION ALL
SELECT * FROM products
UNION
SELECT * FROM products
ORDER BY 1;

SELECT * FROM products
UNION ALL
SELECT * FROM products
ORDER BY 1;

