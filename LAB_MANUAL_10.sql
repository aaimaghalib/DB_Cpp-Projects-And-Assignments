-- Create Database and Table
CREATE DATABASE EmployeeDB;
USE EmployeeDB;

CREATE TABLE Employee (
    EmpNo INT PRIMARY KEY,
    EName VARCHAR(50),
    Designation VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Comm DECIMAL(10, 2),
    DeptNo INT,
    Age INT
);

-- Insert Values into Employee Table
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

-- Task 1: Find all distinct combinations of Designation and DeptNo
SELECT DISTINCT Designation, DeptNo FROM Employee;

-- Task 2: Display employees ordered by their Comm (Commission) in descending order
SELECT * FROM Employee ORDER BY Comm DESC;

-- Task 3: Display employees ordered by Age in ascending order and Salary in descending order
SELECT * FROM Employee ORDER BY Age ASC, Salary DESC;

-- Task 4: Display employees in ascending order by DeptNo and alphabetically by their names (EName) within each department
SELECT * FROM Employee ORDER BY DeptNo ASC, EName ASC;

-- Task 5: Find employees whose names do not start with the letter "T"
SELECT * FROM Employee WHERE EName NOT LIKE 'T%';

-- Task 6: Find all designations that start with a vowel (A, E, I, O, U)
SELECT DISTINCT Designation 
FROM Employee 
WHERE Designation LIKE 'A%' OR Designation LIKE 'E%' 
   OR Designation LIKE 'I%' OR Designation LIKE 'O%' 
   OR Designation LIKE 'U%';

-- Task 7: Find employees whose names contain exactly two occurrences of the letter "E"
SELECT * FROM Employee 
WHERE EName LIKE '%E%E%' AND EName NOT LIKE '%E%E%E%';

-- Task 8: Find all designations where the second letter is "L"
SELECT DISTINCT Designation FROM Employee WHERE Designation LIKE '_L%';

-- Task 9: Find employees whose names contain both letters "A" and "R", in any order
SELECT * FROM Employee WHERE EName LIKE '%A%' AND EName LIKE '%R%';

-- Task 10: Retrieve the last 5 records from the Employee table
SELECT * FROM Employee ORDER BY EmpNo DESC LIMIT 5;

-- Task 11: Retrieve records 6 through 10 from the Employee table
SELECT * FROM Employee LIMIT 5 OFFSET 5;

-- Task 12: Retrieve the top 3 employees with the highest salary
SELECT * FROM Employee ORDER BY Salary DESC LIMIT 3;

-- Task 13: Count the number of employees with a commission greater than 500
SELECT COUNT(*) FROM Employee WHERE Comm > 500;

-- Task 14: Count the number of employees who have not provided their HireDate
SELECT COUNT(*) FROM Employee WHERE HireDate IS NULL;

-- Task 15: Count how many employees have a Salary greater than 20,000 and are younger than 30 years old
SELECT COUNT(*) FROM Employee WHERE Salary > 20000 AND Age < 30;

-- Task 16: Find all employees with the same Age as "FORD"
SELECT * FROM Employee WHERE Age = (SELECT Age FROM Employee WHERE EName = 'FORD');

-- Task 17: Count the number of employees who have both a commission and a salary greater than 10,000
SELECT COUNT(*) FROM Employee WHERE Comm > 10000 AND Salary > 10000;

-- Task 18: Display the third lowest salary in the Employee table
SELECT DISTINCT Salary FROM Employee ORDER BY Salary ASC LIMIT 1 OFFSET 2;

-- Task 19: Count the number of employees hired after 2010
SELECT COUNT(*) FROM Employee WHERE HireDate > '2010-12-31';

-- Task 20: Find all employees whose names contain the letter "A" at least twice
SELECT * FROM Employee WHERE EName LIKE '%A%A%';
