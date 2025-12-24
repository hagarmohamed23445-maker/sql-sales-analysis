# sql-sales-analysis
SQL queries for sales data analysis including aggregation and insights.
-- Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM sales;

-- Top 5 Customers
SELECT customer_name, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 5;

-- Monthly Sales
SELECT MONTH(order_date) AS month, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY MONTH(order_date)
ORDER BY month;
