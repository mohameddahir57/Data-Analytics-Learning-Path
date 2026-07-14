-- Lesson 3 Joins Basics (DimCustomers & FactSales)

USE join_table;

-- Understanding Keys Before Joining

-- PRIMARY KEY : Unique identifier in its own table
--   DimCustomers -> CustomerID (Primary Key)
--   DimProduct   -> ProductID  (Primary Key)

-- FOREIGN KEY : A column that references a Primary Key in another table
--   FactSales   -> CustomerID (Foreign Key -> DimCustomers)
--   FactSales   -> ProductID  (Foreign Key -> DimProduct)

-- VIEW ALL TABLES

-- View all customers
SELECT * FROM dimcustomers;

-- View all products
SELECT * FROM dimproduct;

-- View all sales
SELECT * FROM factsales;

-- INNER JOIN - DimCustomers & FactSales

-- Join customers and sales using CustomerID
SELECT 
    c.CustomerID,
    c.Gender,
    f.NetSales
FROM dimcustomers c
JOIN factsales f
ON c.CustomerID = f.CustomerID;

-- Definitions

-- JOIN        : Combines rows from two or more tables based on a related column
-- INNER JOIN  : Returns only matching rows from both tables
-- ON          : Specifies the condition used to join the tables
-- PRIMARY KEY : A column that uniquely identifies each row in its own table
-- FOREIGN KEY : A column that references the Primary Key of another table
-- Alias (c,f) : A short name given to a table to make queries easier to read
