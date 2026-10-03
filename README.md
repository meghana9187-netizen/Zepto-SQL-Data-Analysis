"Zepto SQL Data Analysis"

Project Overview:

This project analyzes Zepto product inventory data using Microsoft SQL Server. The objective is to explore product pricing, discounts, availability, inventory quantities, and product categories using SQL queries.

Dataset:

The dataset contains product-level information, including:

- "Category" – Product category
- "name" – Product name
- "mrp" – Maximum Retail Price
- "discountPercent" – Discount percentage
- "availableQuantity" – Available stock quantity
- "discountedSellingPrice" – Price after discount
- "weightInGms" – Product weight in grams
- "outOfStock" – Indicates whether a product is out of stock
- "quantity" – Product quantity

Tools and Technologies:

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

Project Tasks:

- Retrieve the first 10 product records.
- Identify missing values and perform data quality checks.
- Explore distinct product categories.
- Analyze in-stock and out-of-stock products.
- Identify products with the highest discount percentages.
- Find high-MRP products that are out of stock.
- Calculate estimated inventory value by category.
- Identify categories offering the highest average discounts.
- Analyze product prices and value based on weight.

SQL Concepts Used:

- "SELECT" and "DISTINCT"
- "WHERE" and "ORDER BY"
- "GROUP BY" and "HAVING"
- Aggregate functions such as "COUNT", "AVG", and "SUM"
- "ROUND"
- "TOP"
- NULL value checks

How to Run:

1. Install Microsoft SQL Server and SQL Server Management Studio.
2. Import the Zepto inventory dataset into SQL Server.
3. Create or select the database containing the dataset.
4. Ensure the table name is "dbo.zepto3".
5. Open a new query window in SSMS.
6. Execute the SQL queries and review the results.

Example query:

USE Zepto_SQL_project;
GO

SELECT TOP 10 *
FROM dbo.zepto3;
GO

Key Learnings

This project provides practical experience in SQL-based data exploration, inventory analysis, discount analysis, data quality checks, and extracting business insights from retail product data.

Project Status

Ongoing — additional queries and analysis can be added as the project develops.

