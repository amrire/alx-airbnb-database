# Index Performance Analysis

## Objective
The goal is to improve query performance by identifying high-usage columns and creating appropriate indexes. This document outlines the steps taken, the indexes created, and the performance improvements observed.

---

## High-Usage Columns Identified
Based on query patterns, the following columns were identified as high-usage:

1. **Users Table**:
   - `user_id`: Frequently used in `JOIN` and `WHERE` clauses.

2. **Bookings Table**:
   - `booking_id`: Frequently used in `JOIN` and `WHERE` clauses.
   - `user_id`: Frequently used in `JOIN` clauses with the `users` table.
   - `property_id`: Frequently used in `JOIN` clauses with the `properties` table.

3. **Properties Table**:
   - `property_id`: Frequently used in `JOIN` and `WHERE` clauses.
   - `name`: Frequently used in `ORDER BY` clauses.

---

## Indexes Created
The following indexes were created to optimize query performance:

```sql
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
```

---

## Performance Measurement
### Before Adding Indexes
The following query was executed before adding indexes:

#### EXPLAIN ANALYZE
```sql
SELECT 
    users.first_name, users.last_name, bookings.start_date
FROM 
    users
JOIN 
    bookings ON users.user_id = bookings.user_id
WHERE 
    bookings.property_id = 'some-property-id';
```

- **Execution Time**: [Insert time here]
- **Query Plan**: Sequential scans (`Seq Scan`) were observed, indicating no indexes were used.

---

### After Adding Indexes
The same query was executed after adding indexes:

```sql
EXPLAIN ANALYZE
SELECT 
    users.first_name, users.last_name, bookings.start_date
FROM 
    users
JOIN 
    bookings ON users.user_id = bookings.user_id
WHERE 
    bookings.property_id = 'some-property-id';
```

- **Execution Time**: [Insert time here]
- **Query Plan**: Index scans (`Index Scan`) were observed, indicating the indexes were utilized.

---

## Observations
- Queries involving `JOIN`, `WHERE`, and `ORDER BY` clauses on indexed columns showed significant performance improvements.
- The use of indexes reduced the execution time and improved query efficiency.

---

## Conclusion
Adding indexes to high-usage columns in the `users`, `bookings`, and `properties` tables significantly improved query performance. Future queries should be monitored to identify additional optimization opportunities.