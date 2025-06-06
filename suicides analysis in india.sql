use suicides;


-- Total Suicides Per Year

SELECT Year, SUM(Total) AS suicide
FROM suicide
GROUP BY Year
ORDER BY Year;


--  State with Highest Total Suicides
SELECT State, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY State
ORDER BY Total_Suicides DESC
LIMIT 1;


-- Top 10 Causes of Suicide
SELECT Type, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY Type
ORDER BY Total_Suicides DESC
LIMIT 10;



-- Suicides by Gender
SELECT Gender, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY Gender;


-- Suicides by Age Group
SELECT Age_group, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY Age_group
ORDER BY Total_Suicides DESC;



-- Year-wise Suicide Count for Each State
SELECT State, Year, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY State, Year
ORDER BY State, Year;


-- Gender-Wise Suicides for a Specific Cause
SELECT Gender, SUM(Total) AS Total_Suicides
FROM suicide
WHERE Type = 'Cancer'
GROUP BY Gender;


-- State with Highest Female Suicides
SELECT State, SUM(Total) AS Female_Suicides
FROM suicide
WHERE Gender = 'Female'
GROUP BY State
ORDER BY Female_Suicides DESC
LIMIT 1;



-- Top 5 Years with the Most Suicides
SELECT Year, SUM(Total) AS Total_Suicides
FROM suicide
GROUP BY Year
ORDER BY Total_Suicides DESC
LIMIT 5;



-- States with Zero Suicides Reported
SELECT DISTINCT State
FROM suicide
GROUP BY State
HAVING SUM(Total) = 0;


-- Average Suicides per Year for Each State
SELECT State, AVG(Total) AS Avg_Suicides_Per_Year
FROM suicide
GROUP BY State
ORDER BY Avg_Suicides_Per_Year DESC;


-- Cause-wise Suicides Over Time
SELECT Year, SUM(Total) AS Illness_Suicides
FROM suicide
WHERE Type = 'Poverty'
GROUP BY Year
ORDER BY Year;


-- Trend of Suicides in Maharashtra
SELECT Year, SUM(Total) AS Total_Suicides
FROM suicide
WHERE State = 'A & N Islands'
GROUP BY Year
ORDER BY Year;



-- Age Group Most Affected by Illness-Related Suicides
SELECT Age_group, SUM(Total) AS Total
FROM suicide
WHERE Type = 'Property Dispute'
GROUP BY Age_group
ORDER BY Total DESC
LIMIT 1;




-- Which Type_code Contributes Most to Suicides?
SELECT Type_code, SUM(Total) AS Total
FROM suicide
GROUP BY Type_code
ORDER BY Total DESC;



-- Gender-wise Suicides in Top 5 States
SELECT State, Gender, SUM(Total) AS Total
FROM suicide
GROUP BY State, Gender
ORDER BY SUM(Total) DESC
LIMIT 10;























