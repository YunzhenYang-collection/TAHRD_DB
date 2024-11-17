import json

# 讀取 JSON 檔案
with open('mongodb_owners.json', 'r', encoding='utf-8') as f:
    owners = json.load(f)

with open('mongodb_properties.json', 'r', encoding='utf-8') as f:
    properties = json.load(f)

with open('mongodb_rentals.json', 'r', encoding='utf-8') as f:
    rentals = json.load(f)

# 建立 owners 的字典映射，使用 owner_id 作為鍵
owners_map = {owner['owner_id']: owner for owner in owners}

# 建立 property_id 到 rentals 的字典映射
rentals_map = {}
for rental in rentals:
    property_id = rental['property_id']
    if property_id not in rentals_map:
        rentals_map[property_id] = []
    rentals_map[property_id].append(rental)

# 合併資料
merged_data = []
for property in properties:
    # 根據 owner_id 進行匹配，嵌入 owner 資料
    owner_id = property.get('owner_id')
    if owner_id and owner_id in owners_map:
        property['owner'] = owners_map[owner_id]
    else:
        property['owner'] = {}
    
    # 取得 rentals 資料
    property_id = property.get('property_id')
    property['rentals'] = rentals_map.get(property_id, [])
    
    merged_data.append(property)

# 儲存合併後的資料為 JSON 檔案
output_path = 'merged_collection.json'
with open(output_path, 'w', encoding='utf-8') as f:
    json.dump(merged_data, f, indent=4, ensure_ascii=False)

print(f'Merged data saved to {output_path}')
