-- Query 1: INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id AS property_id,
    bookings.booking_date AS booking_date
FROM 
    users
INNER JOIN 
    bookings
ON 
    users.id = bookings.user_id;

-- Query 2: LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.content AS review_content
FROM 
    properties
LEFT JOIN 
    reviews
ON 
    properties.id = reviews.property_id;

-- Query 3: FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id AS property_id,
    bookings.booking_date AS booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings
ON 
    users.id = bookings.user_id;
