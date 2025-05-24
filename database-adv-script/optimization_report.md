## Performance Report

- The query performed **full table scans** on Booking, User, Property, and Payment tables when querying data that require joing this tables.
- No indexes caused the database engine to read every row to satisfy joins and filters.
- Execution plans showed **sequential scans** and costly nested loop joins.
- Overall query execution time was significantly higher, making the query inefficient for large datasets.
