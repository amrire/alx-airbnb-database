-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
CREATE INDEX property_index ON Property([location], pricepernight, host_id);
CREATE INDEX user_index ON User(first_name);
CREATE INDEX booking_index ON Booking(property_id, user_id, total_price);
CREATE INDEX review_index ON Review(rating);

EXPLAIN ANALYZE
SELECT *
FROM Booking
JOIN Property ON Booking.property_id = Property.property_id
WHERE Booking.created_at >= '2024-01-01'
ORDER BY Booking.created_at DESC;
