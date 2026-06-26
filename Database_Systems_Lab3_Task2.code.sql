-- Step 1: Create Database
CREATE DATABASE Task2;
USE Task2;

-- Step 2: Create Table Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerName VARCHAR(50)
);

-- Step 3: Insert Data into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerName) VALUES
(1, 'HR', 'Alice'),
(2, 'IT', 'Bob'),
(3, 'Finance', 'Carol'),
(4, 'Marketing', 'Dave'),
(5, 'Operations', 'Eve');

-- Step 4: Display Data in Departments Table
SELECT * FROM Departments;
