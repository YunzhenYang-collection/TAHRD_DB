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

To retrieve and display comprehensive data from multiple tables, SQL `JOIN` statements are used. Below are some examples: 

Example 1: Retrieve Property Details with Owner Information  
This query retrieves each property's details along with the owner's name and contact information.

```sql
SELECT properties.address, properties.price, properties.property_type, 
       owners.name AS owner_name, owners.contact_info  
FROM properties  
JOIN owners ON properties.owner_id = owners.owner_id;
JOIN owners ON properties.owner_id = owners.owner_id;  
```
### Example 2: Retrieve Properties with Owner and Rental Details  
This query retrieves property details, including the associated owner and rental information, if available. A LEFT JOIN is used to include properties even if they do not have a rental record.

```sql
SELECT properties.address, properties.price, properties.property_type,  
       owners.name AS owner_name, owners.contact_info,  
       rentals.tenant_name, rentals.start_date, rentals.end_date, rentals.rent_amount  
FROM properties  
JOIN owners ON properties.owner_id = owners.owner_id  
LEFT JOIN rentals ON properties.property_id = rentals.property_id;
```
### Example 3: Filter Properties by Price Range

To filter properties by specific price ranges, you can add a `WHERE` clause to filter results based on the `price` column. This example shows properties with prices between 20000 and 25000.

```sql
SELECT properties.address, properties.price, properties.property_type,
       owners.name AS owner_name, owners.contact_info,
       rentals.tenant_name, rentals.start_date, rentals.end_date, rentals.rent_amount
FROM properties
JOIN owners ON properties.owner_id = owners.owner_id
LEFT JOIN rentals ON properties.property_id = rentals.property_id
WHERE properties.price BETWEEN 20000 AND 25000;
```



