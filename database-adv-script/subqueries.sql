-- 1. Find all properties where the average rating is greater than 4.0 (non-correlated subquery)
SELECT 
    property_id,
    name AS property_name,
    location
FROM 
    properties
WHERE 
    property_id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

-- 2. Find users who have made more than 3 bookings (correlated subquery)
SELECT 
    user_id,
    first_name,
    last_name,
    email
FROM 
    users
WHERE 
    (
        SELECT COUNT(*)
        FROM bookings
        WHERE bookings.user_id = users.user_id
    ) > 3;