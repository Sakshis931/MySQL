use Walmartsales;


SHOW TABLES;
SELECT `Product line`, SUM(`Total`) AS Revenue
FROM `walmartsalesdata.csv`
GROUP BY `Product line`
ORDER BY Revenue DESC
LIMIT 5;


-- Rename the table 
RENAME TABLE `walmartsalesdata.csv` TO walmartsalesdata;




-- clean
SELECT `Product line`, SUM(`Total`) AS Revenue
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY Revenue DESC
LIMIT 5;


--  Total Sales by Gender
SELECT Gender, SUM(Total) AS Total_Sales
FROM walmartsalesdata
GROUP BY Gender
ORDER BY Total_Sales DESC;



--  Daily Sales
SELECT Date, SUM(Total) AS Daily_Sales
FROM walmartsalesdata
GROUP BY Date
ORDER BY Date;


-- Quantity Sold per Product Line
SELECT `Product line`, SUM(Quantity) AS Total_Quantity
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY Total_Quantity DESC;



-- Gross Income per Branch
SELECT Branch, SUM(`gross income`) AS Total_Gross_Income
FROM walmartsalesdata
GROUP BY Branch
ORDER BY Total_Gross_Income DESC;




-- Average Rating by City
SELECT City, AVG(Rating) AS Avg_Rating
FROM walmartsalesdata
GROUP BY City
ORDER BY Avg_Rating DESC;



-- Most Common Payment Method
SELECT Payment, COUNT(*) AS Usage_Count
FROM walmartsalesdata
GROUP BY Payment
ORDER BY Usage_Count DESC;



-- Peak Sales Hours
SELECT HOUR(Time) AS Hour, SUM(Total) AS Hourly_Sales
FROM walmartsalesdata
GROUP BY Hour
ORDER BY Hourly_Sales DESC;




-- Sales by Customer Type
SELECT `Customer type`, SUM(Total) AS Total_Sales
FROM walmartsalesdata
GROUP BY `Customer type`
ORDER BY Total_Sales DESC;



--  Average Gross Margin Percentage by Product Line
SELECT `Product line`, AVG(`gross margin percentage`) AS Avg_Margin
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY Avg_Margin DESC;



--  Monthly Revenue Trend
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month,
    SUM(Total) AS Monthly_Revenue
FROM walmartsalesdata
GROUP BY Month
ORDER BY Month;



-- Gender-wise Revenue by Branch
SELECT 
    Branch,
    Gender,
    SUM(Total) AS Revenue
FROM walmartsalesdata
GROUP BY Branch, Gender
ORDER BY Branch, Revenue DESC;



-- Top 3 Products by Quantity in Each Branch
SELECT *
FROM (
    SELECT 
        Branch,
        `Product line`,
        SUM(Quantity) AS Total_Quantity,
        RANK() OVER (PARTITION BY Branch ORDER BY SUM(Quantity) DESC) AS rank_in_branch
    FROM walmartsalesdata
    GROUP BY Branch, `Product line`
) AS ranked
WHERE rank_in_branch <= 3;




-- Sales-to-Gross-Income Ratio by Product Line
SELECT 
    `Product line`,
    SUM(Total) AS Total_Sales,
    SUM(`gross income`) AS Total_Gross_Income,
    ROUND(SUM(`gross income`) / SUM(Total), 2) AS Income_Ratio
FROM walmartsalesdata
GROUP BY `Product line`
ORDER BY Income_Ratio DESC;



-- High-Spending Customers (Single Purchase > 500)
SELECT *
FROM walmartsalesdata
WHERE Total > 500
ORDER BY Total DESC;




-- Day of Week Sales Analysis
SELECT 
    DAYNAME(Date) AS DayOfWeek,
    COUNT(*) AS Num_Transactions,
    SUM(Total) AS Total_Sales
FROM walmartsalesdata
GROUP BY DayOfWeek
ORDER BY FIELD(DayOfWeek, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');




-- Average Basket Size (Revenue per Transaction)
SELECT 
    ROUND(AVG(Total), 2) AS Avg_Basket_Value
FROM walmartsalesdata;




-- Convert Product Line to Uppercase
SELECT UPPER(`Product line`) AS Product_Upper
FROM walmartsalesdata
LIMIT 10;



--  Convert City to Lowercase
SELECT LOWER(City) AS City_Lower
FROM walmartsalesdata
LIMIT 10;




-- Filter Product Lines Containing the Word 'accessories'
SELECT `Product line`
FROM walmartsalesdata
WHERE `Product line` LIKE '%accessories%';




-- Extract First Word from Product Line
SELECT SUBSTRING_INDEX(`Product line`, ' ', 1) AS First_Word
FROM walmartsalesdata
LIMIT 10;



-- Concatenate City and Branch
SELECT CONCAT(City, ' - ', Branch) AS Location
FROM walmartsalesdata
LIMIT 10;



--  Length of Each Payment Method Name
SELECT Payment, LENGTH(Payment) AS Name_Length
FROM walmartsalesdata
GROUP BY Payment;



-- Trim Extra Spaces 
SELECT TRIM(`Customer type`) AS Clean_Customer_Type
FROM walmartsalesdata
LIMIT 10;



-- Replace 'accessories' with 'items' in Product Line
SELECT REPLACE(`Product line`, 'accessories', 'items') AS Updated_Product
FROM walmartsalesdata
WHERE `Product line` LIKE '%accessories%';




-- Find Product Lines That Start With 'F'
SELECT `Product line`
FROM walmartsalesdata
WHERE `Product line` LIKE 'F%';



-- Reverse City Names
SELECT City, REVERSE(City) AS Reversed_City
FROM walmartsalesdata
LIMIT 10;



-- COUNT() – Total number of transactions
SELECT COUNT(*) AS Total_Transactions
FROM walmartsalesdata;



-- SUM() – Total sales
SELECT SUM(Total) AS Total_Revenue
FROM walmartsalesdata;





-- AVG() – Average gross income
SELECT AVG(`gross income`) AS Avg_Income
FROM walmartsalesdata;




-- MAX() – Highest unit price
SELECT MAX(`Unit price`) AS Max_Unit_Price
FROM walmartsalesdata;





-- MIN() – Lowest rating
SELECT MIN(Rating) AS Lowest_Rating
FROM walmartsalesdata;




-- Total Sales by Payment Method
SELECT Payment, SUM(Total) AS Revenue
FROM walmartsalesdata
GROUP BY Payment
ORDER BY Revenue DESC;


-- Average Quantity Sold per City
SELECT City, AVG(Quantity) AS Avg_Quantity
FROM walmartsalesdata
GROUP BY City;



-- Total Transactions per Product Line
SELECT `Product line`, COUNT(*) AS Num_Transactions
FROM walmartsalesdata
GROUP BY `Product line`;



-- Highest and Lowest Gross Income by Branch
SELECT Branch,
       MAX(`gross income`) AS Max_Income,
       MIN(`gross income`) AS Min_Income
FROM walmartsalesdata
GROUP BY Branch;



-- Average Rating by Customer Type
SELECT `Customer type`, AVG(Rating) AS Avg_Rating
FROM walmartsalesdata
GROUP BY `Customer type`;



