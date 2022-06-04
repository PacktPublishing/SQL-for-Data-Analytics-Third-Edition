-- Step 1
CREATE TEMP TABLE customer_points AS (
  SELECT
    customer_id,
point(longitude, latitude) AS lng_lat_point
  FROM 
customers
  WHERE 
longitude IS NOT NULL
  AND 
    latitude IS NOT NULL
);

-- Step 2
CREATE TEMP TABLE dealership_points AS (
  SELECT
    dealership_id,
    point(longitude, latitude) AS lng_lat_point
  FROM 
    dealerships
);

-- Step 3
CREATE TEMP TABLE customer_dealership_distance AS (
  SELECT
    customer_id,
    dealership_id,
    c.lng_lat_point <@> d.lng_lat_point AS distance
  FROM 
    customer_points c
  CROSS JOIN 
    dealership_points d
);

CREATE TEMP TABLE closest_dealerships AS (
  SELECT DISTINCT ON (customer_id)
    customer_id,
    dealership_id,
    distance
  FROM customer_dealership_distance
  ORDER BY customer_id, distance
);

-- Step 4
SELECT
  AVG(distance) AS avg_dist,
  PERCENTILE_DISC(0.5) 
    WITHIN GROUP (ORDER BY distance) AS median_dist
FROM 
  closest_dealerships;
