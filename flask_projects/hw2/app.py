from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
import os

app = Flask(__name__)

# 連接資料庫
def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host='localhost',
            user=os.getenv('DB_USER', 'root'),          # 使用環境變數，若無則默認 root
            password=os.getenv('DB_PASSWORD', 'zhen41171119H'),  # 使用環境變數
            database='course_management'
        )
        return conn
    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None

@app.route('/')
def index():
    return render_template('index.html')

# 顯示學生已選擇的課程
@app.route('/student/<int:student_id>')
def show_courses(student_id):
    conn = get_db_connection()
    if conn is None:
        return "Failed to connect to the database", 500  # 返回 HTTP 500 錯誤
    try:
        with conn.cursor() as cursor:
            # 使用 INNER JOIN 查詢學生已選課程
            query = '''
                SELECT Courses.course_name, Courses.course_code, Enrollments.enrollment_id
                FROM Enrollments
                INNER JOIN Courses ON Enrollments.course_id = Courses.course_id
                WHERE Enrollments.student_id = %s
            '''
            cursor.execute(query, (student_id,))
            courses = cursor.fetchall()
    except mysql.connector.Error as err:
        return f"Error: {err}", 500  # 返回 SQL 查詢錯誤
    finally:
        conn.close()

    return render_template('student_courses.html', student_id=student_id, courses=courses)

# 刪除學生選擇的課程
@app.route('/student/<int:student_id>/drop/<int:enrollment_id>')
def drop_course(student_id, enrollment_id):
    conn = get_db_connection()
    if conn is None:
        return "Failed to connect to the database", 500

    try:
        with conn.cursor() as cursor:
            query = 'DELETE FROM Enrollments WHERE enrollment_id = %s'
            cursor.execute(query, (enrollment_id,))
        conn.commit()  # 提交刪除操作
    except mysql.connector.Error as err:
        return f"Error: {err}", 500
    finally:
        conn.close()

    return redirect(url_for('show_courses', student_id=student_id))

# 顯示所有可選課程
@app.route('/courses')
def show_all_courses():
    conn = get_db_connection()
    if conn is None:
        return "Failed to connect to the database", 500

    try:
        with conn.cursor() as cursor:
            query = 'SELECT course_id, course_name, course_code FROM Courses'
            cursor.execute(query)
            courses = cursor.fetchall()
    except mysql.connector.Error as err:
        return f"Error: {err}", 500
    finally:
        conn.close()

    return render_template('all_courses.html', courses=courses)

# 執行應用
if __name__ == '__main__':
    app.run(debug=True)
