-- WINDOW FUNCTIONS(AGGREGATE FUNCTIONS)

select contactlastname,contactfirstname,country,creditlimit,
avg(creditlimit) over(partition by country) as AVGcred
FROM CUSTOMERS;

select * from customers;

select contactlastname,contactfirstname,country,creditlimit,
avg(creditlimit) over() as AVGcred
FROM CUSTOMERS;


select contactlastname,contactfirstname,country,creditlimit,
avg(creditlimit) over(partition by country order by creditlimit desc) as AVGcred
FROM CUSTOMERS;

-- RANK FUNCTIONS
select contactlastname,contactfirstname,country,creditlimit,
rank() over() as rnk
FROM CUSTOMERS;

select contactlastname,contactfirstname,country,creditlimit,
rank() over(order by creditlimit desc) as rnk
FROM CUSTOMERS;

select * from (select contactlastname,contactfirstname,country,creditlimit,
rank() over(order by creditlimit desc) as rnk
FROM CUSTOMERS) as newtab where rnk=1;


-- 4th highest
select * from (select contactlastname,contactfirstname,country,creditlimit,
rank() over(order by creditlimit desc) as rnk
FROM CUSTOMERS) as newtab where rnk=4;



select contactlastname,contactfirstname,country,creditlimit,
rank() over(partition by country order by creditlimit desc) as rnk
FROM CUSTOMERS;

select * from (select contactlastname,contactfirstname,country,creditlimit,
rank() over(partition by country order by creditlimit desc) as rnk
FROM CUSTOMERS) as newtab where rnk=1;

-- DENSE RANK
select 
row_number() over(partition by country order by creditlimit desc) as customer_row_no,
contactlastname,contactfirstname,country,creditlimit,
rank() over(partition by country order by creditlimit desc) as cust_rank,
dense_rank() over(partition by country order by creditlimit desc) as cust_dense_rank
from customers;

select 
row_number() over(partition by country order by salary desc) as customer_row_no,
contactlastname,contactfirstname,country,creditlimit,salary,
rank() over(partition by country order by salary desc) as cust_rank,
dense_rank() over(partition by country order by salary desc) as cust_dense_rank
from customers;


select * from products;
select 
row_number() over(partition by country order by salary desc) as customer_row_no,
contactlastname,contactfirstname,country,creditlimit,salary,
rank() over(partition by country order by salary desc) as cust_rank,
dense_rank() over(partition by country order by salary desc) as cust_dense_rank
from customers;


-- acid properties
/* ACID properties in MySQL (or any relational database) ensure data integrity and reliable transaction processing. ACID stands for:

Atomicity: A transaction is treated as a single unit of work. Either all the operations are executed successfully, or none of them are applied.

Example: If a bank transfer involves debiting one account and crediting another, both operations must complete. If one fails, both are rolled back.

Consistency: The database must always move from one valid state to another. The data should remain accurate and follow all rules (e.g., foreign key constraints).

Isolation: Transactions are executed independently of one another. Intermediate states of a transaction are invisible to other transactions. MySQL provides isolation levels like READ UNCOMMITTED, READ COMMITTED, REPEATABLE READ (default), and SERIALIZABLE.

Durability: Once a transaction is committed, it is permanently saved in the database, even in case of a system failure. MySQL uses mechanisms like logs to ensure this.
*/




-- normalisation rules
/*
Normalization is a systematic approach to organizing data in a database to reduce redundancy and improve data integrity. There are several normal forms, each with specific rules:

1. First Normal Form (1NF):
Each column must contain atomic (indivisible) values.

Each column must contain values of the same data type.

Each record must be unique.

Example:
Before 1NF:

Student_ID	Subjects
1	Math, Physics
2	Chemistry, Math

After 1NF:

Student_ID	Subject
1	Math
1	Physics
2	Chemistry
2	Math

2. Second Normal Form (2NF):
Must be in 1NF.

Remove partial dependencies (i.e., non-key columns must depend on the entire primary key, not just part of it).

Example:
Before 2NF (with partial dependency):

Order_ID	Product_ID	Product_Name	Price
1	101	Mouse	300
1	102	Keyboard	500

After 2NF:

Orders Table:

Order_ID	Product_ID
1	101
1	102

Products Table:

Product_ID	Product_Name	Price
101	Mouse	300
102	Keyboard	500

3. Third Normal Form (3NF):
Must be in 2NF.

Remove transitive dependencies (i.e., non-key columns must not depend on other non-key columns).

Example:
Before 3NF (with transitive dependency):

Student_ID	Student_Name	Dept_ID	Dept_Name
1	John	101	Science
2	Sara	102	Commerce

After 3NF:

Students Table:

Student_ID	Student_Name	Dept_ID
1	John	101
2	Sara	102

Departments Table:

Dept_ID	Dept_Name
101	Science
102	Commerce

4. Boyce-Codd Normal Form (BCNF):
Must be in 3NF.

Every determinant must be a candidate key.

5. Fourth Normal Form (4NF):
Must be in BCNF.

No multi-valued dependencies (one column value should not depend on multiple values of another column).


*/





-- index(indexing),views(temp tables),functions(customize function),trigger,cursor,procedure>>>learn the structures
/*
1. Indexing
Indexes improve data retrieval speed by creating a data structure to quickly locate rows.
Types: Primary, Unique, Fulltext, Spatial.

Syntax:

sql
Copy
Edit
-- Creating an index
CREATE INDEX idx_customer_name ON customers(name);

-- Creating a unique index
CREATE UNIQUE INDEX idx_unique_email ON users(email);

-- Creating a composite index
CREATE INDEX idx_order ON orders(order_date, customer_id);

-- Viewing indexes
SHOW INDEX FROM customers;

-- Dropping an index
DROP INDEX idx_customer_name ON customers;
2. Views
A view is a virtual table created based on a SELECT query. It simplifies complex queries.

Syntax:

sql
Copy
Edit
-- Creating a view
CREATE VIEW customer_orders AS
SELECT c.customer_id, c.name, o.order_id, o.amount 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id;

-- Using the view
SELECT * FROM customer_orders;

-- Updating a view
CREATE OR REPLACE VIEW customer_orders AS
SELECT c.customer_id, c.name, o.order_id, o.amount 
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.amount > 100;

-- Dropping a view
DROP VIEW customer_orders;
3. Temporary Tables
Temporary tables exist only for the duration of the session.

Syntax:

sql
Copy
Edit
-- Creating a temporary table
CREATE TEMPORARY TABLE temp_customers (
    customer_id INT,
    name VARCHAR(50)
);

-- Inserting data
INSERT INTO temp_customers VALUES (1, 'John Doe');

-- Querying data
SELECT * FROM temp_customers;

-- Dropping the table
DROP TEMPORARY TABLE temp_customers;
4. Functions (Custom Functions)
Functions return a single value and can accept parameters.

Syntax:

sql
Copy
Edit
-- Creating a function
DELIMITER //
CREATE FUNCTION calculate_discount(price DECIMAL(10,2), discount_rate DECIMAL(5,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE final_price DECIMAL(10,2);
    SET final_price = price - (price * discount_rate / 100);
    RETURN final_price;
END //
DELIMITER ;

-- Using the function
SELECT calculate_discount(500, 10) AS Discounted_Price;
5. Triggers
Triggers are automatic actions that execute when specific events occur (INSERT, UPDATE, DELETE).

Syntax:

sql
Copy
Edit
-- Creating a trigger
DELIMITER //
CREATE TRIGGER before_order_insert 
BEFORE INSERT ON orders 
FOR EACH ROW 
BEGIN
    INSERT INTO order_logs (order_id, log_message) 
    VALUES (NEW.order_id, 'New order created');
END //
DELIMITER ;

-- Dropping a trigger
DROP TRIGGER before_order_insert;
6. Cursors
Cursors are used to iterate over query results row by row.

Syntax:

sql
Copy
Edit
DELIMITER //
CREATE PROCEDURE process_orders()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE order_id INT;
    DECLARE cur CURSOR FOR SELECT order_id FROM orders;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;
    REPEAT
        FETCH cur INTO order_id;
        IF NOT done THEN
            -- Process each order
            INSERT INTO processed_orders (order_id) VALUES (order_id);
        END IF;
    UNTIL done END REPEAT;
    
    CLOSE cur;
END //
DELIMITER ;

-- Calling the procedure
CALL process_orders();
7. Procedures
Procedures can execute multiple SQL statements. They are reusable and can accept parameters.

Syntax:

sql
Copy
Edit
DELIMITER //
CREATE PROCEDURE get_customer_orders(IN customer_id INT)
BEGIN
    SELECT order_id, amount 
    FROM orders 
    WHERE customer_id = customer_id;
END //
DELIMITER ;

-- Calling the procedure
CALL get_customer_orders(1);

*/




-- cte(advance) to fetch data
/*
A CTE (Common Table Expression) is a temporary result set that you can reference within a SELECT, INSERT, UPDATE, or DELETE statement. It is defined using the WITH keyword and is particularly useful for:

Breaking down complex queries

Recursive queries

Improving readability and modularity
*/





-- CTE FORMAT
/*
Syntax of CTE:
sql
Copy
Edit
WITH cte_name AS (
    SELECT columns FROM table WHERE condition
)
SELECT * FROM cte_name;
1. Basic CTE Example:
Suppose we have an employees table:

emp_id	emp_name	dept_id	salary
1	John	101	5000
2	Mike	102	6000
3	Sara	101	5500
4	Emma	103	4500
5	David	102	7000

CTE to fetch employees with a salary above 5000:

sql
Copy
Edit
WITH High_Salary AS (
    SELECT emp_id, emp_name, salary 
    FROM employees 
    WHERE salary > 5000
)
SELECT * FROM High_Salary;
2. CTE with Multiple CTEs:
You can define multiple CTEs in a single query:

sql
Copy
Edit
WITH 
    High_Salary AS (
        SELECT emp_id, emp_name, salary 
        FROM employees 
        WHERE salary > 5000
    ),
    Department_Salary AS (
        SELECT dept_id, AVG(salary) AS avg_salary 
        FROM employees 
        GROUP BY dept_id
    )
SELECT h.emp_name, h.salary, d.avg_salary 
FROM High_Salary h 
JOIN Department_Salary d ON h.dept_id = d.dept_id;
3. Recursive CTE:
Recursive CTEs allow you to perform hierarchical or tree-like queries.

Example: Employee hierarchy:

emp_id	emp_name	manager_id
1	John	NULL
2	Mike	1
3	Sara	1
4	Emma	2
5	David	2

Query to fetch employee hierarchy:

sql
Copy
Edit
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT emp_id, emp_name, manager_id, 1 AS level 
    FROM employees 
    WHERE manager_id IS NULL
    
    UNION ALL
    
    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.manager_id = eh.emp_id
)
SELECT * FROM EmployeeHierarchy;
4. CTE with Ranking Functions:
If MySQL version is 8.0 or later, you can use window functions in CTEs.

sql
Copy
Edit
WITH EmployeeRank AS (
    SELECT emp_name, salary,
           RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT * FROM EmployeeRank WHERE salary_rank <= 3;
5. CTE with Update/Delete Operations:
You can use CTEs to update or delete data based on specific conditions.

sql
Copy
Edit
WITH High_Salary AS (
    SELECT emp_id, salary 
    FROM employees 
    WHERE salary > 6000
)
UPDATE employees 
SET salary = salary * 1.05 
WHERE emp_id IN (SELECT emp_id FROM High_Salary);

*/




