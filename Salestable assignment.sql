use Salesdata;
-- Create Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity_sold INT,
    sale_date DATE,
    total_price DECIMAL(10, 2)
);

-- Insert sample data into Sales table

INSERT INTO Sales (sale_id, product_id, quantity_sold, sale_date, total_price) VALUES
(1, 101, 5, '2024-01-01', 2500.00),
(2, 102, 3, '2024-01-02', 900.00),
(3, 103, 2, '2024-01-02', 60.00),
(4, 104, 4, '2024-01-03', 80.00),
(5, 105, 6, '2024-01-03', 90.00);




-- Create Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- Insert sample data into Products table

INSERT INTO Products (product_id, product_name, category, unit_price) VALUES
(101, 'Laptop', 'Electronics', 500.00),
(102, 'Smartphone', 'Electronics', 300.00),
(103, 'Headphones', 'Electronics', 30.00),
(104, 'Keyboard', 'Electronics', 20.00),
(105, 'Mouse', 'Electronics', 15.00);

-- 1. Retrieve all columns from the Sales table.
use salesdata;
select * from sales;
select * from Products;

-- 2. Retrieve the product_name and unit_price from the Products table.
select product_name,unit_price
 from Products;


-- 3. Retrieve the sale_id and sale_date from the Sales table.
select sale_id,sale_date
 from Sales;


-- 4. Filter the Sales table to show only sales with a total_price greater than $100.
select *
 from Sales -- only sales or all details should be displayed? bcoz there is no column as sales
 where total_price>100;
 
 
-- 5. Filter the Products table to show only products in the ‘Electronics’ category.
select *
 from Products
 where category='Electronics';
 
 
 
-- 7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.
select product_id,product_name,unit_price
 from Products
 where unit_price>100;
 
 
-- 9. Calculate the average unit_price of products in the Products table.select product_id,product_name,unit_price
select * from Products;
select * from sales;

 select avg(p.unit_price) as average,p.product_id,p.product_name,p.unit_price
 from Products as p join Sales as s 
 on p.product_id = s.product_id
 group by p.product_id, p.product_name, p.unit_price;                                                          
                                -- used windows function

 
-- 10. Calculate the total quantity_sold from the Sales table.
select SUM(quantity_sold) as TOTAL
 from Sales; 
 
 
-- 11. Retrieve the sale_id, product_id, and total_price from the Sales table for sales with a quantity_sold greater than 4.
select sale_id,product_id,total_price,quantity_sold
 from Sales
 where quantity_sold>4; 
 
 
 
-- 12. Retrieve the product_name and unit_price from the Products table, ordering the results by unit_price in descending order.
select product_name,unit_price
 from Products
order by unit_price desc; 
 
 
-- 14. Calculate the average total_price of sales in the Sales table.
select avg(total_price)
 from Sales;


-- DATE FORMATS
select date_format(now(),'%y-%m-%d');
-- 15. Retrieve the sale_id and sale_date from the Sales table, formatting the sale_date as ‘YYYY-MM-DD’.
select date_format(sale_date,'%y-%m-%d') as newdate,sale_id,sale_date
 from Sales;
 
 
-- 16. Calculate the total revenue generated from sales of products in the ‘Electronics’ category.
select sum(s.total_price)
 from Sales s inner join products p
 where s.product_id=p.product_id
 group by category
 having category='Electronics';                          

use salesdata;
 select * from sales;
select * from Products;
 
-- 17. Retrieve the product_name and unit_price from the Products table, filtering the unit_price to show only values between $20 and $600.
select product_name,unit_price
 from Products
 WHERE unit_price BETWEEN 20 AND 600;



-- 18. Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.
select product_name,category
 from Products
 ORDER BY category asc;
 
 
 
-- 19. Calculate the total quantity_sold of products in the ‘Electronics’ category.

use Salesdata ;
select * from Products;
select * from sales;
select sum(quantity_sold) as total,product_name
 from Products as p join Sales  as s
 on p.product_id=s.product_id where category='Electronics'
 group by product_name;                                                   
 
 
 
-- 20. Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.
select p.product_name,sum(s.quantity_sold*p.unit_price) as total_price       
 from sales as s join products as p
 on p.product_id=s.product_id
 where p.category='Electronics'
 group by p.product_name;
 
 