from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Used for flash messages

# MySQL database configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'  # Replace with your MySQL username
app.config['MYSQL_PASSWORD'] = ''  # Replace with your MySQL password
app.config['MYSQL_DB'] = ''  # Replace with your database name

mysql = MySQL(app)

@app.route('/')
def index():
    # Fetch all student records from the database
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM students")
    students = cursor.fetchall()
    cursor.close()
    
    # Render the template with student data
    return render_template('index.html', students=students)

@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        student_id = request.form['student_id']
        department = request.form['department']

        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO students (name, student_id, department) VALUES (%s, %s, %s)", (name, student_id, department))
        mysql.connection.commit()
        cursor.close()

        flash('Student registration successful.')
        return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
