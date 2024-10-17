-- 插入 Departments 資料
INSERT INTO Departments (department_name, building, contact_email, head_of_department, phone_number)
VALUES
('Computer Science', 'Engineering Building', 'cs_dept@university.edu', 'Dr. Alice Johnson', '123-456-7890'),
('Mathematics', 'Science Building', 'math_dept@university.edu', 'Dr. Bob Smith', '234-567-8901'),
('Physics', 'Physics Building', 'physics_dept@university.edu', 'Dr. Charlie Brown', '345-678-9012');

-- 插入 Students 資料
INSERT INTO Students (first_name, last_name, email, department_id, enrollment_date)
VALUES
('John', 'Doe', 'john.doe@student.edu', 1, '2022-09-01'),
('Jane', 'Smith', 'jane.smith@student.edu', 2, '2021-09-01'),
('Michael', 'Johnson', 'michael.johnson@student.edu', 1, '2023-01-15'),
('Emily', 'Davis', 'emily.davis@student.edu', 3, '2022-09-01'),
('Chris', 'Brown', 'chris.brown@student.edu', 2, '2020-09-01');

-- 插入 Courses 資料
INSERT INTO Courses (course_name, course_code, credits, department_id, instructor)
VALUES
('Introduction to Computer Science', 'CS101', 4, 1, 'Dr. Alice Johnson'),
('Data Structures and Algorithms', 'CS201', 3, 1, 'Dr. Alice Johnson'),
('Calculus I', 'MATH101', 4, 2, 'Dr. Bob Smith'),
('Linear Algebra', 'MATH201', 3, 2, 'Dr. Bob Smith'),
('General Physics I', 'PHYS101', 4, 3, 'Dr. Charlie Brown');

-- 插入 Enrollments 資料
INSERT INTO Enrollments (student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2022-09-02', 'A'),
(1, 2, '2022-09-02', 'B'),
(2, 3, '2021-09-03', 'A'),
(3, 1, '2023-01-16', 'B+'),
(4, 5, '2022-09-04', 'A-'),
(5, 3, '2020-09-02', 'B'),
(5, 4, '2020-09-02', 'A');
