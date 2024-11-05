-- 創建屋主表（Owners）
CREATE TABLE owners (
    owner_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100)
);

-- 創建房源表（Properties）
CREATE TABLE properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    property_type VARCHAR(50), -- 如：Apartment, House, Condo
    owner_id INT,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);

-- 創建租賃紀錄表（Rentals）
CREATE TABLE rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT,
    tenant_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    rent_amount DECIMAL(10, 2),
    FOREIGN KEY (property_id) REFERENCES properties(property_id)
);

