USE Zepto_SQL_project;
GO



-- 1. View first 10 records
SELECT TOP 10 *
FROM dbo.zepto3;
GO

-- 2. Check NULL values
SELECT *
FROM dbo.zepto3
WHERE Category IS NULL
   OR name IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;
GO

-- 3. Different product categories
SELECT DISTINCT Category
FROM dbo.zepto3
ORDER BY Category;
GO

-- 4. Products in stock vs out of stock
SELECT outOfStock, COUNT(*) AS product_count
FROM dbo.zepto3
GROUP BY outOfStock;
GO

-- 5. Product names appearing multiple times
SELECT name, COUNT(*) AS NumberOfProducts
FROM dbo.zepto3
GROUP BY name
HAVING COUNT(*) > 1
ORDER BY NumberOfProducts DESC;
GO

-- 6. Check products with zero prices
SELECT *
FROM dbo.zepto3
WHERE mrp = 0
   OR discountedSellingPrice = 0;
GO

-- 7. Delete products with zero MRP
-- Run only if you have decided these rows should be removed.
-- DELETE FROM dbo.zepto3
-- WHERE mrp = 0;
-- GO

-- 8. Display prices in rupees
-- Your screenshot already shows decimal prices.
SELECT mrp, discountedSellingPrice
FROM dbo.zepto3;
GO

-- DATA ANALYSIS

-- Q1. Top 10 best-value products by discount percentage
SELECT *
FROM (
    SELECT DISTINCT name, mrp, discountPercent
    FROM dbo.zepto3
) AS products
ORDER BY discountPercent DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Q2. Products with high MRP that are out of stock
SELECT DISTINCT name, mrp
FROM dbo.zepto3
WHERE outOfStock = 1
  AND mrp > 300
ORDER BY mrp DESC;
GO

-- Q3. Estimated revenue for each category
SELECT Category,
       SUM(discountedSellingPrice * availableQuantity)
           AS total_revenue
FROM dbo.zepto3
GROUP BY Category
ORDER BY total_revenue DESC;
GO

-- Q4. MRP above Rs. 500 and discount below 10%
SELECT DISTINCT name, mrp, discountPercent
FROM dbo.zepto3
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent DESC;
GO

-- Q5. Top 5 categories by average discount
SELECT TOP 5
       Category,
       ROUND(AVG(discountPercent), 2) AS avg_discount
FROM dbo.zepto3
GROUP BY Category
ORDER BY avg_discount DESC;
GO

-- Q6. Price per gram for products weighing at least 100g
SELECT DISTINCT
       name,
       weightInGms,
       discountedSellingPrice,
       ROUND(
           CAST(discountedSellingPrice AS DECIMAL(18, 4))
           / NULLIF(weightInGms, 0), 4
       ) AS price_per_gram
FROM dbo.zepto3
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;
GO

-- Q7. Categorize products by weight
SELECT DISTINCT
       name,
       weightInGms,
       CASE
           WHEN weightInGms < 1000 THEN 'Low'
           WHEN weightInGms < 5000 THEN 'Medium'
           ELSE 'Bulk'
       END AS weight_category
FROM dbo.zepto3
ORDER BY weightInGms;
GO

-- Q8. Total inventory weight per category
SELECT Category,
       SUM(
           CAST(weightInGms AS BIGINT)
           * availableQuantity
       ) AS total_weight_grams
FROM dbo.zepto3
GROUP BY Category
ORDER BY total_weight_grams DESC;
GO