-- retrieve all bookings and the respective users who made those bookings.
SELECT [user].first_name, Booking.total_price, Booking.status
FROM Booking INNER JOIN [User]
ON Booking.[user_id] = [User].[user_id]
ORDER BY [User].first_name;

-- retrieve all properties and their reviews, including properties that have no reviews.
SELECT Property.name, Property.location, Review.rating, Review.comment, Review.created_at
FROM Property LEFT JOIN Review
ON Property.property_id = Review.property_id
ORDER BY Property.name;

-- retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT [User].first_name, [User].last_name, Booking.total_price, Booking.status
FROM [User] FULL OUTER JOIN Booking
ON Booking.[user_id] = [User].[user_id]
ORDER BY [User].first_name;