# Seed Script for Airbnb-Clone Database

This `seed.sql` file is used to populate the database with initial data for testing and development purposes. It inserts sample data into the following tables:

- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

## Prerequisites

Before running the seed script, ensure the following:

1. The database schema has been created using the `schema.sql` file.
2. The PostgreSQL `uuid-ossp` extension is enabled for generating UUIDs:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

Here’s a README.md file for your `seed.sql`:

# Seed Script for Airbnb Database

This `seed.sql` file is used to populate the database with initial data for testing and development purposes. It inserts sample data into the following tables:

- `users`
- `properties`
- `bookings`
- `payments`
- `reviews`
- `messages`

## Prerequisites

Before running the seed script, ensure the following:

1. The database schema has been created using the `schema.sql` file.
2. The PostgreSQL `uuid-ossp` extension is enabled for generating UUIDs:
   ```sql
   CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
   ```

## How to Use

1. Connect to your PostgreSQL database using a tool like `psql` or a database client.
2. Run the `schema.sql` file to create the database structure:
   ```bash
   psql -U <username> -d <database_name> -f /path/to/schema.sql
   ```
3. Run the `seed.sql` file to populate the database with sample data:
   ```bash
   psql -U <username> -d <database_name> -f /path/to/seed.sql
   ```

## Sample Data Overview

### Users
- Hosts and guests with basic information like name, email, and role.

### Properties
- Listings created by hosts, including details like name, description, location, and price per night.

### Bookings
- Reservations made by guests for specific properties, with start and end dates, total price, and status.

### Payments
- Payment records associated with bookings, including amount and payment method.

### Reviews
- Feedback left by guests for properties, including ratings and comments.

### Messages
- Communication between users, such as inquiries about property availability.

## Notes

- The script uses `uuid_generate_v4()` to generate unique identifiers for primary keys.
- Ensure that the email addresses in the `users` table match the references in other tables (e.g., `host_id`, `user_id`).

Feel free to modify the data in `seed.sql` to suit your specific testing needs.
