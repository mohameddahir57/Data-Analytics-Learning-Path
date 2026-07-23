# SQL Course - Full Documentation
### Student: Mohamed | Jamhuriya University of Science and Technology
### Course: Structured Query Language (SQL)
---

## Course Overview

This course covers the fundamentals of SQL from database creation to advanced queries and real-world portfolio projects. All lessons were practiced using MySQL with real datasets.

---

## Course Structure

| Lesson | Topic | File |
|--------|-------|------|
| Lesson 1 | Database Basics - CREATE, INSERT, SELECT, UPDATE | SQL_Lesson_01_Basics.sql |
| Lesson 2 | Filtering - WHERE, LIKE, AND, OR, IN | SQL_Lesson_02_Filtering.sql |
| Lesson 3 | Sorting & Grouping - GROUP BY, ORDER BY | SQL_Lesson_03_GroupBy_OrderBy.sql |
| Day 3 | JOINS - INNER JOIN, PRIMARY KEY, FOREIGN KEY | SQL_Day_03_Joins_Basics.sql |
| Day 4 | Aggregate Functions with JOIN & GROUP BY | SQL_Day_04_Aggregates_Join.sql |
| Lesson 5 | Transformation - CASE, DISTINCT, Calculated Columns | SQL_Lesson_05_Transformation_CASE.sql |
| Project | Portfolio Project - Retail Sales KPI Analysis | SQL_Portfolio_Project_01_Somalia_Sales_Analysis.sql |

---

## Lesson 1 - Database Basics

### Topics Covered
- CREATE DATABASE
- USE
- CREATE TABLE
- INSERT INTO
- SELECT
- UPDATE

### Key Commands

```sql
-- Create a database
CREATE DATABASE Students;

-- Use a database
USE Students;

-- Create a table
CREATE TABLE student_info (
    STD_ID   INT PRIMARY KEY,
    STD_Name VARCHAR(40),
    Gender   VARCHAR(40),
    Marks    INT
);

-- Insert data
INSERT INTO student_info VALUES (1, 'Ahmed Hassan', 'Male', 85);

-- Select all
SELECT * FROM student_info;

-- Update a record
UPDATE student_info SET STD_Name = 'Mohamed Dahir' WHERE STD_ID = 1;
```

### Definitions
| Command | Definition |
|---------|-----------|
| CREATE DATABASE | Creates a new database |
| USE | Selects a database to work with |
| CREATE TABLE | Creates a new table with defined columns |
| INT | Data type for whole numbers |
| VARCHAR | Data type for text |
| PRIMARY KEY | Uniquely identifies each row |
| INSERT INTO | Adds new rows into a table |
| SELECT | Retrieves data from a table |
| UPDATE | Modifies existing data |

---

## 📗 Lesson 2 - Filtering

### Topics Covered
- WHERE
- LIKE
- AND
- OR
- IN
- DISTINCT

### Key Commands

```sql
-- WHERE basic filter
SELECT * FROM student_info WHERE STD_ID = 4;

-- LIKE pattern matching
SELECT * FROM student_info WHERE STD_Name LIKE 'Mohamed%';
SELECT * FROM student_info WHERE STD_Name LIKE '%Mohamed%';

-- OR condition
SELECT STD_ID, STD_Name FROM student_info
WHERE STD_ID = 4 OR STD_ID = 3;

-- AND condition
SELECT STD_ID, STD_Name FROM student_info
WHERE STD_ID = 4 AND Gender = 'Female';

-- IN condition
SELECT STD_ID, STD_Name FROM student_info
WHERE STD_ID IN (1, 2, 3, 4, 5);

-- Filter by gender
SELECT * FROM student_info WHERE Gender IN ('Male', 'Female');
```

### Definitions
| Command | Definition |
|---------|-----------|
| WHERE | Filters records based on a condition |
| LIKE | Searches for a pattern in a column |
| % | Wildcard - represents zero or more characters |
| AND | Both conditions must be true |
| OR | At least one condition must be true |
| IN | Matches any value in a list |
| DISTINCT | Returns only unique values |

---

## 📗 Lesson 3 - GROUP BY & ORDER BY

### Topics Covered
- ORDER BY (ASC, DESC)
- LIMIT
- GROUP BY
- Aggregate Functions (SUM, COUNT, MAX, MIN)

### Key Commands

```sql
-- ORDER BY ascending
SELECT Customer_Name, Quantity FROM sales_01 ORDER BY Quantity ASC;

-- ORDER BY descending
SELECT Customer_Name, Unit_Price FROM sales_01 ORDER BY Unit_Price DESC;

-- LIMIT first 3 rows
SELECT * FROM sales_01 LIMIT 3;

-- GROUP BY with SUM
SELECT Region, SUM(Net_Sales) AS Total_Sales
FROM sales_01
GROUP BY Region
ORDER BY Total_Sales DESC;

-- GROUP BY with COUNT
SELECT Payment_Status, COUNT(Net_Sales) AS total_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY total_sales DESC;

-- GROUP BY with MAX
SELECT Payment_Status, MAX(Net_Sales) AS highest_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY highest_sales DESC;

-- GROUP BY with MIN
SELECT Payment_Status, MIN(Net_Sales) AS lowest_sales
FROM sales_01
GROUP BY Payment_Status
ORDER BY lowest_sales ASC;
```

### Definitions
| Command | Definition |
|---------|-----------|
| ORDER BY | Sorts the result set by one or more columns |
| ASC | Ascending order - smallest to largest (default) |
| DESC | Descending order - largest to smallest |
| LIMIT | Restricts the number of rows returned |
| GROUP BY | Groups rows with the same value for aggregation |
| SUM() | Calculates the total of a numeric column |
| COUNT() | Counts the number of rows |
| MAX() | Returns the highest value in a column |
| MIN() | Returns the lowest value in a column |
| AS | Renames a column result with an alias |

---

## 📗 Day 3 & Day 4 - JOINS & Aggregate with JOIN

### Topics Covered
- INNER JOIN
- PRIMARY KEY & FOREIGN KEY
- JOIN with GROUP BY
- ROUND()

### Key Commands

```sql
-- INNER JOIN - two tables
SELECT
    c.CustomerID,
    c.Gender,
    f.NetSales
FROM dimcustomers c
JOIN factsales f
ON c.CustomerID = f.CustomerID;

-- JOIN - three tables
SELECT
    c.CustomerName,
    p.ProductName,
    f.NetSales
FROM factsales f
JOIN dimcustomers c ON f.CustomerID = c.CustomerID
JOIN dimproduct p   ON f.ProductID  = p.ProductID;

-- JOIN with GROUP BY and ROUND
SELECT
    c.Gender,
    ROUND(SUM(f.NetSales), 2) AS Total_Sales
FROM factsales f
JOIN dimcustomers c ON c.CustomerID = f.CustomerID
GROUP BY c.Gender
ORDER BY Total_Sales DESC;
```

### Definitions
| Command | Definition |
|---------|-----------|
| JOIN | Combines rows from two or more tables |
| INNER JOIN | Returns only matching rows from both tables |
| ON | Specifies the condition used to join tables |
| PRIMARY KEY | Uniquely identifies each row in its own table |
| FOREIGN KEY | References the Primary Key of another table |
| ROUND() | Rounds a number to specified decimal places |
| Alias (c,f,p) | Short name given to a table for easier reading |

---

## 📗 Lesson 5 - Transformation & CASE

### Topics Covered
- Calculated Columns (Quantity * UnitPrice)
- CASE Statement
- DISTINCT
- GROUP BY with Calculated Columns

### Key Commands

```sql
-- Calculated column
SELECT CustomerName, Product, Quantity * UnitPrice AS Total_Sales
FROM SalesOrders;

-- CASE statement
SELECT
    Product,
    Quantity * UnitPrice AS Total_Sales,
    CASE
        WHEN Quantity * UnitPrice >= 1000 THEN 'High_Sales'
        WHEN Quantity * UnitPrice > 600   THEN 'Intermediate_Sales'
        ELSE 'Low_Sales'
    END AS Category_Sales
FROM SalesOrders;

-- DISTINCT
SELECT DISTINCT(Category) FROM SalesOrders;

-- GROUP BY with calculated column
SELECT Category, SUM(Quantity * UnitPrice) AS Total_Sales
FROM SalesOrders
GROUP BY Category
ORDER BY Total_Sales DESC;
```

### Definitions
| Command | Definition |
|---------|-----------|
| CASE | Works like IF/ELSE - checks conditions and returns a value |
| WHEN | The condition to check inside CASE |
| THEN | The value to return when condition is true |
| ELSE | The value to return when no condition is matched |
| END | Closes the CASE statement |
| DISTINCT | Returns only unique values, removes duplicates |
| * | Multiplication operator for calculated columns |

---

## 📗 Portfolio Project - Retail Sales KPI Analysis

### Project Overview
A retail and ICT supply company in Somalia needed to understand sales performance across cities, regions, products, and sales channels.

### Database
- **Database:** somalia_sales_db
- **Table:** retail_sales
- **Records:** 100 orders
- **Cities:** Mogadishu, Kismayo, Garowe, Baidoa, Bosaso, Hargeisa, Borama, Galkayo

### Formulas Used
| Metric | Formula |
|--------|---------|
| Revenue | quantity * unit_price_usd |
| Cost | quantity * unit_cost_usd |
| Profit | Revenue - Cost |

### KPI Queries
| KPI | Description |
|-----|-------------|
| KPI 1 | Total Orders |
| KPI 2 | Total Revenue |
| KPI 3 | Total Cost |
| KPI 4 | Total Profit |
| KPI 5 | Profit Margin Percentage |
| KPI 6 | Average Order Value |
| KPI 7 | Delivery Rate |
| KPI 8 | Return Rate |

### Analysis Queries
| Query | Description |
|-------|-------------|
| 1 | Revenue by Product Category |
| 2 | Profit by Product Category |
| 3 | Revenue by Region |
| 4 | Number of Orders by City |
| 5 | Revenue by Sales Channel |
| 6 | Profit by Sales Channel |

---

## 🏆 Skills Gained

- Creating and managing databases and tables
- Inserting, selecting, updating data
- Filtering data with WHERE, LIKE, AND, OR, IN
- Sorting with ORDER BY and limiting with LIMIT
- Grouping with GROUP BY and aggregate functions
- Joining multiple tables with INNER JOIN
- Transforming data with CASE statements
- Calculating KPIs for business reporting
- Real-world portfolio project experience

---

*SQL Course Completed | Jamhuriya University of Science and Technology | Mogadishu, Somalia*
