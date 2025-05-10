-- 1.Retrive all books in the fiction genre
show databases;
use project_1;

select * from books
where Genre='Fiction';

-- 2. Find the books published ter the year 1950

select * from books
where Published_Year>1950;

-- 3. List all customers rom Canada

select * from customers
where country='Canada';


-- 4. Show all the orders placed n november 2023
select * from orders
where Order_Date between '2023-11-1' and '2023-11-30' ;

-- 5. Retrive he total stock of books available
select sum(stock) as total_stock
from books;

-- 6. Find the details of the most expensive book
select * from books
order by price desc
limit 1;

-- 7. Show all customers who ordered more than 1 quantity f a book
select * from orders
where quantity>1;

-- 8. Retriev all orders here the totall ount exceeds $20
select * from orders
where Total_Amount>20;

-- 9. List all genres avaliable in the books table
select distinct genre from books;

-- 10. Find the book with the lowest stock
select * from books
order by Stock
limit 1;

-- 11. Calculate the total revenue generated from all orders 
select sum(Total_Amount) as revenue
from orders;
