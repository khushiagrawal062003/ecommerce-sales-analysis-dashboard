create database ecommercedb;
use ecommercedb;
/*Total number of orders*/
SELECT COUNT(*) AS total_orders
FROM ecommerced;

/*Total sales (Revenue)*/
SELECT SUM(TotalAmount) AS total_sales
FROM ecommerced;

/*Average order value*/
SELECT AVG(TotalAmount) AS avg_order_value
FROM ecommerced;

/*Revenue by product category*/
SELECT Category,
SUM(TotalAmount) AS total_sales
FROM ecommerced
GROUP BY Category
ORDER BY total_sales DESC;

/*Average rating per category*/
SELECT Category,
ROUND(AVG(Rating), 2) AS avg_rating
FROM ecommerced
GROUP BY Category;

/*Top 5 brands by revenue*/
SELECT Brand,
SUM(TotalAmount) AS revenue
FROM ecommerced
GROUP BY Brand
ORDER BY revenue DESC
LIMIT 5;

/*Orders count per brand*/
SELECT Brand,
COUNT(OrderID) AS total_orders
FROM ecommerced
GROUP BY Brand
ORDER BY total_orders DESC;

/*Revenue by platform*/
SELECT Platform,
SUM(TotalAmount) AS revenue
FROM ecommerced
GROUP BY Platform
ORDER BY revenue DESC;

/*Top cities by sales*/
SELECT City,
SUM(TotalAmount) AS total_sales
FROM ecommerced
GROUP BY City
ORDER BY total_sales DESC
LIMIT 10;

/*Monthly sales trend*/
SELECT YEAR(OrderDate) AS year,
MONTH(OrderDate) AS month,
SUM(TotalAmount) AS monthly_sales
FROM ecommerced
GROUP BY year, month
ORDER BY year, month;

/*Products with low ratings (< 3)*/
SELECT Brand, Category, Rating
FROM ecommerced
WHERE Rating < 3;

/*High-value orders*/
SELECT *
FROM ecommerced
WHERE TotalAmount > 5000
ORDER BY TotalAmount DESC;

