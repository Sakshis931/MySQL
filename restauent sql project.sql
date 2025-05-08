use restaurant_db;
-- 1. view the menu items table
select * from menu_items;

-- 2. find the number of items on the menu
select count(*) from menu_items;

-- 3. what are the least and most expensive items on the menu
select * from menu_items
order by price;


select * from menu_items
order by price desc;

-- 4.how many dishes are italian on the menu
select count(*) from menu_items
where category='italian';

-- 5.what are the most and least expensive italian dishes on the menu
select * from menu_items
where category='italian'
order by price;

select * from menu_items
where category='italian'
order by price desc;

-- 6.how many dishes are in each category
select category,count(menu_item_id) as num_dishes
from menu_items
group by  category;

-- 7.what is the average dish price within a category
select category,avg(price) as avg_dishes
from menu_items
group by  category;

-- for ORDER_DETAILS TABLE
-- view the order_details table
select * from order_details;


-- 2. what is the date range of the table?
select min(order_date),max(order_date)from order_details;

-- 3.how many orders were made within this date range?, it means per order_id ...oredrs made
select count(distinct order_id) from order_details;

-- 4.how many items ere ordered within this date range?
select count(*) from order_details;


-- 5. which orders had the most number of items
select order_id,count(item_id) as num_items
from order_details
group by order_id
order by num_items desc ;


-- 6.how many orders had more than 12 items?
select count(*) from
(select order_id,count(item_id) as num_items
from order_details
group by order_id
having num_items>12)as num_orders;





