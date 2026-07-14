
-- Lesson 4 Aggregate Functions with GROUP BY & JOIN

USE join_table;

-- Understanding the Topic

-- Aggregate functions work with GROUP BY using text columns
-- Examples of text columns: Region, Gender, Status

-- VIEW ALL TABLES

-- View all sales
SELECT * FROM factsales;

-- View all customers
SELECT * FROM dimcustomers;

-- Total Sales by Gender (using NetSales)

-- Total net sales grouped by gender, rounded to 2 decimal places
SELECT
    c.Gender,
    ROUND(SUM(f.NetSales), 2) AS Total_Sales
FROM factsales f
JOIN dimcustomers c
ON c.CustomerID = f.CustomerID
GROUP BY c.Gender
ORDER BY Total_Sales DESC;

-- Total Sales by Gender (using Quantity * UnitPrice)

-- Total sales calculated as Quantity x UnitPrice, grouped by gender
SELECT 
    c.Gender,
    SUM(f.Quantity * f.UnitPrice) AS Total_Sales
FROM factsales f
JOIN dimcustomers c
ON f.CustomerID = c.CustomerID
GROUP BY c.Gender
ORDER BY Total_Sales DESC;

-- Definitions

-- JOIN      : Combines rows from two tables based on a related column
-- GROUP BY  : Groups rows with the same value for aggregation
-- SUM()     : Calculates the total of a numeric column
-- ROUND()   : Rounds a number to a specified number of decimal places
-- ORDER BY  : Sorts the result (DESC = highest to lowest)
-- *         : Multiplication operator used to calculate Total Sales
-- Alias(c,f): A short name given to a table to make queries easier to read