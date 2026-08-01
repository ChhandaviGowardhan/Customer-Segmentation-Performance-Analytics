-- Data Overview
-- Total Sales Records
SELECT COUNT(*) AS TotalSalesRecords
FROM sales;

-- Total Customers
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM sales;

-- Total Orders
SELECT COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM sales;

-- Total Products
SELECT COUNT(DISTINCT StockCode) AS TotalProducts
FROM sales;

-- Countries Served
SELECT COUNT(DISTINCT Country) AS TotalCountries
FROM sales;

-- SALES PERFORMANCE
-- Total Revenue
SELECT
    ROUND(SUM(TotalAmount),2) AS TotalRevenue
FROM sales;

-- Average Order Value
SELECT
    ROUND(AVG(TotalAmount),2) AS AverageOrderValue
FROM sales;

-- Highest Single Transaction
SELECT *
FROM sales
ORDER BY TotalAmount DESC
LIMIT 10;

-- Lowest Transaction
SELECT *
FROM sales
ORDER BY TotalAmount
LIMIT 10;

-- 3. CUSTOMER ANALYSIS
-- Top 10 Customers by Revenue
SELECT
    CustomerID,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM sales
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

-- Customers with the Highest Number of Orders
SELECT
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS Orders
FROM sales
GROUP BY CustomerID
ORDER BY Orders DESC
LIMIT 10;

-- Average Spending per Customer
SELECT
    CustomerID,
    ROUND(AVG(TotalAmount),2) AS AveragePurchase
FROM sales
GROUP BY CustomerID
ORDER BY AveragePurchase DESC
LIMIT 10;

-- 4. PRODUCT ANALYSIS
-- Top Selling Products
SELECT
    Description,
    SUM(Quantity) AS UnitsSold
FROM sales
GROUP BY Description
ORDER BY UnitsSold DESC
LIMIT 10;

-- Highest Revenue Products
SELECT
    Description,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM sales
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;

-- Most Frequently Purchased Products
SELECT
    Description,
    COUNT(*) AS TimesPurchased
FROM sales
GROUP BY Description
ORDER BY TimesPurchased DESC
LIMIT 10;

-- 5. COUNTRY ANALYSIS
-- Revenue by Country
SELECT
    Country,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM sales
GROUP BY Country
ORDER BY Revenue DESC;

-- Customers by Country
SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS Customers
FROM sales
GROUP BY Country
ORDER BY Customers DESC;

-- Orders by Country
SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS Orders
FROM sales
GROUP BY Country
ORDER BY Orders DESC;

-- 6. MONTHLY SALES ANALYSIS
-- Monthly Revenue Trend
SELECT
    DATE_FORMAT(InvoiceDate,'%Y-%m') AS Month,
    ROUND(SUM(TotalAmount),2) AS Revenue
FROM sales
GROUP BY Month
ORDER BY Month;

-- Monthly Orders
SELECT
    DATE_FORMAT(InvoiceDate,'%Y-%m') AS Month,
    COUNT(DISTINCT InvoiceNo) AS Orders
FROM sales
GROUP BY Month
ORDER BY Month;

-- 7. RFM ANALYSIS
-- Average RFM Metrics
SELECT
    ROUND(AVG(Recency),2) AS AvgRecency,
    ROUND(AVG(Frequency),2) AS AvgFrequency,
    ROUND(AVG(Monetary),2) AS AvgMonetary
FROM customer_rfm;

-- Highest Monetary Customers
SELECT *
FROM customer_rfm
ORDER BY Monetary DESC
LIMIT 10;

-- Most Frequent Customers
SELECT *
FROM customer_rfm
ORDER BY Frequency DESC
LIMIT 10;

-- Least Recent Customers
SELECT *
FROM customer_rfm
ORDER BY Recency DESC
LIMIT 10;

-- 8. CUSTOMER SEGMENT ANALYSIS
-- Customer Distribution
SELECT
    Segment,
    COUNT(*) AS Customers
FROM customer_segments
GROUP BY Segment;

-- Segment Profile
SELECT
    Segment,
    COUNT(*) AS Customers,
    ROUND(AVG(Recency),2) AS AvgRecency,
    ROUND(AVG(Frequency),2) AS AvgFrequency,
    ROUND(AVG(Monetary),2) AS AvgMonetary,
    ROUND(AVG(TotalQuantity),2) AS AvgQuantity
FROM customer_segments
GROUP BY Segment
ORDER BY AvgMonetary DESC;

-- 9. SEGMENT-WISE REVENUE
-- Revenue Contribution by Segment
SELECT
    cs.Segment,
    ROUND(SUM(s.TotalAmount),2) AS Revenue
FROM sales s
JOIN customer_segments cs
ON s.CustomerID = cs.CustomerID
GROUP BY cs.Segment
ORDER BY Revenue DESC;

-- Customers per Segment
SELECT
    Segment,
    COUNT(*) AS Customers
FROM customer_segments
GROUP BY Segment;

-- 10. PREMIUM CUSTOMER ANALYSIS

-- Top Premium Customers
SELECT
    CustomerID,
    Monetary,
    Frequency
FROM customer_segments
WHERE Segment='Premium Customers'
ORDER BY Monetary DESC
LIMIT 10;

-- 11. AT-RISK CUSTOMER ANALYSIS
-- At-Risk Customers
SELECT
    CustomerID,
    Recency,
    Monetary
FROM customer_segments
WHERE Segment='At-Risk Customers'
ORDER BY Recency DESC;