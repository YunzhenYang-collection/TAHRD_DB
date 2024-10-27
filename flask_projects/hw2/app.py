from flask import Flask, render_template, request, url_for
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = ''

mysql = MySQL(app)


ITEMS_PER_PAGE = 15

@app.route('/')
def index():
    
    page = request.args.get('page', 1, type=int)
    price_range = request.args.get('price_range', '0')
    offset = (page - 1) * ITEMS_PER_PAGE
    
  
    price_conditions = {
        '0': '', 
        '1': 'WHERE properties.price < 20000',
        '2': 'WHERE properties.price BETWEEN 20000 AND 25000',
        '3': 'WHERE properties.price BETWEEN 25000 AND 30000',
        '4': 'WHERE properties.price BETWEEN 30000 AND 35000',
        '5': 'WHERE properties.price > 35000'
    }
    
    
    query = f'''
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
    '''
    
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(query)
    properties = cursor.fetchall()
    
    
    has_next_page = len(properties) == ITEMS_PER_PAGE

    return render_template('index.html', properties=properties, page=page, price_range=price_range, has_next_page=has_next_page)

if __name__ == '__main__':
    app.run(debug=True)
