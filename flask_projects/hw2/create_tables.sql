CREATE DATABASE course_management;
USE course_management;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,  -- 主鍵
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,         -- 唯一的 Email
    department_id INT,                          -- 外鍵，連接到 Departments
    enrollment_date DATE,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)  -- 關聯 Departments 表
);

-- 創建 Departments 表
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,  -- 主鍵
    department_name VARCHAR(100) NOT NULL,
    building VARCHAR(50),
    contact_email VARCHAR(100),
    head_of_department VARCHAR(100),               -- 部門負責人名稱
    phone_number VARCHAR(15)
);

-- 創建 Courses 表
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,  -- 主鍵
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE,   -- 唯一的課程編號
    credits INT NOT NULL,
    department_id INT,                         -- 外鍵，連接到 Departments
    instructor VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)  -- 關聯 Departments 表
);

-- 建立學生與課程之間的多對多關係
-- 這張表記錄了學生選擇的課程
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,  -- 主鍵
    student_id INT,                                -- 外鍵，連接到 Students
    course_id INT,                                 -- 外鍵，連接到 Courses
    enrollment_date DATE NOT NULL,
    grade CHAR(2),                                 -- 學生成績
    FOREIGN KEY (student_id) REFERENCES Students(student_id),  -- 關聯 Students 表
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)      -- 關聯 Courses 表
);
