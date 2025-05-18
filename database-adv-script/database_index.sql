-- Create an index on user_id in the users table
CREATE INDEX idx_users_user_id ON users(user_id);

-- Create an index on booking_id in the bookings table
CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

-- Create an index on user_id in the bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create an index on property_id in the bookings table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create an index on property_id in the properties table
CREATE INDEX idx_properties_property_id ON properties(property_id);

-- Create an index on name in the properties table for faster ORDER BY
CREATE INDEX idx_properties_name ON properties(name);