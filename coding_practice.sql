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


CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT
);

INSERT INTO Employees (employee_id, name, department, salary)
VALUES
    (101, 'Arun', 'IT', 25000),
    (102, 'Priya', 'HR', 30000),
    (103, 'Kumar', 'Sales', 28000),
    (104, 'Divya', 'IT', 35000),
    (105, 'Ravi', 'Finance', 32000);

SELECT *
FROM Employees;

SELECT name
FROM Employees;

SELECT name, salary
FROM Employees;

SELECT employee_id, department
FROM Employees;

SELECT name, department, salary
FROM Employees;

#---DAY 02---

create table employee (
employee_id int primary key,
name varchar(50),
department varchar(50),
salary int
);

insert into employee value
(101,'arthur','cowboy',10000),
(102,'fraklin','robber',50000),
(103,'traver','dopeguy',20000),
(104,'jason','plumber',30000);

select * from employee;

----OUTPUT----
employee_id,name,department,salary
101,arthur,cowboy,10000
102,fraklin,robber,50000
103,traver,dopeguy,20000
104,jason,plumber,30000

			
