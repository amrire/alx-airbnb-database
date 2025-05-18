-- 1. Find the total number of bookings made by each user
SELECT
    users.user_id,
    users.first_name,
    users.last_name,
    COUNT(bookings.booking_id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings ON users.user_id = bookings.user_id
GROUP BY
    users.user_id, users.first_name, users.last_name
ORDER BY
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received
SELECT
    properties.property_id,
    properties.name AS property_name,
    COUNT(bookings.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.booking_id) DESC) AS property_rank
FROM
    properties
LEFT JOIN
    bookings ON properties.property_id = bookings.property_id
GROUP BY
    properties.property_id, properties.name
ORDER BY
    property_rank ASC;