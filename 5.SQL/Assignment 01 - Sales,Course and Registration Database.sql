
-- Assignment 01 - Sales,Course and Registration Database

-- PART 1: Sales Database


-- Create and use Sales database
CREATE DATABASE Sales;
USE Sales;

-- Create sales table
CREATE TABLE sales (
    Sales_id INT PRIMARY KEY,
    Product_name VARCHAR(50),
    Qty INT,
    Unit_price DECIMAL(10,2),
    Total_sales DECIMAL(10,2)
);

-- Insert 10 rows into sales table
INSERT INTO sales (Sales_id, Product_name, Qty, Unit_price, Total_sales) VALUES
(1, 'Laptop', 2, 850.00, 1700.00),
(2, 'Mouse', 5, 15.00, 75.00),
(3, 'Keyboard', 3, 25.00, 75.00),
(4, 'Monitor', 4, 200.00, 800.00),
(5, 'Headphones', 6, 45.00, 270.00),
(6, 'USB Hub', 10, 12.00, 120.00),
(7, 'Webcam', 2, 60.00, 120.00),
(8, 'Printer', 1, 150.00, 150.00),
(9, 'Flash Drive', 8, 10.00, 80.00),
(10, 'Hard Disk', 3, 75.00, 225.00);

-- Select all from sales
SELECT * FROM sales;

-- PART 2: Course Database


-- Create and use Course database
CREATE DATABASE Course;
USE Course;

-- Create course table
CREATE TABLE course (
    Course_id INT PRIMARY KEY,
    Course_name VARCHAR(50),
    Course_fee DECIMAL(10,2),
    Marks INT
);

-- Insert 10 rows into course table
INSERT INTO course (Course_id, Course_name, Course_fee, Marks) VALUES
(1, 'SQL Fundamentals', 100.00, 85),
(2, 'Python Programming', 150.00, 90),
(3, 'Data Analytics', 200.00, 78),
(4, 'Web Development', 180.00, 88),
(5, 'Cybersecurity', 220.00, 74),
(6, 'Machine Learning', 250.00, 92),
(7, 'Network Basics', 120.00, 80),
(8, 'Cloud Computing', 210.00, 86),
(9, 'UI/UX Design', 160.00, 77),
(10, 'Database Management', 140.00, 83);

-- Select all from course
SELECT * FROM course;

-- PART 3: Registration Database

-- Create and use Registration database
CREATE DATABASE Registration;
USE Registration;

-- Create registration table
CREATE TABLE registration (
    Registration_id INT PRIMARY KEY,
    Student_name VARCHAR(50),
    Class VARCHAR(20),
    Shift VARCHAR(20)
);

-- Insert 10 rows into registration table
INSERT INTO registration (Registration_id, Student_name, Class, Shift) VALUES
(1, 'Ahmed Hassan Mohamed', 'Class A', 'Morning'),
(2, 'Faadumo Ali Warsame', 'Class B', 'Evening'),
(3, 'Cabdullahi Omar Farah', 'Class A', 'Morning'),
(4, 'Hodan Mohamud Jama', 'Class C', 'Afternoon'),
(5, 'Maxamed Saleban Guure', 'Class B', 'Morning'),
(6, 'Sahra Abdi Nur', 'Class A', 'Evening'),
(7, 'Faarax Yusuf Shire', 'Class C', 'Morning'),
(8, 'Nimco Dahir Hassan', 'Class B', 'Afternoon'),
(9, 'Cumar Bashir Farah', 'Class A', 'Evening'),
(10, 'Ifrah Maxamed Warsame', 'Class C', 'Morning');

-- Select all from registration
SELECT * FROM registration;