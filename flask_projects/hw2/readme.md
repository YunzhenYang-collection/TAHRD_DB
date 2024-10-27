# Property Rental Management System# Property Rental Management System

This project is a property rental management system built with Flask and MySQL. The system provides functionality for managing property listings, owners, and rental records. Properties can be filtered by price range and displayed with related details like owner and rental history.

## Database Schema

The database contains three main tables:

### 1. `owners`

| Column         | Data Type      | Description                   |  
|----------------|----------------|-------------------------------|  
| `owner_id`     | `INT` (PK)     | Unique identifier for each owner. |  
| `name`         | `VARCHAR(100)` | Owner's full name.            |  
| `contact_info` | `VARCHAR(100)` | Owner's contact information (e.g., phone number). |  

### 2. `properties`

| Column          | Data Type      | Description                                       |  
|-----------------|----------------|---------------------------------------------------|  
| `property_id`   | `INT` (PK)     | Unique identifier for each property.              |  
| `address`       | `VARCHAR(255)` | Property address.                                 |  
| `price`         | `DECIMAL(10,2)`| Monthly rental price of the property.             |  
| `property_type` | `VARCHAR(50)`  | Type of the property (e.g., Apartment, Condo, House). |  
| `owner_id`      | `INT` (FK)     | Foreign key linking to `owners.owner_id`.         |  
| `latitude`      | `DECIMAL(9,6)` | Latitude for property location.                   |  
| `longitude`     | `DECIMAL(9,6)` | Longitude for property location.                  |  

### 3. `rentals`

| Column         | Data Type      | Description                                         |  
|----------------|----------------|-----------------------------------------------------|  
| `rental_id`    | `INT` (PK)     | Unique identifier for each rental record.           |  
| `property_id`  | `INT` (FK)     | Foreign key linking to `properties.property_id`.    |  
| `tenant_name`  | `VARCHAR(100)` | Name of the tenant renting the property.            |  
| `start_date`   | `DATE`         | Start date of the rental period.                    |  
| `end_date`     | `DATE`         | End date of the rental period.                      |  
| `rent_amount`  | `DECIMAL(10,2)`| Amount paid by the tenant per month for the property.|

## Using `JOIN` to Retrieve Data

The application retrieves property details using a complex SQL query that utilizes `JOIN` and `LEFT JOIN` operations to combine data from multiple tables. This query is crucial for gathering information from related tables in a single query.

```sql
SELECT properties.property_id, properties.address, properties.price, properties.property_type, 
       owners.name AS owner_name, owners.contact_info,
       MIN(rentals.tenant_name) AS tenant_name, MIN(rentals.start_date) AS start_date, MIN(rentals.end_date) AS end_date, 
       MIN(rentals.rent_amount) AS rent_amount
FROM properties
JOIN owners ON properties.owner_id = owners.owner_id
LEFT JOIN rentals ON properties.property_id = rentals.property_id
{price_conditions[price_range]}
GROUP BY properties.property_id
ORDER BY properties.property_id
LIMIT {ITEMS_PER_PAGE} OFFSET {offset}
```
Explanation of `JOIN` Usage
`JOIN owners ON properties.owner_id = owners.owner_id`: This `JOIN` combines the properties and owners tables based on the `owner_id` column, ensuring each property record is enriched with its associated owner's details (name and contact information). `JOIN` ensures that only properties with existing owners are included in the results.

`LEFT JOIN rentals ON properties.property_id = rentals.property_id`: The `LEFT JOIN` operation here links the properties table with the rentals table. Using `LEFT JOIN` ensures that all properties are included, even if they do not have an associated rental record. This is particularly useful for showing properties that might currently be unrented. When there is no rental information, rental-related columns will be `NULL`.

Grouping and Aggregation
`GROUP BY properties.property_id`: This groups the result by each unique `property_id`. Since a property can have multiple rental records, `GROUP BY` ensures that each property appears only once in the result.

Aggregation Functions: We use `MIN()` for rental-related fields (`tenant_name`, `start_date`, `end_date`, and `rent_amount`) to select a single record from potentially multiple rental records for each property. This approach ensures that only one rental entry (the one with the minimum value for each field) is displayed per property.

Pagination and Filtering
Price Range Filtering: The `{price_conditions[price_range]}` placeholder dynamically adds filtering based on the user's selected price range.

Pagination: `LIMIT {ITEMS_PER_PAGE} OFFSET {offset}` is used to implement pagination, showing a limited number of properties per page and skipping records based on the current page offset.



