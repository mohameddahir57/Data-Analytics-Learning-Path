CREATE DATABASE Project_One;
USE Project_One;

SELECT * FROM retail_sales;


-- KPI 1: Total Orders
-- Counts all customer orders in the dataset.
SELECT
    COUNT(*) AS total_orders
FROM retail_sales;

-- KPI 2: Total Revenue
-- Calculates total sales value before cost.
SELECT
    ROUND(SUM(quantity * unit_price_usd), 2) AS total_revenue
FROM retail_sales;

-- KPI 3: Total Cost
-- Calculates the total cost of all products sold.
SELECT
    ROUND(SUM(quantity * unit_cost_usd), 2) AS total_cost
FROM retail_sales;

-- KPI 4: Total Profit
-- Calculates total revenue minus total cost.
SELECT
    ROUND(
        SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd),
        2
    ) AS total_profit
FROM retail_sales;

-- KPI 5: Profit Margin Percentage
-- Shows the percentage of revenue kept as profit.
SELECT
    ROUND(
        (
            SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd)
        ) / SUM(quantity * unit_price_usd) * 100,
        2
    ) AS profit_margin_percentage
FROM retail_sales;

-- KPI 6: Average Order Value
-- Shows average sales value per order.
SELECT
    ROUND(AVG(quantity * unit_price_usd), 2) AS average_order_value
FROM retail_sales;

-- KPI 7: Delivery Rate
-- Shows the percentage of orders successfully delivered.
SELECT
    ROUND(
        SUM(CASE WHEN delivery_status = 'Delivered' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS delivery_rate_percentage
FROM retail_sales;

-- KPI 8: Return Rate
-- Shows the percentage of orders returned by customers.
SELECT
    ROUND(
        SUM(CASE WHEN delivery_status = 'Returned' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS return_rate_percentage
FROM retail_sales;



-- 1. Revenue by Product Category
-- Finds which product category produces the highest sales.
SELECT
    product_category,
    ROUND(SUM(quantity * unit_price_usd), 2) AS total_revenue
FROM retail_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- 2. Profit by Product Category
-- Finds which category gives the highest profit.
SELECT
    product_category,
    ROUND(
        SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd),
        2
    ) AS total_profit
FROM retail_sales
GROUP BY product_category
ORDER BY total_profit DESC;

-- 3. Revenue by Region
-- Shows the best performing region by revenue.
SELECT
    region,
    ROUND(SUM(quantity * unit_price_usd), 2) AS total_revenue
FROM retail_sales
GROUP BY region
ORDER BY total_revenue DESC;

-- 4. Number of Orders by City
-- Shows which city has the highest number of orders.
SELECT
    city,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY city
ORDER BY total_orders DESC;

-- 5. Revenue by Sales Channel
-- Compares sales performance across each sales channel.
SELECT
    sales_channel,
    ROUND(SUM(quantity * unit_price_usd), 2) AS total_revenue
FROM retail_sales
GROUP BY sales_channel
ORDER BY total_revenue DESC;

-- 6. Profit by Sales Channel
-- Compares profit performance across each sales channel.
SELECT
    sales_channel,
    ROUND(
        SUM(quantity * unit_price_usd) - SUM(quantity * unit_cost_usd),
        2
    ) AS total_profit
FROM retail_sales
GROUP BY sales_channel
ORDER BY total_profit DESC;

-- 7. Findings (Natiijooyinka)
-- Total Orders             : 100
-- Total Revenue             : $29,907.00
-- Total Cost                : $16,411.40
-- Total Profit               : $13,495.60
-- Profit Margin              : 45.13%
-- Average Order Value        : $299.07
-- Delivery Rate               : 73%
-- Return Rate                 : 5%
--
-- Revenue by Category    : Electronics ($12,181) ayaa ugu sarreeya, kadib Furniture ($7,110), Software ($6,960)
-- Profit by Category      : Software ($4,555) ayaa ugu badan faa'iidada, in kasta oo Electronics uu leeyahay revenue ugu badan
-- Revenue by Region        : South ($8,192) ayaa u horeeya, kadib West ($6,848)
-- Orders by City            : Mogadishu iyo Borama labaduba 15 order midkiiba
-- Revenue by Channel     : Online ($10,472) ayaa ugu badan, kadib Retail Store ($7,381)
-- Profit by Channel        : Online ($4,331) ayaa sidoo kale ugu badan faa'iidada
 
-- 8. Notes (Fiirooyin)
-- 1. Discount_pct column-ka waa la eegi karaa laakiin lama isticmaalin xisaabinta
--    profit-ka, sida ku cad dokumentiga (simple formulas).
-- 2. delivery_days iyo customer_rating way madhan yihiin (NULL) marka
--    delivery_status uu yahay 'Pending' ama 'Cancelled' - taasi waa macquul, maadaama
--    dalabkaasi aan weli la gaarsiin ama la joojiyay.
-- 3. Electronics wuxuu leeyahay revenue ugu badan laakiin margin-kiisa hooseeya
--    marka la barbardhigo Software, taas oo tilmaamaysa in Software ay tahay
--    category-ga faa'iidada ugu badan soo saara halkii la joogo.
-- 4. Online iyo Corporate Sales ayaa ka sarreeya WhatsApp channel-ka labadaba
--    revenue iyo profit ahaan, in kasta oo WhatsApp ay leedahay tirada labaad
--    ee orders-ka.
