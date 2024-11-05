from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # 用於顯示 flash 訊息

# MySQL 配置
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'zhen41171119H'
app.config['MYSQL_DB'] = 'rental_db'

mysql = MySQL(app)

# 每頁顯示的資料數量
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

@app.route('/rentals')
def show_rentals():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM rentals")
    rentals = cursor.fetchall()
    return render_template('rentals.html', rentals=rentals)

@app.route('/delete_property/<int:property_id>', methods=['POST'])
def delete_property(property_id):
    cursor = mysql.connection.cursor()
    try:
        # 先刪除 property_photos 表中引用的紀錄
        cursor.execute("DELETE FROM property_photos WHERE property_id = %s", (property_id,))
        # 再刪除 properties 表中的紀錄
        cursor.execute("DELETE FROM properties WHERE property_id = %s", (property_id,))
        mysql.connection.commit()
        flash("Property deleted successfully.")
    except MySQLdb.IntegrityError as e:
        flash(f"Error: {str(e)}")
    return redirect(url_for('index'))

@app.route('/edit_property/<int:property_id>', methods=['GET', 'POST'])
def edit_property(property_id):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if request.method == 'POST':
        address = request.form['address']
        price = request.form['price']
        property_type = request.form['property_type']
        cursor.execute('''
            UPDATE properties 
            SET address = %s, price = %s, property_type = %s 
            WHERE property_id = %s
        ''', (address, price, property_type, property_id))
        mysql.connection.commit()
        flash("Property updated successfully.")
        return redirect(url_for('index'))
    else:
        cursor.execute("SELECT * FROM properties WHERE property_id = %s", (property_id,))
        property = cursor.fetchone()
        return render_template('edit_property.html', property=property)

@app.route('/rentals/<int:property_id>')
def show_property_rentals(property_id):  # 使用唯一的函數名稱
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute("SELECT * FROM rentals WHERE property_id = %s", (property_id,))
    rentals = cursor.fetchall()
    return render_template('rental.html', rentals=rentals, property_id=property_id)

if __name__ == '__main__':
    app.run(debug=True)
