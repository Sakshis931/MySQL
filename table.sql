create database mytest;
use mytest;
create table mytestdb(
rollno int,fname varchar(50),lname char(50)
);
use mytest;
select rollno, fname, lname from mytestdb;

insert into mytestdb(rollno,fname,lname)
values(1,'Rakesh','Gopal');
select rollno, fname, lname from mytestdb;

insert into mytestdb(rollno,fname,lname)
values(1,'Rakesh','Gopal'),(2,'ram','shyam');
select rollno, fname, lname from mytestdb;

