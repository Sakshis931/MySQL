use classicmodels;

show tables;

select * from customers;

select contactlastname,contactfirstname,creditlimit
from customers;

show tables;
select * from offices;

select city,phone,country 
from offices;

show tables;
select * from employees;

select  email,jobtitle 
from employees;

select distinct(country)
from customers;

show tables;
select * from products;

select distinct(productline)
from products;

select * from products;
select distinct(productvendor)
from products;

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit>150000;

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit<30000;

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit=0;

select * from customers;
select contactlastname,contactfirstname,creditlimit,country
from customers
where country='usa';


select * from customers;
select contactlastname,contactfirstname,creditlimit,country
from customers
where country='spain';

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit>=100000 and creditlimit<=150000  ;

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit<50000 and country='UK' ;

select contactlastname,contactfirstname,creditlimit
from customers
where creditlimit>=150000 and country='usa' ;


select contactlastname,contactfirstname,creditlimit
from customers
where country='usa' or country='uk' or country='australia';


select * from customers
where country='usa' or country='uk' or country='australia';

show tables;
select * from products;

select quantityinstock,productvendor,productline
from products
where quantityinstock>5000;


select quantityinstock,productvendor,productline
from products
where productvendor='red start diecast';


select * from products
where productvendor='red start diecast';

select * from products
where productline='planes';


select * from products
where productname='1900s Vintage Bi-Plane';


select contactlastname,contactfirstname,creditlimit
from customers
order by creditlimit desc;

-- comment
select contactlastname,contactfirstname,creditlimit
from customers
order by creditlimit asc;

select contactlastname,contactfirstname,creditlimit
from customers
order by contactfirstname asc;


select contactlastname,contactfirstname,creditlimit
from customers
order by contactlastname desc;

select contactlastname,contactfirstname,creditlimit,country
from customers
where country='usa' 
order by creditlimit desc;

select contactlastname,contactfirstname,creditlimit,state
from customers
where state is null;

select contactlastname,contactfirstname,creditlimit,state
from customers
where state is not null;

select contactlastname,contactfirstname,creditlimit,state
from customers
limit 5;

select contactlastname,contactfirstname,creditlimit,state
from customers
limit 3,2;  -- 3 skip 2 show

select contactlastname,contactfirstname,creditlimit,state
from customers
limit 2 offset 3; -- show 2 after skipping 3

-- fetch customer details whose creaditlimit is 4th highest values
select * from customers
order by creditlimit desc
limit 10;

select * from customers
order by creditlimit desc
limit 5,3;




select * from customers
order by creditlimit desc;

select * from customers
order by creditlimit desc
limit 9,1;
