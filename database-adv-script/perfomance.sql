-- Write an initial query that retrieves
-- all bookings along with the user details, property details, and payment details

EXPLAIN ANALYZE
SELECT *
FROM Booking
LEFT JOIN [User]
ON Booking.user_id = [User].user_id
LEFT JOIN Property
ON Booking.property_id = Property.property_id
LEFT JOIN Payment
ON Payment.booking_id = Booking.booking_id
WHERE Payment.payment_id IS NOT NULL AND payment_date > '2025-03-10 15:07:26.273'