CREATE DATABASE student_db;
USE student_db;
CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  student_id VARCHAR(20) NOT NULL,
  department VARCHAR(50) NOT NULL
);