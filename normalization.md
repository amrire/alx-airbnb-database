# 🧮 Database Normalization – Airbnb Clone

**Objective**: Ensure the database schema is in **Third Normal Form (3NF)** to eliminate redundancy, ensure data integrity, and optimize query performance.

---

## 🔄 Normal Forms Overview

| Normal Form | Rule                                               |
| ----------- | -------------------------------------------------- |
| **1NF**     | Eliminate repeating groups; ensure atomic columns. |
| **2NF**     | Be in 1NF + eliminate partial dependencies.        |
| **3NF**     | Be in 2NF + eliminate transitive dependencies.     |

---

## ✅ Step-by-Step Normalization

### ✅ 1NF: First Normal Form

* **Atomicity**: All attributes hold single values (e.g., `first_name`, `email`, `price_per_night`).
* **No repeating groups**: Each field holds only one value per row.

✅ **Result**: All tables meet 1NF.

---

### ✅ 2NF: Second Normal Form

* **Primary Key dependencies**: All non-key attributes are fully functionally dependent on the **entire** primary key (no partial dependency on part of a composite key).

> ⚠ Since all tables use **single-column UUID primary keys**, partial dependencies are **not possible**.

✅ **Result**: All tables are in 2NF.

---

### ✅ 3NF: Third Normal Form

* **Transitive dependencies** removed: No non-key attribute depends on another non-key attribute.

| Table        | Transitive Dependencies | Fix Needed? |
| ------------ | ----------------------- | ----------- |
| **User**     | None                    | ❌ No        |
| **Property** | None                    | ❌ No        |
| **Booking**  | None                    | ❌ No        |
| **Payment**  | None                    | ❌ No        |
| **Review**   | None                    | ❌ No        |
| **Message**  | None                    | ❌ No        |

✅ **Result**: All tables are in 3NF.

---

## 🔍 Analysis of Potential Redundancies

| Case                                                     | Concern                                                                                    | Addressed?   |
| -------------------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------ |
| `host_id` in Property                                    | References User → No derived or redundant info stored                                      | ✅            |
| `price_per_night` in Property vs. `total_price` in Booking | total\_price is computed but stored for historical consistency (denormalization by design) | ⚠ Acceptable |
| `role` in User                                           | ENUM type; normalized enough unless expecting a Role table                                 | ✅            |
| Messages                                                 | sender and recipient both reference User → correct design for messaging                    | ✅            |

---

## 🛠 Optional Improvements (for even stricter normalization)

1. **Role Table (optional)**
   Normalize the `role` column into a separate `Roles` table if roles are expected to evolve:

   ```sql
   Roles (role_id, role_name)
   Users.role_id → FK → Roles.role_id
   ```

   Not necessary unless roles are managed dynamically.

2. **Payment Method Table (optional)**
   Convert ENUM into a `PaymentMethods` table if you plan to support more gateways later.
