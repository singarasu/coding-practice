-- ====================================================================
-- Coding Practice: SQL Problems & Query Log
-- ====================================================================
-- Author: singarasu
-- Repository: coding-practice
-- Purpose: SQL query practice, database design, analytics, CTEs & window functions
-- ====================================================================

-- --------------------------------------------------------------------
-- Template for Practice Entry:
-- --------------------------------------------------------------------
-- Date / Session: Session 01
-- Platform / Topic: e.g., LeetCode SQL 50 / Window Functions / Aggregations
-- Problem: Second Highest Salary / Department Top Performers
-- Difficulty: Easy / Medium / Hard
-- --------------------------------------------------------------------

-- Session 01: Starter Example - Department Highest Salary with Window Functions
/*
Problem Statement:
Find employees who have the highest salary in each of the departments.
*/

-- 1. Schema & Sample Data Setup
CREATE TABLE IF NOT EXISTS Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT
);

CREATE TABLE IF NOT EXISTS Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- 2. Query Solution using Common Table Expression (CTE) & DENSE_RANK()
WITH RankedSalaries AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank
    FROM Employee e
    JOIN Department d ON e.department_id = d.id
)
SELECT 
    Department,
    Employee,
    Salary
FROM RankedSalaries
WHERE salary_rank = 1;

-- --------------------------------------------------------------------
-- Add your practice queries below:
-- --------------------------------------------------------------------


-- --------------------------------------------------------------------
-- Session 02: SQL Basics - SELECT Statement
-- --------------------------------------------------------------------
-- Problem:
-- Retrieve specific columns from the Employees table using SELECT.
-- --------------------------------------------------------------------

-- 1. Create the Employees table
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);

-- 2. Insert sample records
INSERT INTO Employees (employee_id, name, department, salary)
VALUES
    (101, 'Arun', 'IT', 25000),
    (102, 'Priya', 'HR', 30000),
    (103, 'Kumar', 'Sales', 28000),
    (104, 'Divya', 'IT', 35000),
    (105, 'Ravi', 'Finance', 32000);

-- 3. Practice queries

-- Q1. Display all columns from the Employees table.
SELECT *
FROM Employees;

-- Q2. Display only the Name column.
SELECT name
FROM Employees;

-- Q3. Display Name and Salary columns.
SELECT name, salary
FROM Employees;

-- Q4. Display Employee_ID and Department columns.
SELECT employee_id, department
FROM Employees;

-- Q5. Display Name, Department and Salary columns.
SELECT name, department, salary
FROM Employees;
