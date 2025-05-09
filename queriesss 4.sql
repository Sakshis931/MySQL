use classicmodels;
show tables;
select * from customers;


-- between
select * from customers
where creditlimit between 100000 and 200000;

select * from customers
where country='uk' or country='usa' or country='spain';

-- IN operator=records multiple conditions
select * from customers
where country in('uk','spain','usa');

select * from customers
where state in('ma','ct','ny');


select * from customers
where salesRepEmployeeNumber in(1216,1286,1323);

select * from customers
where city in('boston','nyc');


-- using different table named product
select * from products
where productline in('Motorcycles','Classic Cars','Trucks and Buses');

-- range pending



-- LIKE
select * from customers
where customerName like 'g%';

select * from customers
where contactFirstName like 'g%';

select * from customers
where contactFirstName like '%a';

select * from customers
where contactFirstName like 'g%m';

select * from customers
where contactFirstName like 'm%a';

select * from customers
where contactFirstName like '%an%';

select * from customers
where contactFirstName like '%l';



-- 'a_’ 🡪 It returns values that start with a and are at least 2 characters in length.
-- ‘_s’ 🡪 It returns values that has s in the second position.

select * from customers
where contactFirstName like "___";

select * from customers
where contactFirstName like "a___";

select * from customers
where contactLastName like "a___";

select * from customers
where contactLastName like "a____";

select * from customers
where contactfirstName like "a__ ";

select * from customers
where contactfirstName like "% ";


-- COUNT 
select count(contactlastName)
from customers;

select count(contactlastName)
from customers
where country='usa';

select count(contactlastName)
from customers
where country='uk';

select count(contactlastName)
from customers
where  creditlimit=0;

select count(contactlastName)
from customers
where  creditlimit between 100000 and 200000;

-- because count me numeric aana chahiye
select count(state)
from customers
where state is null ;

select count(contactlastName)
from customers
where state is null ;

select sum(creditlimit)
from customers;

-- SUM
select sum(creditlimit)
from customers
where country='australia';

-- MIN
select min(creditlimit)
from customers
where country='australia';

-- MAX
select max(creditlimit)
from customers
where country='australia';

-- AVG
select avg(creditlimit)
from customers
where country='australia';

-- on the products table
select * from products;


-- COUNT 
select count(quantityInStock)
from products;


select count(productName)
from products;

-- AVG
select avg(buyPrice)
from products
where productVendor='Min Lin Diecast';

select avg(buyPrice)
from products
where productLine='Motorcycles';


-- GROUP BY
-- SUM
SELECT country,sum(creditlimit)
from customers
group by country;

-- Count
SELECT country,count(customername)
from customers
group by country;

SELECT country,count(contactlastname)
from customers
group by country;


SELECT country,min(creditlimit)
from customers
group by country;

SELECT country,max(creditlimit)
from customers
group by country;


SELECT country,avg(creditlimit)
from customers
group by country;

SELECT country,count(creditlimit)
from customers
group by country;


SELECT country,sum(creditlimit)
from customers
group by country;

-- Allaises
SELECT country,sum(creditlimit) as total
from customers
group by country;


SELECT country,count(creditlimit) as cnt
from customers
group by country
order by cnt desc;


SELECT country,count(customername) as max
from customers
group by country
order by max desc
limit 10;



SELECT country,count(creditlimit) as max
from customers
group by country
order by max desc
limit 3;


SELECT country,sum(creditlimit) as max
from customers
group by country
order by max desc
limit 3;

-- where does work only on original data
SELECT country,count(customername) as max
from customers
group by country
where max>10;


--  HAVING instead of WHERE (when in group by)
SELECT country,count(creditlimit) as max
from customers
group by country
having max>10
order by max desc
limit 3;


-- average credit limit >100000
SELECT country,avg(creditlimit) as av
from customers
group by country
having av>100000
order by av desc
limit 3;


-- 

