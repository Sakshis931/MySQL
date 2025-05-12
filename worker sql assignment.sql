use workerr;CREATE TABLE Workerdetails (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Workerdetails (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');





CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Workerdetails(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');






CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Workerdetails(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');

--  1.Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
use workerr;
select FIRST_NAME as WORKER_NAME
from Workerdetails;


--  2.Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
use workerr;
select upper(FIRST_NAME) as WORKER_NAME
from Workerdetails;

-- 3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
use workerr;
select distinct DEPARTMENT
from Workerdetails;


-- 4.Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
SELECT LEFT(FIRST_NAME, 3) AS newname
FROM Workerdetails;

-- 5.Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
-- PENDINGGGGG


-- 6.Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.



-- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.


-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.



-- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.


-- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.


-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.


-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.


-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.



-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.


-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from Workerdetails
where salary between 100000 and 500000;

-- Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.
select * from Workerdetails
where JOINING_DATE> 2021-02-01;


