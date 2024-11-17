# Rental Property Management System By NoSQL
## Project Overview
This is a Flask-based web application for managing rental properties. It allows users to:
- View a list of rental properties.
- Add new properties.
- Edit existing property details.
- Delete properties.
- View rental records associated with each property.

The application uses **MongoDB** to store property and rental information and allows for full CRUD functionality.
## File Structure
```
/rental_project
├── app.py                    # Main Flask application
├── requirements.txt          # Required Python packages
├── rentaldb_merged_collection.json  # JSON file with merged property and rental data
├── /templates                # HTML templates for the web pages
│   ├── index.html            # Main page displaying all properties
│   ├── edit_property.html    # Edit property page
│   ├── add_new_properties.html  # Add new property page
│   └── rentals.html          # View rentals for a specific property
├── /static                   # Static files (CSS, images, etc.)
│   └── style.css             # Custom CSS for styling
└── /data                     # Directory for additional data files (if needed)
```
## JSON File Structure
The `rentaldb_merged_collection.json` file contains a list of property objects, each with an associated list of rental records (if any).

### Property Object Example
```json
{
    "address": "No.11, Songgao Rd., Xinyi Dist., Taipei City",
    "price": "30000",
    "property_type": "Apartment",
    "latitude": "25.0330",
    "longitude": "121.5654",
    "owner": {
        "name": "Wang Xiaoming",
        "contact_info": "0988-111-222",
        "owner_id": "1"
    },
    "rentals": [
        {
            "tenant_name": "Chen Lian",
            "start_date": "2024-01-01",
            "end_date": "2024-06-30",
            "rent_amount": "30000"
        }
    ]
}
```
## Application Features
1. **Home Page**: View all properties and their details.
2. **Add Property**: Add a new rental property using the "Add New Property" button.
3. **Edit Property**: Edit the details of an existing property.
4. **Delete Property**: Delete a property from the database.
5. **View Rentals**: View rental records associated with a specific property.

