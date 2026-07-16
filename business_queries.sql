CREATE DATABASE quick_commerce_analysis;
USE quick_commerce_analysis;
select * from quick_commerce;


-- ==========================================================
-- SECTION 1 : BUSINESS OVERVIEW
-- ==========================================================

-- Query 1: Total Number of Orders
SELECT COUNT(*) AS Total_Orders
FROM quick_commerce;

-- ----------------------------------------------------------

-- Query 2: Total Revenue
SELECT SUM(Order_Value) AS Total_Revenue
FROM quick_commerce;

-- ----------------------------------------------------------

-- Query 3: Average Order Value
SELECT ROUND(AVG(Order_Value),2) AS Average_Order_Value
FROM quick_commerce;

-- ----------------------------------------------------------

-- Query 4: Number of Companies
SELECT COUNT(DISTINCT Company) AS Total_Companies
FROM quick_commerce;

-- ----------------------------------------------------------

-- Query 5: Number of Cities
SELECT COUNT(DISTINCT City) AS Total_Cities
FROM quick_commerce;

-- ----------------------------------------------------------

-- Query 6: Number of Product Categories
SELECT COUNT(DISTINCT Product_Category) AS Total_Product_Categories
FROM quick_commerce;


-- ==========================================================
-- SECTION 2 : COMPANY PERFORMANCE
-- ==========================================================

-- Query 7: Revenue by Company
SELECT
    Company,
    SUM(Order_Value) AS Revenue
FROM quick_commerce
GROUP BY Company
ORDER BY Revenue DESC;

-- ----------------------------------------------------------

-- Query 8: Orders by Company
SELECT
    Company,
    COUNT(Order_ID) AS Total_Orders
FROM quick_commerce
GROUP BY Company
ORDER BY Total_Orders DESC;

-- ----------------------------------------------------------

-- Query 9: Average Order Value by Company
SELECT
    Company,
    ROUND(AVG(Order_Value),2) AS Average_Order_Value
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Order_Value DESC;

-- ----------------------------------------------------------

-- Query 10: Average Customer Rating by Company
SELECT
    Company,
    ROUND(AVG(Customer_Rating),2) AS Average_Customer_Rating
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Customer_Rating DESC;

-- ----------------------------------------------------------

-- Query 11: Average Delivery Time by Company
SELECT
    Company,
    ROUND(AVG(Delivery_Time_Min),2) AS Average_Delivery_Time
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Delivery_Time;

-- ----------------------------------------------------------

-- Query 12: Average Delivery Partner Rating
SELECT
    Company,
    ROUND(AVG(Delivery_Partner_Rating),2) AS Average_Delivery_Partner_Rating
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Delivery_Partner_Rating DESC;

-- ----------------------------------------------------------

-- Query 13: Average Items per Order
SELECT
    Company,
    ROUND(AVG(Items_Count),2) AS Average_Items
FROM quick_commerce
GROUP BY Company;

-- ==========================================================
-- SECTION 3 : CUSTOMER ANALYSIS
-- ==========================================================

-- Query 14: Orders by Age Group
SELECT
CASE
WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END AS Age_Group,
COUNT(*) AS Total_Orders
FROM quick_commerce
GROUP BY Age_Group
ORDER BY Total_Orders DESC;

-- ----------------------------------------------------------

-- Query 15: Revenue by Age Group
SELECT
CASE
WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END AS Age_Group,
SUM(Order_Value) AS Revenue
FROM quick_commerce
GROUP BY Age_Group
ORDER BY Revenue DESC;

-- ----------------------------------------------------------

-- Query 16: Preferred Payment Method
SELECT
Payment_Method,
COUNT(*) AS Orders
FROM quick_commerce
GROUP BY Payment_Method
ORDER BY Orders DESC;

-- ----------------------------------------------------------

-- Query 17: Product Category Distribution
SELECT
Product_Category,
COUNT(*) AS Orders
FROM quick_commerce
GROUP BY Product_Category
ORDER BY Orders DESC;

-- ----------------------------------------------------------

-- Query 18: Average Rating by Payment Method
SELECT
Payment_Method,
ROUND(AVG(Customer_Rating),2) AS Average_Rating
FROM quick_commerce
GROUP BY Payment_Method
ORDER BY Average_Rating DESC;


-- ==========================================================
-- SECTION 4 : DELIVERY ANALYSIS
-- ==========================================================

-- Query 19: Average Delivery Time by City
SELECT
City,
ROUND(AVG(Delivery_Time_Min),2) AS Average_Delivery_Time
FROM quick_commerce
GROUP BY City
ORDER BY Average_Delivery_Time;

-- ----------------------------------------------------------

-- Query 20: Fastest Company
SELECT
Company,
ROUND(AVG(Delivery_Time_Min),2) AS Average_Delivery_Time
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Delivery_Time
LIMIT 1;

-- ----------------------------------------------------------

-- Query 21: Slowest Company
SELECT
Company,
ROUND(AVG(Delivery_Time_Min),2) AS Average_Delivery_Time
FROM quick_commerce
GROUP BY Company
ORDER BY Average_Delivery_Time DESC
LIMIT 1;

-- ----------------------------------------------------------

-- Query 22: Average Distance by Company
SELECT
Company,
ROUND(AVG(Distance_Km),2) AS Average_Distance
FROM quick_commerce
GROUP BY Company;

-- ----------------------------------------------------------

-- Query 23: Delivery Partner Rating by Company
SELECT
Company,
ROUND(AVG(Delivery_Partner_Rating),2) AS Delivery_Partner_Rating
FROM quick_commerce
GROUP BY Company;

-- ==========================================================
-- SECTION 5 : PRODUCT ANALYSIS
-- ==========================================================

-- Query 24: Revenue by Product Category
SELECT
Product_Category,
SUM(Order_Value) AS Revenue
FROM quick_commerce
GROUP BY Product_Category
ORDER BY Revenue DESC;

-- ----------------------------------------------------------

-- Query 25: Average Discount by Category
SELECT
Product_Category,
ROUND(AVG(Discount_Applied),2) AS Average_Discount
FROM quick_commerce
GROUP BY Product_Category
ORDER BY Average_Discount DESC;

-- ----------------------------------------------------------

-- Query 26: Highest Rated Categories
SELECT
Product_Category,
ROUND(AVG(Customer_Rating),2) AS Average_Rating
FROM quick_commerce
GROUP BY Product_Category
ORDER BY Average_Rating DESC;


-- ==========================================================
-- SECTION 6 : ADVANCED SQL
-- ==========================================================

-- Query 27: Rank Companies by Revenue
SELECT
Company,
SUM(Order_Value) AS Revenue,
RANK() OVER(ORDER BY SUM(Order_Value) DESC) AS Revenue_Rank
FROM quick_commerce
GROUP BY Company;

-- ----------------------------------------------------------

-- Query 28: Top 5 Cities by Revenue
SELECT
City,
SUM(Order_Value) AS Revenue
FROM quick_commerce
GROUP BY City
ORDER BY Revenue DESC
LIMIT 5;

-- ----------------------------------------------------------

-- Query 29: Revenue Contribution Percentage
SELECT
Company,
SUM(Order_Value) AS Revenue,
ROUND(
SUM(Order_Value)*100/
(SELECT SUM(Order_Value) FROM quick_commerce),2
) AS Revenue_Percentage
FROM quick_commerce
GROUP BY Company;

-- ----------------------------------------------------------

-- Query 30: Companies Above Average Customer Rating
SELECT
Company,
ROUND(AVG(Customer_Rating),2) AS Average_Rating
FROM quick_commerce
GROUP BY Company
HAVING AVG(Customer_Rating) >
(
SELECT AVG(Customer_Rating)
FROM quick_commerce
);

-- ==========================================================
-- END OF SQL ANALYSIS
-- ==========================================================

