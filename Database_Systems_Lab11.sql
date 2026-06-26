-- Step 1: Create the database
CREATE DATABASE LabTasks;
-- Step 2: Use the database
USE LabTasks;
-- Step 3: Create the Employee table
CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY,
    EName VARCHAR(50),
    Designation VARCHAR(50),
    HireDate DATE,
    Salary INT,
    Comm INT,
    DeptNo INT,
    Age INT
);
-- Step 4: Insert sample data into the Employee table
INSERT INTO Employee (EmpNo, EName, Designation, HireDate, Salary, Comm, DeptNo, Age) VALUES
(1, 'SMITH', 'CLERK', '2010-12-17', 11000, 0, 20, 23),
(2, 'ALLEN', 'SALESMAN', '2011-02-20', 900, 1000, 30, 22),
(3, 'WARD', 'SALESMAN', '2010-02-20', 1000, 1250, 30, 22),
(4, 'JONES', 'MANAGER', '1990-01-05', 60000, 3000, 32, 28),
(5, 'WILLIAM', 'ADMIN. OFFICER', '2011-08-06', 40000, 2000, 18, 35),
(6, 'MARTIN', 'SR. OFFICE ASSISTANT', '1989-02-04', 35000, 1500, 19, 33),
(7, 'SCOTT', 'RECEPTIONIST', '2012-11-11', 18000, 0, 41, 25),
(8, 'TURNER', 'RECEPTIONIST', '2010-12-08', 20000, 0, 41, 24),
(9, 'FORD', 'RECEPTIONIST', '2013-10-31', 18000, 0, 41, 23),
(10, 'JAMES', 'TYPIST', '2018-05-11', 7600, 0, 42, 25),
(11, 'TURNER', 'PEON', NULL, 5000, 400, 43, 34),
(12, 'KING', 'ASSISTANT MANAGER', '2009-08-08', 47000, 0, 33, 37),
(13, 'BLAKE', 'CLERK', '2015-12-19', 10000, 600, 20, 24);

-- Step 5: Execute the lab tasks
-- 1. Average salary grouped by DeptNo
SELECT DeptNo, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY DeptNo;
-- 2. Group employees by Age and count employees in each age group
SELECT Age, COUNT(*) AS NumberOfEmployees
FROM Employee
GROUP BY Age;
-- 3. Total salary of employees with the Designation "Receptionist"
SELECT SUM(Salary) AS TotalSalary
FROM Employee
WHERE Designation = 'RECEPTIONIST';
-- 4. EmpNo and Salary with aliases
SELECT EmpNo AS "Employee Number", Salary AS "Salary in PKR"
FROM Employee;
-- 5. EName and Designation for employees with Age > 30
SELECT EName, Designation
FROM Employee
WHERE Age > 30;
-- 6. Employees where Comm is NULL or Comm = 0
SELECT *
FROM Employee
WHERE Comm IS NULL OR Comm = 0;
-- 7. Average salary of employees with Designation "CLERK"
SELECT AVG(Salary) AS AverageSalary
FROM Employee
WHERE Designation = 'CLERK';
-- 8. EName, Salary, and Designation of employees earning highest and lowest salary
SELECT EName, Salary, Designation
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee)
   OR Salary = (SELECT MIN(Salary) FROM Employee);
-- 9. Each Designation with average salary, sorted by average salary descending
SELECT Designation, AVG(Salary) AS AverageSalary
FROM Employee
GROUP BY Designation
ORDER BY AverageSalary DESC;
-- 10. Employees whose salary exceeds the average salary of their department
SELECT EName, DeptNo
FROM Employee AS e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employee
    WHERE DeptNo = e.DeptNo
);
-- 11. "Commission Percentage" column for employees with Comm > 0
SELECT EName, (Comm / Salary) * 100 AS "Commission Percentage"
FROM Employee
WHERE Comm > 0;
-- 12. EName, Age, and HireDate of the oldest employee
SELECT EName, Age, HireDate
FROM Employee
WHERE Age = (SELECT MAX(Age) FROM Employee);
-- 13. EName, HireDate, and Designation of the employee with the longest tenure
SELECT EName, HireDate, Designation
FROM Employee
WHERE HireDate = (SELECT MIN(HireDate) FROM Employee);
-- 14. Each DeptNo with total salary, average salary, and employee count
SELECT DeptNo, SUM(Salary) AS TotalSalary, AVG(Salary) AS AverageSalary, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY DeptNo;
-- 15. Unique Designations in alphabetical order
SELECT DISTINCT Designation
FROM Employee
ORDER BY Designation;
-- 16. EName, Salary, and Designation of the top 3 highest salaries
SELECT EName, Salary, Designation
FROM Employee
ORDER BY Salary DESC
LIMIT 3;
-- 17. Sort employees by DeptNo (ascending) and Salary (descending)
SELECT *
FROM Employee
ORDER BY DeptNo ASC, Salary DESC;
