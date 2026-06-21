SET GLOBAL local_infile = 1;
-- 1. Ensure you are working inside the correct database
USE food_delivery;

-- 2. Clear out any previous broken attempts
-- UPDATED: Changed 'zomato' to 'zomato_clean' to match your actual table name
DROP TABLE IF EXISTS zomato_clean;

-- 3. Build the fresh table structure with matching columns

   CREATE TABLE zomato_clean (
    res_id INT,
    name TEXT,
    establishment TEXT,
    city TEXT,
    city_id INT,
    locality TEXT,
    latitude DOUBLE,
    longitude DOUBLE,
    country_id INT,
    locality_verbose TEXT,
    cuisines TEXT,
    timings TEXT,
    average_cost_for_two INT,
    price_range INT,
    currency TEXT,
    highlights TEXT,
    aggregate_rating DOUBLE,
    rating_text TEXT,
    votes INT,
    photo_count INT,
    delivery INT,
    takeaway INT,
    cost_category TEXT,
    popularity TEXT
);

USE food_delivery;

-- 1. Clear out the few rows the wizard managed to struggle through
TRUNCATE TABLE zomato_clean; 

-- 2. Blazing fast direct stream (Takes < 5 seconds)
LOAD DATA LOCAL INFILE 'C:/Users/User/Downloads/zomato_clean.csv'
INTO TABLE zomato_clean
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 3. Check the final result immediately
SELECT * FROM zomato_clean LIMIT 10;
USE food_delivery;

-- 1. Clear out any old versions of the swiggy table
DROP TABLE IF EXISTS swiggy_clean;

-- 2. Create the Swiggy table structure (Optimized with TEXT to prevent mismatches)
CREATE TABLE swiggy_clean (
    res_id INT,
    name TEXT,
    city TEXT,
    rating DOUBLE,
    rating_status TEXT,
    votes INT,
    cost_for_two INT,
    cuisine TEXT,
    lic_no TEXT,
    link TEXT,
    address TEXT,
    locality TEXT
);

-- 3. Blazing fast direct stream for Swiggy data
LOAD DATA LOCAL INFILE 'C:/Users/User/Downloads/swiggy_clean.csv'
INTO TABLE swiggy_clean
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 4. Verify the Swiggy data loaded perfectly
SELECT * FROM swiggy_clean LIMIT 10;
SET GLOBAL local_infile = 1;
USE food_delivery;
WITH LocalityPopularity AS (
    SELECT 
        city,
        locality,
        COUNT(*) AS total_restaurants,
        SUM(votes) AS total_customer_votes,
        DENSE_RANK() OVER (PARTITION BY city ORDER BY SUM(votes) DESC) AS locality_rank
    FROM zomato_clean
    GROUP BY city, locality
)
SELECT city, locality, total_restaurants, total_customer_votes, locality_rank
FROM LocalityPopularity
WHERE locality_rank <= 5;
SELECT 
    cost_category,
    COUNT(*) AS restaurant_count,
    ROUND(AVG(aggregate_rating), 2) AS avg_rating,
    SUM(votes) AS total_votes
FROM zomato_clean
WHERE cost_category IS NOT NULL AND cost_category != ''
GROUP BY cost_category
ORDER BY avg_rating DESC;
WITH HighRatedSpots AS (
    SELECT 
        name,
        city,
        aggregate_rating,
        votes,
        delivery,
        takeaway
    FROM zomato_clean
    WHERE aggregate_rating > 4.0 AND votes > 100
)
SELECT 
    city,
    COUNT(*) AS top_restaurant_count,
    SUM(CASE WHEN delivery = 1 AND takeaway = 1 THEN 1 ELSE 0 END) AS dual_service_count
FROM HighRatedSpots
GROUP BY city
ORDER BY top_restaurant_count DESC;
WITH ZomatoStats AS (
    SELECT DISTINCT name, city, aggregate_rating AS zomato_rating, cost_category
    FROM zomato_clean
),
SwiggyStats AS (
    SELECT DISTINCT name, city, rating AS swiggy_rating, cost_for_two
    FROM swiggy_clean
)
SELECT 
    z.name AS zomato_name,
    s.name AS swiggy_name,
    z.city,
    z.cost_category AS zomato_price_segment,
    s.cost_for_two AS swiggy_cost_for_two,
    z.zomato_rating,
    s.swiggy_rating,
    ROUND((z.zomato_rating - s.swiggy_rating), 2) AS rating_difference
FROM ZomatoStats z
INNER JOIN SwiggyStats s ON z.city = s.city 
    AND z.name LIKE CONCAT('%', s.name, '%') -- Forgiving name match
LIMIT 50;