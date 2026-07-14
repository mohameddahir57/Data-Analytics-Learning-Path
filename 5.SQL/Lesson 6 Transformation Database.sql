-- SQL Lesson 05 - Transformation & CASE Statement

CREATE DATABASE transformation_db;
USE transformation_db;

-- CREATE TABLE

-- Create SalesOrders table
CREATE TABLE SalesOrders (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Region VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    OrderStatus VARCHAR(20)
);

-- INSERT DATA

-- Insert 20 rows into SalesOrders table
INSERT INTO SalesOrders
(OrderID, CustomerName, Product, Category, Region, Quantity, UnitPrice, OrderStatus)
VALUES
(1,  'Ahmed Ali',      'Laptop',   'Electronics', 'East',  2,  600.00, 'Delivered'),
(2,  'Amina Hassan',   'Chair',    'Furniture',   'West',  5,  80.00,  'Pending'),
(3,  'Mohamed Omar',   'Printer',  'Electronics', 'North', 1,  250.00, 'Delivered'),
(4,  'Maryan Abdi',    'Desk',     'Furniture',   'South', 3,  150.00, 'Delivered'),
(5,  'Ali Yusuf',      'Keyboard', 'Accessories', 'East',  10, 25.00,  'Pending'),
(6,  'Fatima Noor',    'Mouse',    'Accessories', 'West',  8,  15.00,  'Delivered'),
(7,  'Hassan Jama',    'Monitor',  'Electronics', 'North', 2,  200.00, 'Delivered'),
(8,  'Sahra Osman',    'Table',    'Furniture',   'South', 4,  120.00, 'Pending'),
(9,  'Khalid Abdi',    'Headset',  'Accessories', 'East',  6,  40.00,  'Delivered'),
(10, 'Nimco Ali',      'Laptop',   'Electronics', 'West',  1,  650.00, 'Delivered'),
(11, 'Abdi Said',      'Chair',    'Furniture',   'North', 7,  75.00,  'Pending'),
(12, 'Hodan Omar',     'Printer',  'Electronics', 'South', 2,  230.00, 'Delivered'),
(13, 'Ismail Nur',     'Mouse',    'Accessories', 'East',  12, 12.00,  'Delivered'),
(14, 'Zahra Ahmed',    'Desk',     'Furniture',   'West',  2,  160.00, 'Delivered'),
(15, 'Omar Hassan',    'Monitor',  'Electronics', 'North', 3,  210.00, 'Pending'),
(16, 'Layla Abdi',     'Keyboard', 'Accessories', 'South', 9,  22.00,  'Delivered'),
(17, 'Yusuf Mohamed',  'Table',    'Furniture',   'East',  1,  130.00, 'Pending'),
(18, 'Ifrah Jama',     'Headset',  'Accessories', 'West',  5,  45.00,  'Delivered'),
(19, 'Abdullahi Ali',  'Laptop',   'Electronics', 'North', 2,  620.00, 'Delivered'),
(20, 'Fadumo Osman',   'Chair',    'Furniture',   'South', 6,  70.00,  'Delivered');

-- SELECT & CALCULATED COLUMNS

-- Retrieve all records from SalesOrders table
SELECT * FROM SalesOrders;

-- Calculate total sales per order (Quantity x UnitPrice)
SELECT 
    CustomerName,
    Product,
    Category,
    Quantity * UnitPrice AS Total_Sales
FROM SalesOrders;

-- CASE Statement - Categorize Sales

-- Categorize each order as High, Intermediate or Low sales
SELECT 
    Product,
    Category,
    UnitPrice * Quantity AS Total_Sales,
    Region,
    CASE 
        WHEN UnitPrice * Quantity >= 1000 THEN 'High_Sales'
        WHEN UnitPrice * Quantity > 600   THEN 'Intermediate_Sales'
        ELSE 'Low_Sales'
    END AS Category_Sales
FROM SalesOrders;

-- DISTINCT - Remove Duplicates

-- Retrieve unique categories only
SELECT DISTINCT(Category) FROM SalesOrders;

-- GROUP BY - Total Sales per Category

-- Total sales for each category
SELECT 
    Category,
    SUM(Quantity * UnitPrice) AS Total_Sales
FROM SalesOrders
GROUP BY Category
ORDER BY Total_Sales DESC;

-- GROUP BY - Total Sales per Region

-- Total sales for each region
SELECT 
    Region,
    SUM(Quantity * UnitPrice) AS Total_Sales
FROM SalesOrders
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Definitions

-- CASE         : Works like IF/ELSE - checks conditions and returns a value
-- WHEN         : The condition to check inside CASE
-- THEN         : The value to return when the condition is true
-- ELSE         : The value to return when no condition is matched
-- END          : Closes the CASE statement
-- DISTINCT     : Returns only unique values, removes duplicate rows
-- *            : Multiplication operator used to calculate Total Sales
-- AS           : Renames a column or calculation result with an alias
-- GROUP BY     : Groups rows with the same value for aggregation
-- SUM()        : Calculates the total of a numeric column
-- ORDER BY     : Sorts the result set (DESC = highest to lowest)