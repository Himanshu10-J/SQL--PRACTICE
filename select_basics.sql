-- Day 1 of Learning SQL

-- Today's Agenda:
-- 1. Create a Database
-- 2. Create a Table
-- 3. Learn basic data types

-- What is Database?
-- A database is a place where data is stored in an organized way.
-- It helps to store, search, update, and delete data easily.
-- Data is stored in tables (rows and columns).

-- What is Table?
-- A table stores data in rows and columns.
-- Each row is one record, each column is one type of data.

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
