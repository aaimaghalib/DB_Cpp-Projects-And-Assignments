create database LAB14;
use LAB14;
CREATE TABLE Employee (
EmployeeID INT,
Name VARCHAR(50),
Department VARCHAR(50),
Salary INT);
INSERT into Employee(EmployeeID,Name,Department,Salary)
Values(1,"Alice","HR",55000),
(2,"Bob","IT",70000),
(3,"Charlie","Sales",50000),
(4,"Diana","IT",75000),
(5,"Eve","HR","58000"),
(6,"John","IT","52000");
CREATE TABLE Department(
DepartmentID INT,
Name VARCHAR(50)
);
INSERT into Department(DepartmentID,Name)
Values(1,"HR"),
(2,"IT"),
(3,"Sales");
CREATE VIEW EmployeeInfo AS
SELECT Name, Department
FROM Employee;
SELECT * FROM EmployeeInfo;
CREATE VIEW EmployeeDepartmentInfo AS
SELECT 
e.EmployeeID,
e.Name,
d.DepartmentID,
d.name AS DepartmentName,
e.salary,
(SELECT MAX(salary) FROM employee e2 WHERE e2.department = e.department) AS MAXSALARY
FROM employee e 
JOIN department d ON e.department = d.DepartmentID;
CREATE VIEW EmployeeDetails AS
SELECT Name, Salary
FROM Employee
WHERE Department = "HR";
CREATE OR REPLACE VIEW EmployeeDetails AS
SELECT name,salary from employee where Department = "IT"AND sALARY>6000;
UPDATE EmployeeDetails SET salary=80000 WHERE name ="Bob";
DROP  View EmployeeDetails;
CREATE VIEW HR_EMPLOYEE AS
SELECT NAME,SALARY FROM EMPLOYEE WHERE Department="HR";
SELECT*FROM HR_EMPLOYEE;
CREATE VIEW TOP_EARNERS AS
SELECT NAME,SALARY FROM EMPLOYEE WHERE SALARY>70000;
SELECT*FROM TOP_EARNERS;
CREATE OR REPLACE VIEW TOP_EARNERS AS Select
Name,Salary From Employee WHERE salary >75000;
SELECT*FROM TOP_EARNERS;
CREATE OR REPLACE VIEW HR_EMPLOYEE AS SELECT NAME,SALARY,DEPARTMENT FROM Employee;
Select *From HR_EMPLOYEE;
Drop VIEW HR_EMPLOYEE;
CREATE VIEW High_Salaries AS
SELECT EmployeeID,Name,Department,Salary
FROM Employee WHERE Salary > ALL(SELECT Salary FROM Employee WHERE Department ="HR");
CREATE VIEW TopSalaries AS
SELECT EmployeeID,Name,Department,Salary FROM Employee
WHERE Department ="IT"AND Salary>ALL(SELECT Salary FROM Employee WHERE Department ="Sales");
CREATE VIEW Employees_With_Departments AS 
SELECT Name, Salary FROM Employees
WHERE EXISTS (SELECT *FROM Department WHERE Department.Name = Employees.Department);
CREATE VIEW Employees_Without_Departments AS SELECT Name, SalaryFROM Employees
WHERE NOT EXISTS (SELECT *FROM Department WHERE Department.Name = Employees.Department);
CREATE VIEW Department_Salary_Stats AS
SELECT Department,SUM(Salary) AS Total_Salary,AVG(Salary) AS Average_Salary,COUNT(EmployeeID) AS NumberEmployees
FROM Employee GROUP BY Employee.Department;
SELECT*FROM Department_Salary_Stats;
CREATE VIEW High_Earners_By_Department AS
SELECT EmployeeID,Name,Department,Salary
FROM Employee WHERE Salary>(SELECT AVG(Salary) FROM Employee WHERE Department = Employee.Department);
SELECT*FROM High_Earners_By_Department;






