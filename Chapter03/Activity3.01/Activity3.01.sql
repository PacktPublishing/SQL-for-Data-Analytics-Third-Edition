SELECT 
	COALESCE(s.dealership_id, -1) sales_dealership, 
	CASE WHEN sales_amount < base_msrp - 500 THEN 1 ELSE 0 END high_savings,
	c.*, p.*
FROM sales s
LEFT JOIN dealerships d
  ON d.dealership_id = s.dealership_id
JOIN customers c
  ON s.customer_id = c.customer_id
JOIN products p
  ON s.product_id = p.product_id
