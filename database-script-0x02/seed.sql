-- Insert data into the users table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '1234567890', 'host', NOW()),
    (uuid_generate_v4(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '0987654321', 'guest', NOW());

-- Insert data into the properties table
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 'Cozy Apartment', 'A cozy apartment in the city center.', 'New York, NY', 120.00, NOW(), NOW()),
    (uuid_generate_v4(), (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 'Beach House', 'A beautiful beach house with ocean views.', 'Malibu, CA', 300.00, NOW(), NOW());

-- Insert data into the bookings table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'), 
     (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 
     '2025-06-01', '2025-06-07', 720.00, 'confirmed', NOW()),
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Beach House'), 
     (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 
     '2025-07-01', '2025-07-05', 1200.00, 'pending', NOW());

-- Insert data into the payments table
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    (uuid_generate_v4(), 
     (SELECT booking_id FROM bookings WHERE total_price = 720.00), 
     720.00, NOW(), 'credit_card');

-- Insert data into the reviews table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    (uuid_generate_v4(), 
     (SELECT property_id FROM properties WHERE name = 'Cozy Apartment'), 
     (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 
     5, 'Amazing place! Highly recommend.', NOW());

-- Insert data into the messages table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    (uuid_generate_v4(), 
     (SELECT user_id FROM users WHERE email = 'jane.smith@example.com'), 
     (SELECT user_id FROM users WHERE email = 'john.doe@example.com'), 
     'Hi John, is the apartment available for next weekend?', NOW());