SELECT email 
FROM customers 
WHERE state='FL' 
ORDER BY email;

SELECT first_name, last_name, email
FROM customers 
WHERE city='New York City' AND state='NY'
ORDER BY last_name, first_name;

SELECT * 
FROM customers 
WHERE phone IS NOT NULL 
ORDER BY date_added;

