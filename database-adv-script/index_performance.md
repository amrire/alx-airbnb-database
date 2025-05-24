# Index Performance Report

## Objective

This report documents the creation of indexes to optimize query performance on the User, Booking, and Property tables.

---

## Identified High-Usage Columns

### Booking Table
- `user_id`, `property_id`, `total_price`: Frequently used in JOIN operations.
- ``: Commonly used in filtering and ordering by date.

### Property Table
- `location`, `pricepernight`, and `rating`: Often used in WHERE and ORDER BY clauses.

### User Table
- `first_name`: Used in login and lookup operations.

---

## Indexes Created

Saved in `database_index.sql`:

```sql
CREATE INDEX property_index ON Property([location], pricepernight, host_id);
CREATE INDEX user_index ON User(first_name);
CREATE INDEX booking_index ON Booking(property_id, user_id, total_price);
CREATE INDEX review_index ON Review(rating);
```