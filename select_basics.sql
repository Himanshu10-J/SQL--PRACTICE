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
-- Every constraint have their unique way to add in table

-- UNIQUE 
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


-- For example
insert into products
values (01,'Pizza',1.99),
       (02,'Pizza',1.29);
-- It will show error because here product_name 'Pizza' is repeating in two rows.
-- According all values should different.

-- It should be like
insert into products
values (01,'Apple',2.99),
       (02,'Watermelon',3.00);


-- NOT NULL
-- NOT NULL means a column must always have a value and cannot be empty
-- 1st way
create table product (
    product_id int,
    product_name varchar(50) UNIQUE,
    price decimal(4,2) NOT NULL
):

--2nd way
alter table product 
modify price decimal(4,2) NOT NULL;


-- example
insert into product
values (01,'Chair'NULL);
-- NULL = It's used for empty column for ex like i have fill any column 
-- but i don't have any values we used null nu in not null we can't fill null
-- it will error so we have to fill values in column for reslut


-- it should be like
insert into product
values (01,'Chair',0.00);

-- Check constraint
-- A CHECK constraint ensures that a column’s value follows a rule you define.
-- 1st way 
create table employees(
    employee_id int,
    firt_name varchar(50),
    last_name varchar(50),
    hourly_pay decimal(4,2),
    hire_date date,
    constraint PAYMENT check (hourly_pay >= 11.00)
    
);

-- 2nd way
alter table employees
add constraint PAYMENT check (hourly_pay >= 11.00);

-- Example
insert into employees
values (01,'Himanshu','Joshi',7.00,current_date());
-- It will show error becuase 
-- according to our constraint check 
-- hourly_pay should higher than 11.00 or equal to 11.00
-- but in this command our hourly_pay is lower than 11.00.


-- It should be like
insert into employees
values (01,'Himanshu','Joshi',12.00,current_date());

-- Default
-- The DEFAULT constraint is used to automatically assign a value to a column when no value is given during an INSERT operation

create table product ( 
    product_name varchar(50),
    price decimal(4,2) default 0    
    );

-- 2nd way
alter table product
modify price deccimal(4,2) default 0.00

-- Example
insert into prodecut
values ('Chips');
-- It wull show error 
-- It's because when we inerting products we adding
-- so it looks like this

insert into products (product_name) -- 
values ('chips')


-- Primary key
create table transactions (
    transaction_id int PRIMARY KEY,
    amount decimal(5,2)
);

-- 2nd way
alter table transactions
add constraint
PRIMARY KEY(transaction_id);

-- Example
insert into transactions
values (100,233.30),
       (101,322.00),
       (101,300.00);

-- This will show error because primary is like unique + Not null 
-- this if we put null in values it will be error
-- Example
ininsert into transactions
values (100,233.30),
       (101,322.00),
       (null,300.00);

-- So we have to use new id all the time and we can't left place empty
-- It should looks like
insert into transactions
values (100,233.30),
       (101,322.00),
       (102,300.00);

-- Only one primary key per table
-- example
create table students (
    Roll_No int primary key,
    course_id int primary key,
    student_name varchar(50)
);

-- this is wrong there are two primary key in table students 
-- Because of this we use Composite primary key

create table students (
    Roll_No int ,
    course_id int ,
    student_name varchar(50),
    primary key(Roll_No,course_id)
);

-- in this way we can add as many column in single primary key

-- AUTO_INCREMENT
-- AUTO_INCREMENT automatically generates the next number for a column whenever a new row is inserted.

-- 1ST WAY
create table transactions (
    transaction_id int primary key auto_increment,
    amount int
);

-- 2nd way
alter table transactions
modify transactio








-- 















