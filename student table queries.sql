use samplecda;
show tables;
select * from studentsperformance;

-- insert
insert into studentsperformance values(
'female','group c','unemployed','free','compleeeeted',900,4546,5655
);


select * from studentsperformance;

-- alter
alter table studentsperformance
add id int;
select * from studentsperformance;

-- drop
ALTER TABLE studentsperformance DROP COLUMN id;

-- auto increment
ALTER TABLE studentsperformance 
ADD id INT PRIMARY KEY AUTO_INCREMENT;
select * from studentsperformance;




-- update,set and where
update studentsperformance
set lunch='standardmomo'
where id=1;
select * from studentsperformance;

-- modify datatype
ALTER TABLE studentsperformance modify gender varchar(50);
describe studentsperformance;
select * from studentsperformance;

-- rename column
ALTER TABLE studentsperformance rename column lunch to lunchdesc;
describe studentsperformance;
select * from studentsperformance;

-- rename table
ALTER TABLE studentsperformance rename to studper;
describe studper;
select * from studper;

-- select whole table
select * from studper;

-- select specific columns in tables
SELECT id, gender, lunchdesc, `race/ethnicity` ,`math score`
FROM studper;

-- distinct
select distinct gender from studper;

-- select where
select * from studper;
select * from studper
where `writing score`>50;

-- AND
select * from studper
where `writing score`>50 and gender='female';


-- OR
select * from studper
where `writing score`>70 or gender='female';


-- NOT
select * from studper
where not `race/ethnicity`='group C';


-- order by
select * from studper
where `test preparation course`='none'
order by `race/ethnicity`;


-- NULL AND OT NULL
select * from studper
where `test preparation course` is null;
select * from studper
where `test preparation course` is not null;

-- LIMIT
select * from studper
where `test preparation course`='completed'
order by `math score` desc
limit 1;

select * from studper
where `test preparation course`='completed'
order by `math score` desc
limit 10;

select * from studper
where `test preparation course`='completed'
order by `math score` desc
limit 5,3;


