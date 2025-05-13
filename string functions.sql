-- CONCAT
select concat(contactfirstname,' ',contactlastname)
as full_name
from customers;


-- SUBSSTRING
select substring('Hello World',1,5);

-- UPPER
select upper('Hello')as upper_case;

-- LOWER
select lower('Hello')as lower_case;

-- LENGTH
select length('Hello') as length_string;

-- TRIM
select trim('.   Hello.   ');
select trim(leading '0' from '0001230');

-- REPLACE
select replace('Hello World','World','Universe');

-- INSERT
select instr('Hello World','World');


-- REVERSE
select reverse('Hello');

-- LEFT
select left('Hello World',5);

-- RIGHT
select right('Hello World',5);

-- LOCATE
select locate('o','Hello');


-- MATHEMATICAL FUNCTION
-- ABS(AbsoluteValue)
select abs(-10);


-- ROUND
select round(3.14159,2);

-- CEILING AND FLOOR
select ceiling(3.5),floor(3.5);

-- SORT
select sort(16);

-- POWER
select power(3,3);


-- Pow
select pow(3,3);

-- date and timing
-- NOW
SELECT NOW();

-- CURDATE
select curdate();

-- DATE_ADD
select date_add('2024-05-20',interval 1 month); -- Adds 1 month
select date_add('2024-05-20',interval 2 day);
select date_add('2024-05-20',interval 2 year);
select date_add('2024-05-20',interval -2 year);

-- CURTIME
select curtime();

-- DATEDIFFERENCE
select datediff('2024-05-20','2024-04-20');

-- DATE FORMATS
select date_format(now(),'%y-%m-%d');
select date_format(now(),'%d-%m-%y');
select date_format(now(),'%m-%d-%y');


-- DAY OF WEEK
select dayofweek('2024-11-07');
select dayofweek(now());  -- if you want your own customize date like monday as 1 then do sorting by adding new column (take help)



