## Performance Optimization Report

### Initial Bottlenecks Identified

1. **Sequential Scan on `booking` table**

   * Caused unnecessary reads across all rows.

2. **Hash Joins without indexes**

   * Caused additional memory and CPU usage during join operations.

3. **Sorting all results before applying `LIMIT`**

   * Inefficient for large datasets.

---

### Changes Implemented

1. **Created an Index on `booking(start_date DESC)`**

   * Enabled efficient retrieval of the most recent bookings.
   * Used via `Index Scan using idx_booking_start_date_desc`.

2. **Replaced Hash Joins with Indexed Nested Loop Joins**

   * `user_id` and `property_id` joins now leverage indexes with `Memoize` caching.
   * Greatly reduced repetitive table access cost.

3. **Left Join with `payment` optimized using Materialization**

   * Since `payment` has a small row count, PostgreSQL loads it once into memory.
   * Eliminates the need for scanning during each iteration.

4. **LIMIT applied early (Top-N Heapsort)**

   * PostgreSQL stops processing after retrieving 100 rows, reducing join overhead.

---

### 📈 Results

* **Execution Time Before:** \~6.8 ms
* **Execution Time After:** **\~0.7 ms**
* **Query Plan Complexity:** Reduced through early limiting, memoization, and index utilization.

---

### ✅ Next Steps (Optional for Scaling)

* Consider indexing `payment.booking_id` if it grows.
* Use cursor-based pagination for large-scale browsing.
* Monitor performance as data volume increases.

