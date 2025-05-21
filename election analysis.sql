use election_results;
select * from constituencywise_results;
select * from states;

-- Total Votes by Constituency
SELECT `Constituency Name`, `Total Votes`
FROM constituencywise_results;


-- Top 5 Constituencies by Voter Turnout
SELECT `Constituency Name`, `Total Votes`
FROM constituencywise_results
ORDER BY `Total Votes` DESC
LIMIT 5;

-- Winning Margins by Constituency
SELECT `Constituency Name`, `Winning Candidate`, `Margin`
FROM constituencywise_results
ORDER BY `Margin` DESC;


-- Group by Party to Get Total Votes and Wins
SELECT `Party ID`, COUNT(*) AS `Seats Won`, SUM(`Total Votes`) AS `Total Votes`
FROM constituencywise_results
GROUP BY `Party ID`
ORDER BY `Seats Won` DESC;



--  Join with States Table (Assuming you have a way to map Constituency ID to State ID)
SELECT s.State, COUNT(*) AS `Constituencies`
FROM constituencywise_results c
JOIN states s ON LEFT(c.`Constituency ID`, 1) = LEFT(s.`State ID`, 1)
GROUP BY s.State;



-- Aggregation Functions
-- Total votes polled across all constituencies
SELECT SUM(`Total Votes`) AS `Total National Votes` 
FROM constituencywise_results;

-- Average margin of victory
SELECT AVG(`Margin`) AS `Average Winning Margin`
FROM constituencywise_results;

-- Maximum and minimum vote margin
SELECT MAX(`Margin`) AS `Max Margin`, MIN(`Margin`) AS `Min Margin`
FROM constituencywise_results;


--  String Functions
-- Constituencies where candidate name includes 'SINGH'
SELECT `Constituency Name`, `Winning Candidate`
FROM constituencywise_results
WHERE `Winning Candidate` LIKE '%SINGH%';

-- Extract first name of winning candidate
SELECT SUBSTRING_INDEX(`Winning Candidate`, ' ', 1) AS `First Name`
FROM constituencywise_results;


-- Conditional Logic (CASE WHEN)
-- Categorize win margins
SELECT `Constituency Name`, `Margin`,
  CASE
    WHEN `Margin` > 100000 THEN 'Landslide Win'
    WHEN `Margin` BETWEEN 50000 AND 100000 THEN 'Comfortable Win'
    ELSE 'Close Contest'
  END AS `Win Type`
FROM constituencywise_results;



-- Window Functions
-- Rank constituencies by total votes
SELECT `Constituency Name`, `Total Votes`,
       RANK() OVER (ORDER BY `Total Votes` DESC) AS `Vote Rank`
FROM constituencywise_results;

-- Cumulative total of votes
SELECT `Constituency Name`, `Total Votes`,
       SUM(`Total Votes`) OVER (ORDER BY `Constituency Name`) AS `Running Total`
FROM constituencywise_results;




-- Numeric and Type Functions
-- Convert votes to lakhs (Indian numbering)
SELECT `Constituency Name`, ROUND(`Total Votes` / 100000.0, 2) AS `Votes in Lakhs`
FROM constituencywise_results;



-- Grouping with HAVING
-- Parties that won more than 5 seats
SELECT `Party ID`, COUNT(*) AS `Seats Won`
FROM constituencywise_results
GROUP BY `Party ID`
HAVING `Seats Won` > 5;



-- Subqueries
-- Constituencies with votes above national average
SELECT `Constituency Name`, `Total Votes`
FROM constituencywise_results
WHERE `Total Votes` > (
    SELECT AVG(`Total Votes`)
    FROM constituencywise_results
);




-- Joining with states.csv
-- Number of constituencies per state
SELECT s.State, COUNT(*) AS Constituency_Count
FROM constituencywise_results c
JOIN states s ON LEFT(c.`Constituency ID`, 1) = LEFT(s.`State ID`, 1)
GROUP BY s.State;



-- Find the candidate with the highest winning margin
SELECT `Winning Candidate`, `Constituency Name`, `Margin`
FROM constituencywise_results
WHERE `Margin` = (
    SELECT MAX(`Margin`)
    FROM constituencywise_results
);




-- Find constituencies where votes were above the average for their own party
SELECT `Constituency Name`, `Party ID`, `Total Votes`
FROM constituencywise_results c1
WHERE `Total Votes` > (
    SELECT AVG(`Total Votes`)
    FROM constituencywise_results c2
    WHERE c2.`Party ID` = c1.`Party ID`
);



-- Top 3 constituencies with highest votes per party
SELECT *
FROM (
    SELECT `Constituency Name`, `Party ID`, `Total Votes`,
           RANK() OVER (PARTITION BY `Party ID` ORDER BY `Total Votes` DESC) AS rnk
    FROM constituencywise_results
) AS ranked
WHERE rnk <= 3;

-- Standard deviation of vote margins
SELECT STDDEV(`Margin`) AS `StdDev_Margin`
FROM constituencywise_results;



-- Count distinct parties that won at least one seat
SELECT COUNT(DISTINCT `Party ID`) AS `Unique Parties Won`
FROM constituencywise_results;




-- Concatenate all winning candidates in a state
SELECT s.State,
       GROUP_CONCAT(`Winning Candidate` SEPARATOR ', ') AS Winners
FROM constituencywise_results c
JOIN states s ON LEFT(c.`Constituency ID`, 1) = LEFT(s.`State ID`, 1)
GROUP BY s.State;



-- Percent of total votes won per party
SELECT `Party ID`,
       SUM(`Total Votes`) AS PartyVotes,
       ROUND(SUM(`Total Votes`) * 100.0 / (
           SELECT SUM(`Total Votes`)
           FROM constituencywise_results
       ), 2) AS VotePercent
FROM constituencywise_results
GROUP BY `Party ID`
ORDER BY VotePercent DESC;



--  Find constituencies where the margin is more than twice the average margin
SELECT `Constituency Name`, `Margin`
FROM constituencywise_results
WHERE `Margin` > 2 * (
    SELECT AVG(`Margin`) FROM constituencywise_results
);





