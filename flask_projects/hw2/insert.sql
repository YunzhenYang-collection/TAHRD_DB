-- 插入屋主資料
INSERT INTO owners (name, contact_info) VALUES 
('Wang Xiaoming', '0988-111-222'), 
('Li Meili', '0988-222-333'), 
('Zhang Datong', '0988-333-444'),
('Chen Anan', '0988-444-555'), 
('Lin Qiaoqiao', '0988-555-666'),
('Huang Wei', '0988-666-777'), 
('Liu Shiqi', '0988-777-888'), 
('Zhou Fangfang', '0988-888-999'),
('Wu Haohao', '0988-999-000'), 
('Xu Xiaoxiao', '0988-000-111'), 
('Gao Tianya', '0988-111-333'), 
('Yang Keke', '0988-222-444'), 
('Zheng Jie', '0988-333-555'), 
('Xie Zhizhi', '0988-444-666'), 
('Deng Huanhuan', '0988-555-777');

-- 插入房源資料
INSERT INTO properties (address, price, property_type, owner_id, latitude, longitude) VALUES
('No.11, Songgao Rd., Xinyi Dist., Taipei City', 30000, 'Apartment', 1, 25.0330, 121.5654),
('No.32, Sec. 2, Heping E. Rd., Da’an Dist., Taipei City', 25000, 'Condo', 2, 25.0262, 121.5437),
('No.91, Tingzhou Rd., Sec. 1, Zhongzheng Dist., Taipei City', 22000, 'House', 3, 25.0234, 121.5285),
('No.42, Sec. 4, Nanjing E. Rd., Songshan Dist., Taipei City', 28000, 'Apartment', 4, 25.0518, 121.5532),
('No.12, Kangding Rd., Wanhua Dist., Taipei City', 18000, 'Condo', 5, 25.0375, 121.4990),
('No.80, Sec. 5, Xinyi Rd., Xinyi Dist., Taipei City', 32000, 'Apartment', 6, 25.0308, 121.5651),
('No.56, Sec. 5, Zhongshan N. Rd., Shilin Dist., Taipei City', 27000, 'House', 7, 25.0912, 121.5484),
('No.70, Sec. 2, Shipai Rd., Beitou Dist., Taipei City', 23000, 'Apartment', 8, 25.1142, 121.5145),
('No.33, Sec. 3, Yanping N. Rd., Datong Dist., Taipei City', 21000, 'Condo', 9, 25.0687, 121.5148),
('No.71, Sec. 6, Roosevelt Rd., Wenshan Dist., Taipei City', 20000, 'House', 10, 24.9986, 121.5393),
('No.45, Sec. 7, Zhongxiao E. Rd., Nangang Dist., Taipei City', 26000, 'Apartment', 11, 25.0554, 121.6054),
('No.21, Sec. 6, Minquan E. Rd., Neihu Dist., Taipei City', 25000, 'Condo', 12, 25.0795, 121.5821),
('No.18, Linsen N. Rd., Zhongshan Dist., Taipei City', 28000, 'Apartment', 13, 25.0533, 121.5228),
('No.2, Songren Rd., Xinyi Dist., Taipei City', 32000, 'Condo', 14, 25.0324, 121.5672),
('No.19, Sec. 4, Renai Rd., Da’an Dist., Taipei City', 29000, 'House', 15, 25.0333, 121.5436);

-- 插入租賃紀錄資料
INSERT INTO rentals (property_id, tenant_name, start_date, end_date, rent_amount) VALUES
(1, 'Chen Lian', '2024-01-01', '2024-06-30', 30000),
(2, 'Lin Fang', '2024-02-15', '2024-08-15', 25000),
(3, 'Wu Jian', '2024-03-10', '2024-09-10', 22000),
(4, 'Zhou Wei', '2024-04-05', '2024-10-05', 28000),
(5, 'Huang Yu', '2024-05-01', '2024-11-01', 18000),
(6, 'Deng Lan', '2024-06-15', '2024-12-15', 32000),
(7, 'Liu Mei', '2024-07-01', '2024-12-31', 27000),
(8, 'Xu Yan', '2024-08-01', '2025-02-01', 23000),
(9, 'Zheng Hao', '2024-09-01', '2025-03-01', 21000),
(10, 'Gao Xin', '2024-10-01', '2025-04-01', 20000);

-- 插入新的本地圖片資料，使用 static/pictures 格式的本地圖片路徑
INSERT INTO property_photos (property_id, photo_url) VALUES
(1, 'pictures/house1.jpg'),
(2, 'pictures/house2.jpg'),
(3, 'pictures/house3.jpg'),
(4, 'pictures/house4.jpg'),
(5, 'pictures/house5.jpg'),
(6, 'pictures/house6.jpg'),
(7, 'pictures/house7.jpg'),
(8, 'pictures/house8.jpg'),
(9, 'pictures/house9.jpg'),
(10, 'pictures/house10.jpg'),
(11, 'pictures/house11.jpg'),
(12, 'pictures/house12.jpg'),
(13, 'pictures/house13.jpg'),
(14, 'pictures/house14.jpg'),
(15, 'pictures/house15.jpg');

-- 增加屋主資料
INSERT INTO owners (name, contact_info) VALUES 
('Li Wei', '0988-888-100'), 
('Chen Xinyi', '0988-888-101'), 
('Zhang Min', '0988-888-102'),
('Lin Zhihao', '0988-888-103'), 
('Xu Hua', '0988-888-104'),
('Gao Xiong', '0988-888-105'), 
('Deng Yun', '0988-888-106'), 
('Wang Ping', '0988-888-107'),
('Lu Ming', '0988-888-108'), 
('Huang Yue', '0988-888-109'), 
('Tang Qing', '0988-888-110'), 
('Fan Jian', '0988-888-111'), 
('Yang Zhe', '0988-888-112'), 
('Wu Rui', '0988-888-113'), 
('Liao Chun', '0988-888-114');

-- 增加房源資料
INSERT INTO properties (address, price, property_type, owner_id, latitude, longitude) VALUES
('No.17, Fuxing S. Rd., Da’an Dist., Taipei City', 21000, 'Apartment', 16, 25.0330, 121.5640),
('No.88, Civic Blvd., Zhongshan Dist., Taipei City', 24000, 'Condo', 17, 25.0422, 121.5320),
('No.5, Changchun Rd., Zhongshan Dist., Taipei City', 28000, 'House', 18, 25.0495, 121.5450),
('No.76, Bade Rd., Songshan Dist., Taipei City', 22000, 'Apartment', 19, 25.0519, 121.5575),
('No.23, Chengde Rd., Datong Dist., Taipei City', 19000, 'Condo', 20, 25.0633, 121.5153),
('No.44, Zhongshan N. Rd., Shilin Dist., Taipei City', 33000, 'Apartment', 21, 25.0945, 121.5477),
('No.50, Xinsheng N. Rd., Zhongzheng Dist., Taipei City', 36000, 'House', 22, 25.0299, 121.5200),
('No.18, Renai Rd., Da’an Dist., Taipei City', 26000, 'Apartment', 23, 25.0323, 121.5438),
('No.95, Dunhua S. Rd., Da’an Dist., Taipei City', 27000, 'Condo', 24, 25.0328, 121.5460),
('No.60, Xinsheng S. Rd., Zhongzheng Dist., Taipei City', 35000, 'House', 25, 25.0222, 121.5333),
('No.48, Jianguo N. Rd., Zhongshan Dist., Taipei City', 18000, 'Apartment', 26, 25.0578, 121.5399),
('No.71, Heping E. Rd., Da’an Dist., Taipei City', 26000, 'Condo', 27, 25.0265, 121.5430),
('No.33, Nanjing E. Rd., Songshan Dist., Taipei City', 23000, 'Apartment', 28, 25.0520, 121.5595),
('No.21, Keelung Rd., Xinyi Dist., Taipei City', 30000, 'House', 29, 25.0278, 121.5645),
('No.2, Songren Rd., Xinyi Dist., Taipei City', 34000, 'Apartment', 30, 25.0294, 121.5665);

-- 增加租賃紀錄資料
INSERT INTO rentals (property_id, tenant_name, start_date, end_date, rent_amount) VALUES
(16, 'Yin Zhi', '2024-03-01', '2024-09-01', 21000),
(17, 'Xu Yan', '2024-04-10', '2024-10-10', 24000),
(18, 'Chen Li', '2024-05-15', '2024-11-15', 28000),
(19, 'Wang Yu', '2024-06-01', '2024-12-01', 22000),
(20, 'Zhou Feng', '2024-07-20', '2025-01-20', 19000),
(21, 'Li Xin', '2024-08-05', '2025-02-05', 33000),
(22, 'Deng Qing', '2024-09-15', '2025-03-15', 36000),
(23, 'Fan Qiao', '2024-10-01', '2025-04-01', 26000),
(24, 'He Liang', '2024-11-01', '2025-05-01', 27000),
(25, 'Gao Rui', '2024-12-10', '2025-06-10', 35000),
(26, 'Ma Jing', '2024-01-20', '2024-07-20', 18000),
(27, 'Wu Fei', '2024-02-15', '2024-08-15', 26000),
(28, 'Huang Ming', '2024-03-10', '2024-09-10', 23000),
(29, 'Zhao Lei', '2024-04-25', '2024-10-25', 30000),
(30, 'Qian Xin', '2024-05-30', '2024-11-30', 34000);

-- 增加本地圖片資料，使用 static/pictures 格式的本地圖片路徑
INSERT INTO property_photos (property_id, photo_url) VALUES
(16, 'pictures/house16.jpg'),
(17, 'pictures/house17.jpg'),
(18, 'pictures/house18.jpg'),
(19, 'pictures/house19.jpg'),
(20, 'pictures/house20.jpg'),
(21, 'pictures/house21.jpg'),
(22, 'pictures/house22.jpg'),
(23, 'pictures/house23.jpg'),
(24, 'pictures/house24.jpg'),
(25, 'pictures/house25.jpg'),
(26, 'pictures/house26.jpg'),
(27, 'pictures/house27.jpg'),
(28, 'pictures/house28.jpg'),
(29, 'pictures/house29.jpg'),
(30, 'pictures/house30.jpg');

