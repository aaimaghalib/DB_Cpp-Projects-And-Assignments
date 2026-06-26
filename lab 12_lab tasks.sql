CREATE DATABASE companyDB;
USE companyDB;
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(50),
    Email VARCHAR(50),
    Position VARCHAR(30),
    Salary DECIMaL(10,2)
);
INSERT into employees (EmployeeID, FullName, Email, Position, Salary) VALUES
(1, 'John Doe', 'john.doe@example.com', 'Manager', 75000.00),
(2, 'Jane Smith', 'jane.smith@example.com', 'Developer', 60000.00),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'Designer', 55000.00),
(4, 'Bob Brown', 'bob.brown@example.com', 'Developer', 62000.00),
(5, 'Charlie Black', 'charlie.black@example.com', 'Tester', 50000.00);
SELECT CONCAT(FullName, ' - ', Email) as employeeInfo from employees;
select FullName, LENGTH(Email) as EmailLength from employees;
select FullName, SUBSTRING(Position, 1, 5) as PositionStart from employees;
select FullName, TRIM(FullName) as TrimmedName from Employees;
SELECT 'fullName ' AS Original,
 TRIM(' fullName') AS Trimmed,
 LTRIM(' fullName ') AS LeftTrimmed,
 RTRIM(' fullName ') AS RightTrimmed;
select FullName, replace(Position, 'Developer', 'Programmer') as UpdatedPosition from employees;
select FullName, POSITION('.com' in Email) as DotComPosition from Employees;
select FullName, left(Position, 3) as FirstThree, right(Position, 3) as LastThree from Employees;
sElect FullName, reverse(Email) as ReversedEmail from Employees;
Select FullName, format(Salary, 2) as FormattedSalary from Employees;



