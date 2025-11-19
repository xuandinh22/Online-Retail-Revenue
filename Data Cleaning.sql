﻿/*================================================
Online Retail Revenue
Data Cleaning & Preparation
Run date: 11/6/2025
================================================*/



-- View all dataset
SELECT  *
FROM [Online Retail]
;

-- The total number of customers
SELECT
    Count(Distinct CustomerID) AS NumCustomer
FROM [Online Retail]
;

-- Total Revenue
SELECT
    SUM(Revenue)
FROM [Online Retail]
;

-- Total Quantity Sold
SELECT
    SUM(Quantity)
FROM [Online Retail]
;

-- Change type of InvoiceNo, StockCode from number to string.
ALTER TABLE [Online Retail]
ALTER COLUMN InvoiceNo VARCHAR (20)
;
ALTER TABLE [Online Retail]
ALTER COLUMN StockCode VARCHAR (20)
;

-- Check data type
sp_help 'Online Retail';

-- Check inconsistent value
SELECT DISTINCT Description, StockCode
FROM [Online Retail]
WHERE Description = 'MANUAL'
;
SELECT DISTINCT Description, StockCode
FROM [Online Retail]
WHERE StockCode = '22197'
;
SELECT DISTINCT Description, StockCode
FROM [Online Retail]
WHERE StockCode = '85123A'
;

-- Correct a single inconsistent entry: .
-- StockCode = 'm' (Description = 'MANUAL') should be uppercase 'M', so standardize all StockCode values to uppercase.
UPDATE [Online Retail]
SET StockCode = UPPER(StockCode)
;
-- StockCode = '22197', Description should be 'POPCORN HOLDER' instead of 'SMALL POPCORN HOLDER'
-- Standardize Description to 'POPCORN HOLDER' for StockCode '22197'
UPDATE [Online Retail]
SET Description  = 'POPCORN HOLDER'
WHERE StockCode = '22197'
;
-- StockCode = '85123A', Description should be 'HANGING HEART T-LIGHT HOLDER' instead of 
-- 'WHITE HANGING HEART T-LIGHT HOLDER', 'CREAM HANGING HEART T-LIGHT HOLDER' or '?'
-- Standardize Description to 'POPCORN HOLDER' for StockCode '85123A'
UPDATE [Online Retail]
SET Description  = 'HANGING HEART T-LIGHT HOLDER'
WHERE StockCode = '85123A'
;

-- Calculate the percentage of Quantity values are negative
-- Less than 2%
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(CASE WHEN Quantity < 0 THEN 1 END) AS Negative_Rows,
    ROUND(
        COUNT(CASE WHEN Quantity < 0 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Negative_Percentage
FROM [Online Retail]
;

-- Calculate the percentage of Quantity values are negative
-- Less than 0.1%
SELECT 
    COUNT(*) AS Total_Rows,
    COUNT(CASE WHEN UnitPrice < 0 THEN 1 END) AS Negative_Rows,
    ROUND(
        COUNT(CASE WHEN UnitPrice < 0 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS Negative_Percentage
FROM [Online Retail]
;

-- Permanently delete rows with Quantity < 0 or UnitPrice < 0
DELETE FROM [Online Retail]
WHERE Quantity < 0 OR UnitPrice < 0
;

-- Check the result
SELECT *
FROM [Online Retail]
ORDER BY Quantity
;

SELECT *
FROM [Online Retail]
ORDER BY UnitPrice
;

-- Add Revenue Column
ALTER TABLE [Online Retail]
ADD Revenue DECIMAL (18,2);

-- Fill Revenue Column 
UPDATE [Online Retail]
SET Revenue = Quantity * UnitPrice