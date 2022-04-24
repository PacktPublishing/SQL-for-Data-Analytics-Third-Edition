SELECT * 
FROM salespeople 
WHERE dealership_id = 17 
ORDER BY hire_date 
LIMIT 10;

SELECT * 
FROM salespeople 
WHERE hire_date >= '2021-01-01' 
AND termination_date IS NULL 
ORDER BY hire_date DESC; 

SELECT * 
FROM salespeople 
WHERE first_name LIKE 'Nic%' 
AND hire_date >= '2021-01-01' 
AND hire_date <= '2021-12-31'

