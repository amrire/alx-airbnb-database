
EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.status AS booking_status,

  -- User details
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,

  -- Property details
  p.property_id,
  p.name AS property_name,
  p.location,

  -- Payment details
  pay.payment_id,
  pay.amount,
  pay.payment_date,
  pay.payment_method

FROM booking AS b
JOIN "User" AS u ON b.user_id = u.user_id
JOIN property AS p ON b.property_id = p.property_id
LEFT JOIN payment AS pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;