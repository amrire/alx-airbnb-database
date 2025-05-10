# Database Schema for Airbnb-Clone Platform

This project defines the database schema for a simplified Airbnb-style booking platform. The schema is implemented using PostgreSQL and designed to support users, properties, bookings, payments, reviews, and messaging between guests and hosts.

---

## 📄 File: `schema.sql`

The `schema.sql` file contains all the SQL `CREATE TABLE` statements necessary to set up the relational database. It includes data types, primary and foreign keys, constraints, and indexing to ensure data integrity and efficient querying.

---

## 📦 Entities Defined

### 1. **Users**
Stores user profile data. Users can be guests or hosts.
- `user_id` (UUID): Primary key
- `role`: ENUM ('guest', 'host', 'admin')

### 2. **Properties**
Represents listings created by hosts.
- `property_id` (UUID): Primary key
- `host_id` (FK to Users): Owner of the listing
- `price_per_night`: Decimal for pricing

### 3. **Bookings**
Records reservations by guests.
- `booking_id` (UUID): Primary key
- `user_id`: Guest who books
- `property_id`: The property being booked
- `status`: ENUM ('pending', 'confirmed', 'canceled')

### 4. **Payments**
Captures payment transactions for bookings.
- `payment_id` (UUID): Primary key
- `booking_id`: Foreign key to bookings

### 5. **Reviews**
Allows guests to leave reviews for properties.
- `review_id` (UUID): Primary key
- `rating`: Integer (1–5)

### 6. **Messages**
Private messages exchanged between users.
- `message_id` (UUID): Primary key
- `sender_id`, `recipient_id`: Foreign keys to Users

---

## ⚙️ Setup Instructions

1. Ensure PostgreSQL is installed.
2. Run the schema script:
   ```bash
   psql -U your_user -d your_database -f schema.sql
````

---

## ✅ Features

* **Normalization:** Database is normalized to 3NF to avoid redundancy.
* **UUIDs:** Used as primary keys for scalability.
* **Constraints:** Enforced for referential integrity and consistency.
* **Indexes:** Primary keys and foreign keys are indexed automatically.

---

## 📂 Related Files

* `normalization.md`: Explanation of normalization steps to 3NF.
* `seed.sql`: Populates the database with sample records.
* `requirements.md`: Lists schema design goals and functional requirements.
