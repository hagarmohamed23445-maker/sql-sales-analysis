SELECT TOP 10 * FROM dbo.sales;
SELECT
    COUNT(*) AS TotalOrders,   
    SUM(TotalPrice) AS TotalSales,  
    AVG(TotalPrice) AS AvgSales,    
    MIN(TotalPrice) AS MinSale,     
    MAX(TotalPrice) AS MaxSale     
FROM sales;

   SELECT 
    Category,
    SUM(TotalPrice) AS TotalSales,
    COUNT(OrderID) AS NumOrders
FROM sales
GROUP BY Category
ORDER BY TotalSales DESC
  SELECT 
    Region,
    SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY Region
ORDER BY TotalSales DESC;

SELECT 
    SalesRep,
    SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY SalesRep
ORDER BY TotalSales DESC
SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;
SELECT 
    Product,
    AVG(Quantity) AS AvgQuantity,
    AVG(UnitPrice) AS AvgUnitPrice
FROM sales
GROUP BY Product
ORDER BY AvgQuantity DESC
SELECT *
FROM sales
WHERE TotalPrice > 1000
ORDER BY TotalPrice DESC
 
    SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

SELECT 
    Product,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AvgSale
FROM sales
GROUP BY Product
ORDER BY TotalSales DESC;

SELECT TOP 10 CustomerName, SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY CustomerName
ORDER BY TotalSales DESC;
SELECT Region, SUM(TotalPrice) AS TotalSales
FROM sales
GROUP BY Region
ORDER BY TotalSales DESC;
SELECT SalesRep, 
       SUM(TotalPrice) AS TotalSales, 
       COUNT(OrderID) AS NumOrders,
       AVG(TotalPrice) AS AvgSale
FROM sales
GROUP BY SalesRep
ORDER BY TotalSales DESC;
WITH stats AS (
    SELECT AVG(TotalPrice) AS avg_sales, STDEV(TotalPrice) AS std_sales
    FROM sales
)
SELECT *
FROM sales, stats
WHERE TotalPrice > avg_sales + 2 * std_sales
ORDER BY TotalPrice DESC;
WITH stats AS (
    SELECT AVG(TotalPrice) AS avg_sales, STDEV(TotalPrice) AS std_sales
    FROM sales
)
SELECT *
FROM sales, stats
WHERE TotalPrice < avg_sales - 2 * std_sales
ORDER BY TotalPrice ASC;