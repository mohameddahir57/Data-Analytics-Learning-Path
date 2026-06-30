-- SQL Lesson 03 - GROUP BY & ORDER BY

-- Switch to Student02 database
USE Student02;

-- Verify the imported data is in the table
SELECT * FROM sales_01;

-- Retrieve the first 3 rows using LIMIT
SELECT * FROM sales_01 LIMIT 3;

-- Select customer name and unit price, ordered by unit price (ascending)
SELECT 
    Customer_Name,
    Unit_Price 
FROM sales_01 
ORDER BY Unit_Price;

-- Select customer name and unit price, ordered by unit price descending
SELECT 
    Customer_Name,
    Unit_Price 
FROM sales_01 
ORDER BY Unit_Price DESC;

-- Select customer name and quantity, ordered by quantity in ascending order
SELECT 
    Customer_Name,
    Quantity 
FROM sales_01 
ORDER BY Quantity;

-- Group by Region with total net sales, ordered highest to lowest
SELECT 
    Region,
    SUM(Net_Sales) AS Total_Sales
FROM sales_01
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Total transactions (count of net sales) for each payment status, ordered highest to lowest
SELECT 
    Payment_Status,
    COUNT(Net_Sales) AS total_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY total_sales DESC;

-- Highest net sales for each payment status, ordered highest to lowest
SELECT 
    Payment_Status,
    MAX(Net_Sales) AS highest_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY highest_sales DESC;

-- Lowest net sales for each payment status, ordered lowest to highest
SELECT 
    Payment_Status,
    MIN(Net_Sales) AS lowest_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY lowest_sales ASC;

-- Definitions
-- ORDER BY : Sorts the result set by one or more columns
-- ASC      : Ascending order (smallest to largest) - default
-- DESC     : Descending order (largest to smallest)
-- LIMIT    : Restricts the number of rows returned
-- GROUP BY : Groups rows that have the same values in specified columns
-- SUM()    : Calculates the total of a numeric column
-- COUNT()  : Counts the number of rows
-- MAX()    : Returns the highest value in a column
-- MIN()    : Returns the lowest value in a column
-- AS       : Renames a column or result with an alias