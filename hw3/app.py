from flask import Flask, render_template, request, redirect, url_for, jsonify
from pymongo import MongoClient
from bson.objectid import ObjectId
import json

app = Flask(__name__)

# 連接 MongoDB
client = MongoClient("mongodb://localhost:27017/")
db = client['rental_db']
properties_collection = db['properties']

# 初始化資料庫 (只需執行一次)
def initialize_db():
    with open('rentaldb_merged_collection.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        if properties_collection.count_documents({}) == 0:
            properties_collection.insert_many(data)
            print("Database initialized with merged data.")

# 初始化資料庫
initialize_db()

# 首頁 - 列出所有房源資料
@app.route('/')
def index():
    properties = list(properties_collection.find())
    return render_template('index.html', properties=properties)

# 新增房源
@app.route('/add_property', methods=['GET', 'POST'])
def add_property():
    if request.method == 'POST':
        new_property = {
            "address": request.form['address'],
            "price": request.form['price'],
            "property_type": request.form['property_type'],
            "latitude": request.form['latitude'],
            "longitude": request.form['longitude']
        }
        properties_collection.insert_one(new_property)
        return redirect(url_for('index'))
    return render_template('add_new_properties.html')

# 編輯房源
@app.route('/edit/<property_id>', methods=['GET', 'POST'])
def edit_property(property_id):
    property = properties_collection.find_one({"_id": ObjectId(property_id)})
    if request.method == 'POST':
        updated_property = {
            "address": request.form['address'],
            "price": request.form['price'],
            "property_type": request.form['property_type'],
            "latitude": request.form['latitude'],
            "longitude": request.form['longitude']
        }
        properties_collection.update_one({"_id": ObjectId(property_id)}, {"$set": updated_property})
        return redirect(url_for('index'))
    return render_template('edit_property.html', property=property)

# 刪除房源
@app.route('/delete/<property_id>', methods=['POST'])
def delete_property(property_id):
    properties_collection.delete_one({"_id": ObjectId(property_id)})
    return redirect(url_for('index'))

# 查看租賃紀錄
@app.route('/rentals/<property_id>')
def show_rentals(property_id):
    property = properties_collection.find_one({"_id": ObjectId(property_id)})
    rentals = property.get('rentals', [])
    return render_template('rentals.html', rentals=rentals, property=property)

if __name__ == '__main__':
    app.run(debug=True)
