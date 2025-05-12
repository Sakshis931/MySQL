use samtest;
c
-- 1.average salary
select avg(salary) from HRData;

-- 2. fetch empoyee details whose salary is greater than average salary
select empid,ename,depid,avg(salary) as avgsal
from HRData
where salary> avgsal;

select *
from HRData
where salary> (select avg(salary) from HRData);

-- 3. find out the second highest salary
select *
from HRData
order by salary desc
limit 1,1;

select *
from HRData
where salary=(select max(salary) from HRData
where salary<(select max(salary) from HRData));


-- 4. fetch the admin depatment employee details
use samtest;

select *
from department;

select depid
from department
where dname='Admin'
select * from HRData 
where depid='D3';

select * from HRData
where depid=(select depid from department
where dname='admin');

-- 5.find out the customer details whose creditlimit is >avg creditlimit

-- 6. find out the customer details whose order is cancelled

-- 7. find out the customer details who purchase classic cars

-- JOIN
select * from HRData;
select * from department;
-- 1. INNER JOIN
select h.empid,h.ename,h.salary,d.depid,d.dname,h.depid
from HRData as h inner join department as d
on h.depid=d.depid;

select h.empid,h.ename,h.salary,d.depid,d.dname
from HRData as h inner join department as d
on h.depid=d.depid;

-- LEFT JOIN
select h.empid,h.ename,h.salary,d.depid,d.dname
from HRData as h LEFT join department as d
on h.depid=d.depid;

-- Right JOIN
select h.empid,h.ename,h.salary,d.depid,d.dname
from HRData as h right join department as d
on h.depid=d.depid;

-- FULL OUTER JOIN
select h.empid,h.ename,h.salary,d.depid,d.dname
from HRData as h LEFT join department as d
on h.depid=d.depid
union
select h.empid,h.ename,h.salary,d.depid,d.dname
from HRData as h right join department as d
on h.depid=d.depid;


-- CROSS JOIN
select * from HRData cross join department;


select * from employee1;

-- Homework based on JOINS

-- fetch all common details from customer and order table

-- select all details to purchase classic cars


