﻿/*================================================
Online Retail Revenue
Business-Focused Analytical Queries
Run date: 11/7/2025
================================================*/

-- Product performance
-- Product Revenue and Quantity Summary
SELECT 
    StockCode,
    Description,
    SUM(Revenue) AS TotalRevenue,
    SUM(Quantity) AS TotalQty
FROM [Online Retail]
WHERE CustomerID IS NOT NULL
GROUP BY StockCode, Description
ORDER BY TotalQty DESC
;

-- Product 23843 performance
-- One high-quantity order of this product was placed in Dec by Customer 16446
SELECT 
    StockCode,
    Quantity,
    InvoiceDate,
    InvoiceNo,
    CustomerID
FROM [Online Retail]
WHERE CustomerID IS NOT NULL AND StockCode = '23843'
ORDER BY Quantity DESC
;

-- Product 23166 performance
-- A remarkable large quantity of this product was ordered on Jan by Customer 12346
SELECT 
    StockCode,
    Quantity,
    InvoiceDate,
    InvoiceNo,
    CustomerID
FROM [Online Retail]
WHERE CustomerID IS NOT NULL AND StockCode = '23166'
ORDER BY Quantity DESC
;

-- Product 22197, 84077, 85099B performance
-- Sales are distributed across many different customers, rather than concentrated in one or two high-volume buyers.
SELECT 
    StockCode,
    Quantity,
    InvoiceDate,
    InvoiceNo,
    CustomerID
FROM [Online Retail]
WHERE CustomerID IS NOT NULL AND StockCode = '22197' -- StockCode = 84077, 85099B
ORDER BY Quantity DESC
;

-- Check customers 23843 and 23166 geohraphic
SELECT DISTINCT CustomerID, Country
FROM [Online Retail]
WHERE CustomerID IN ('16446', '12346');

 /* What is the monthly trend of revenue, which months have faced the biggest increase/decrease? */
-- Min/Max Revenue in 2011
-- Min: Feb, Max: Nov 
SELECT
   MONTH(InvoiceDate) As Month,
   DATENAME(MONTH, InvoiceDate) AS MonthName,
   SUM(Revenue) AS TotalRevenue
FROM [Online Retail]
WHERE YEAR(InvoiceDate) = '2011'
GROUP BY MONTH(InvoiceDate), DATENAME(MONTH, InvoiceDate)
ORDER BY TotalRevenue DESC

/* Which regions are generating the highest revenue, and which region are generating the lowest? */
-- Top 10 Countries by Revenue
SELECT TOP 10
    Country,
    SUM(Revenue) AS TotalRevenue,
    SUM(Quantity) AS TotalQuantity
FROM [Online Retail]
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- Bottom 10 Countries by Revenue
SELECT TOP 10
    Country,
    SUM(Revenue) AS TotalRevenue,
    SUM(Quantity) AS TotalQuantity
FROM [Online Retail]
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY TotalRevenue ASC;

-- Demand by Country
SELECT
    Country,
    SUM(Quantity) AS QuantitySold
FROM [Online Retail]
WHERE Country <> 'United Kingdom'
GROUP BY Country
ORDER BY QuantitySold DESC
;

/* Who are the top customers and how much do they contribute to the total revenue? 
Is the business dependent on these customers or is the customer base diversified? */
-- Top 10 Customers by Revenue
WITH customer_revenue AS (
    SELECT
        CustomerID,
        SUM(Revenue) AS TotalRevenue,
        Country
    FROM [Online Retail]
    WHERE CustomerId IS NOT NULL
    GROUP BY CustomerID, Country
    
),
Pct AS (
    SELECT
        CustomerID,
        TotalRevenue,
        TotalRevenue * 100.0 / SUM(TotalRevenue) OVER() AS RevenuePct,
        Country
    FROM customer_revenue
)
SELECT
    TOP 10
    CustomerID,
    TotalRevenue,
    RevenuePct,
    Country
FROM Pct
ORDER BY TotalRevenue Desc;

-- Check if these top customers not only place more orders but also 
-- tend to purchase higher-value items or larger quantities.
SELECT 
    CustomerID,
    SUM(Quantity) AS TotalQty,
    Country
FROM [Online Retail]
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country
ORDER BY TotalQty DESC
;
SELECT 
    CustomerID,
    COUNT(InvoiceNo) AS TotalOrder,
    Country
FROM [Online Retail]
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country
ORDER BY TotalOrder DESC
;
SELECT 
    CustomerID,
    SUM(Revenue) AS TotalRev,
    Country
FROM [Online Retail]
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID, Country
ORDER BY TotalRev DESC

-- Count the number of customer reside in each country
-- Check where are CustomerID 14646 and 18102 reside in
SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS CustomerNo
FROM [Online Retail]
GROUP BY Country
ORDER BY CustomerNo DESC
;

-- The total number of customers make up 80% of revenue
-- Step 1: Aggregate revenue per customer
WITH customer_revenue AS (
    SELECT
        CustomerID,
        SUM(Revenue) AS TotalRevenue
    FROM [Online Retail]
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
),
-- Step 2: Compute cumulative revenue and percentage
cumulative AS (
    SELECT
        CustomerID,
        TotalRevenue,
        SUM(TotalRevenue) OVER (ORDER BY TotalRevenue DESC) AS CumRevenue,
        SUM(TotalRevenue) OVER () AS TotalRevenueAll,
        SUM(TotalRevenue) OVER (ORDER BY TotalRevenue DESC) * 100.0 / 
            SUM(TotalRevenue) OVER () AS CumPct
    FROM customer_revenue
),
-- Step 3: Find the minimum cumulative percentage that reaches or exceeds 80%
threshold AS (
    SELECT MIN(CumPct) AS Threshold80Pct
    FROM cumulative
    WHERE CumPct >= 80
)
-- Step 4: Count customers needed to reach 80%
SELECT
    COUNT(*) AS NumCustomer_80_20,
    COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT CustomerID) 
                        FROM [Online Retail] 
                        WHERE CustomerID IS NOT NULL) AS CustomerPctRepresent
FROM ranked
CROSS JOIN threshold
WHERE CumPct <= Threshold80Pct
;


/* What is the percentage of customers who are repeating their orders? */
-- Calcuate the number of RepeatCustomers
SELECT COUNT(*) AS RepeatCustomerCount
FROM (
    SELECT CustomerID
    FROM [Online Retail]
	WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
    HAVING COUNT(DISTINCT CAST(InvoiceDate AS DATE)) > 1
) AS RepeatCustomers
;

-- Calculate the percentage of RepeatCustomers
SELECT 
    ROUND(100.0 * SUM(CASE WHEN PurchaseDays > 1 THEN 1 ELSE 0 END)
        / COUNT(*), 2) AS RepeatCustomerPercentage
FROM (
    SELECT 
        CustomerID,
        COUNT(DISTINCT CAST(InvoiceDate AS DATE)) AS PurchaseDays
    FROM [Online Retail]
	WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
) AS PctRepeatCustomers
;

/* Further questions for the future:
- For the repeat customers, are they ordering the same products or different?
- For the repeat customers, how long does it take for them  to place the next order after being delivered the previous one? 
- What revenue is being generated from the customers who have ordered more than once?
- Who are the customers that have repeated the most? How much are they contributing to revenue? */