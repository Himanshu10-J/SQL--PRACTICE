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









































