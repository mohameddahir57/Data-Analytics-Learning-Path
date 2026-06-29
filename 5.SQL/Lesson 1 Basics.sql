-- SQL Lesson 01 - Students Database

-- Create the Students database
CREATE DATABASE Students;

-- Select the Students database to use
USE Students;

-- Create student_info table
CREATE TABLE student_info (
    STD_ID INT PRIMARY KEY,
    STD_Name VARCHAR(40),
    Gender VARCHAR(40),
    Marks INT
);

-- Insert 50 Somali students into student_info table
INSERT INTO student_info (STD_ID, STD_Name, Gender, Marks) VALUES
(1, 'Ahmed Hassan Mohamed', 'Male', 78),
(2, 'Faadumo Ali Warsame', 'Female', 85),
(3, 'Cabdullahi Omar Farah', 'Male', 62),
(4, 'Hodan Mohamud Jama', 'Female', 91),
(5, 'Maxamed Saleban Guure', 'Male', 74),
(6, 'Sahra Abdi Nur', 'Female', 88),
(7, 'Faarax Yusuf Shire', 'Male', 55),
(8, 'Asad Cabdirashid Ali', 'Male', 67),
(9, 'Nimco Dahir Hassan', 'Female', 93),
(10, 'Cumar Bashir Farah', 'Male', 70),
(11, 'Ifrah Maxamed Warsame', 'Female', 82),
(12, 'Mustafa Jama Osman', 'Male', 48),
(13, 'Luul Abshir Aden', 'Female', 76),
(14, 'Cabdi Xasan Muuse', 'Male', 59),
(15, 'Batulo Yusuf Garad', 'Female', 84),
(16, 'Daud Siciid Maxamed', 'Male', 71),
(17, 'Amina Farah Nur', 'Female', 90),
(18, 'Yasin Cabdullahi Dirie', 'Male', 65),
(19, 'Filsan Osman Jama', 'Female', 87),
(20, 'Rashid Muuse Hersi', 'Male', 53),
(21, 'Zeinab Ahmed Warsame', 'Female', 79),
(22, 'Idris Maxamed Salah', 'Male', 68),
(23, 'Shukri Cabdi Farah', 'Female', 95),
(24, 'Abshir Dahir Shire', 'Male', 61),
(25, 'Hibo Jama Hassan', 'Female', 83),
(26, 'Siciid Yuusuf Osman', 'Male', 72),
(27, 'Fowsiya Bashir Muuse', 'Female', 89),
(28, 'Khalid Farah Garad', 'Male', 57),
(29, 'Layla Cabdirashid Nur', 'Female', 94),
(30, 'Barkhad Maxamed Jama', 'Male', 66),
(31, 'Cadar Saleban Warsame', 'Female', 80),
(32, 'Jibreel Xasan Farah', 'Male', 73),
(33, 'Suad Cumar Dirie', 'Female', 86),
(34, 'Nasteho Idris Hassan', 'Female', 92),
(35, 'Farhan Cabdi Muuse', 'Male', 64),
(36, 'Maryam Yuusuf Shire', 'Female', 77),
(37, 'Cabdiqadir Jama Osman', 'Male', 50),
(38, 'Raxma Maxamed Garad', 'Female', 88),
(39, 'Anwar Bashir Farah', 'Male', 69),
(40, 'Safia Dahir Nur', 'Female', 81),
(41, 'Warsan Cabdullahi Ali', 'Female', 75),
(42, 'Hamza Siciid Hassan', 'Male', 58),
(43, 'Deeqa Farah Warsame', 'Female', 96),
(44, 'Liban Muuse Jama', 'Male', 63),
(45, 'Ayan Osman Shire', 'Female', 87),
(46, 'Mukhtar Cabdi Garad', 'Male', 54),
(47, 'Habibo Maxamed Farah', 'Female', 79),
(48, 'Abdifatah Yuusuf Dirie', 'Male', 70),
(49, 'Khadija Hassan Muuse', 'Female', 91),
(50, 'Bile Jama Warsame', 'Male', 67);

-- Retrieve all records from student_info table
SELECT * FROM student_info;

-- Retrieve specific columns from student_info table
SELECT STD_ID, STD_Name, Gender, Marks FROM student_info;

-- Retrieve a specific student by ID
SELECT * FROM student_info WHERE STD_ID = 1;

-- Update student name where ID = 1
UPDATE student_info SET STD_Name = 'Mohamed Dahir Osman' WHERE STD_ID = 1;

-- SQL Lesson 01 - Definitions

-- CREATE DATABASE: Creates a new database in the SQL server
-- USE: Selects a database to work with
-- CREATE TABLE: Creates a new table inside the database with defined columns and data types
-- INT: A data type that stores whole numbers
-- VARCHAR: A data type that stores text up to a specified length
-- PRIMARY KEY: A column that uniquely identifies each row in a table
-- DECIMAL: A data type that stores numbers with decimal points
-- INSERT INTO: Adds new rows of data into a table
-- VALUES: Specifies the data to be inserted into the table
-- SELECT: Retrieves data from a table
-- SELECT *: Retrieves all columns from a table
-- WHERE: Filters records based on a condition
-- UPDATE: Modifies existing data in a table
-- SET: Specifies the column and new value to update
