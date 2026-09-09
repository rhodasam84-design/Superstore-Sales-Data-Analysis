-- Query 1: Overall Performance Metrics
SELECT 
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) * 1.0 / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM large_sales_data;

-- Query 2: Monthly Trends & Profit Margin Tracking
SELECT 
    STRFTIME('%m', OrderDate) AS Month_Number,
    COUNT(OrderID) AS Total_Orders,
    SUM(Sales) AS Total_Sales, 
    SUM(Profit) AS Total_Profit,
    ROUND((SUM(Profit) * 1.0 / SUM(Sales)) * 100, 2) AS Profit_Margin_Percent
FROM large_sales_data
GROUP BY Month_Number
ORDER BY Month_Number ASC;

-- Query 3: Deep-Dive Investigative Filtering (Dallas Profit Leak)
SELECT 
    Category,
    City,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM large_sales_data
WHERE STRFTIME('%m', OrderDate) = '03'
GROUP BY Category, City
ORDER BY Total_Profit ASC;
