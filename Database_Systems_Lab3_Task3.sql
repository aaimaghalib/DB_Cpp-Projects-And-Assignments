-- Step 1: Create the database
CREATE DATABASE bank_db;
USE bank_db;

-- Step 2: Create the Employees table with specified constraints
CREATE TABLE Employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    desig VARCHAR(50) DEFAULT 'Probation',
    dept VARCHAR(50)
);

-- Step 3: Insert sample data as displayed in the images
INSERT INTO Employees (emp_id, name, desig, dept) VALUES
    (101, 'Raju', 'Manager', 'Loan'),
    (102, 'Sham', 'Cashier', 'Cash'),
    (103, 'Paul', 'Associate', 'Loan'),
    (104, 'Alex', 'Accountant','Account'),
    (105, 'Victor', 'Associate', 'Deposit');

-- Step 4: Display all data from the Employees table
SELECT emp_id, name, desig, dept FROM Employees;

-- Step 5: Display only emp_id and name
SELECT emp_id, name FROM Employees;

-- Step 6: Display data for emp_id 101 and 103
SELECT * FROM Employees WHERE emp_id IN (101, 103);

-- Step 7: Display data for emp_id 101
SELECT * FROM Employees WHERE emp_id = 101;

-- Step 8: Display only the name of emp_id 101
SELECT name, emp_id  FROM Employees WHERE emp_id = 101;

-- Step 9: Update the department for 'Paul' from 'Loan' to 'IT'
UPDATE Employees
SET dept = 'IT'
WHERE name = 'Paul';

-- Step 10: Delete records with the designation 'Associate' and display the updated list
DELETE FROM Employees WHERE desig = 'Associate';

-- Display all data after update and deletion
SELECT * FROM Employees;
