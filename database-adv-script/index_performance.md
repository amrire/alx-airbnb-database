## Index Performance Analysis
<hr>

### Objective
<hr>

Evaluate the impact of adding indexes on query performance in the User, Booking, and Property tables.

### Test Setup
<hr>

1. Queries were run using EXPLAIN ANALYZE.
2. Performance measured before and after adding indexes.
3. Data volume: ~10,000 rows in each table.

### Results
<hr>

#### Query 1: Fetch Bookings for a Property with a specific location

<strong>Before Indexing</strong>:

- Execution Time: 41.066 ms
- Query Plan: Sequential Scan on booking property id

<strong>After Indexing</strong>:

- Execution Time: 46.066 ms
- Query Plan: Index Scan on booking property id

#### Query 2: Get all bookings for each user.

<strong>Before Indexing</strong>

- Execution Time: 6.774 ms
- Query Plan: Sequential Scan on User and Booking 

<strong>After Indexing</strong>

- Execution Time: 2.88 ms
- Query Plan: Sequential Scan  on User and Booking 



#### Query 3: Get upcoming bookings for a user

<strong>Before Indexing</strong>

- Execution Time: 7.663 ms
- Query Plan: Sequential Scan on booking

<strong>After Indexing</strong>

- Execution Time: 0.994 ms
- Query Plan: Index Scan using idx_property_property_id on property p

