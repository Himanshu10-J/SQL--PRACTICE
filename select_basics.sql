-- Day 1 of Learning SQL

-- 1 - Database.
-- What is Database?
-- A database is a place where data is stored in an organized way.
-- It helps to store, search, update, and delete data easily.
-- Data is stored in tables (rows and columns).

-- 2 - Table.
-- What is Table?
-- A table stores data in rows and columns.
-- Each row is one record, each column is one type of data.

-- 3 - Varaiables,
-- What are Variables?
-- Variables store values.
-- In SQL, columns act like variables for each row.
-- Variables such as Varchar, Int, Decimal, Date etc


-- Step 1: Create Database
CREATE DATABASE MYDB;
USE MYDB;

-- Step 2: Create Table
CREATE TABLE employee (
    employee_id INT ,
    first_name VARCHAR(50), --In VARCHAR we added (90) why? because we have to set specif limit of our word (Bracket) help to set limit
    last_name VARCHAR(50),
    email VARCHAR(50),
    hourly_pay DECIMAL(6,2), --DECIMAL is used to store exact numbers with decimal points. Use for mainy Money, Prices, and Salaries  
    hire_date DATE -- DATE is used to store calendar dates (year, month, day).
);

-- Day 2 of Learning SQL

-- Select Table
select * 
from employee;
-- Star(*) means all this help to select all data from table 
-- If we want to select specific columns
select first_name,last_name 
from employee;

-- We can Rename table
Rename table employee to workers;
-- i can rename again 
Rename table workers to employee;

-- We can also delete or drop table. We type
drop table employee;
-- Also we can drop or delete our DATABASE


-- 4 - Alter.
-- You can add, modify, or delete columns or constraints without deleting the table.

-- I am adding new column
Alter table employee
add departmeet varchar(50);

-- I can rename
Alter table employee
rename column department to email;

-- we can modify
Alter table employee
Modify email varchar(90);

-- We can move table from one place to another 
Alter table employee 
Modify email varchar(90)
after last_name;

-- INSERT ROWS
Insert into employee 
values (1, 'Himanshu', 'Joshi', 'azurehimmel01@gmail.com', 10.00, '2026-01-01');
select * from employee

-- we can insert as many as we want
Insert into employee
values (2, 'Mickey', 'Mouse', 'mickey01@gmail.com', 12.22, '2026-01-02'),
      (3, 'Jerry', 'Mouse', 'jerry02@gmail.com', 15.00, '2025-01-20'),
      (4, 'Tony', 'Stark', 'rich01@gmail.com', 20.00, '2025-01-12');;

-- Select 
Select first_name, last_name
from employee;

-- Where
select * 
from employee
where employee_id = 3;

select * 
from employee 
where first_name = 'Mickey';

select * 
from employee
where hourly_pay >= 15.00;

select * 
from employee
where hire_date <= '2026-01-12';

select * 
from employee
where employee_id != 1;



-- Update
update employee
set hourly_pay = 14.33
where employee_id = 1;

update employee
set hourly_pay = 14.33; --If i don't use where cmd , it will affect whole table

-- Delete
delete from employee; -- This will delete whole table.

delete from employee
where employee_id = 2; -- And this will delete only one row 



-- Current Date and Time
-- Iwill create table for this 

create table test(
    my_date date,
    my_time time,
    my_date date time
);

select * from test

insert into test 
values (current_date(),current_time(),now());
-- current_date() = This add todays date or current date.
-- current_time() = This return current time of day, without date
-- now() = This adds both current date and time.



-- A constraint is a rule applied to a table column to ensure valid data.
-- It restricts what values can be stored, helping maintain data integrity.
-- PRIMARY KEY,FOREIGN KEY,UNIQUE,NOT NULL,CHECk,DEFAULT


-- UnIQUE 
-- Ensures all values in a column are different
-- There are two way to add constraint 
-- 1st way.
create table product (
    product_id int,
    product_name varchar(50) UNIQUE,
    price decimal(4,2)
):

-- 2nd way

alter table product
add constraint
unique(product_name);

-- Every constraint have their unique way to add in table
