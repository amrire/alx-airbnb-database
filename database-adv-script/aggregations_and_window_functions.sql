-- Write a query to find the total number of bookings made by each user, 
-- using the COUNT function and GROUP BY clause.
SELECT first_name, last_name, [role], b.total_bookings
FROM [User] JOIN (
	SELECT user_id, COUNT(*) AS total_bookings
	FROM Booking
	GROUP BY user_id
) b ON [User].user_id = b.user_id

-- Use a window function (ROW_NUMBER, RANK) to rank properties based
-- on the total number of bookings they have received.
SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_by_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_number_by_bookings
FROM Booking
GROUP BY property_id;
