CREATE DATABASE  Lab2;
USE Lab2;
CREATE TABLE Student (
    RegistrationNumber VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Session INT,
    CGPA DECIMAL(3, 2),
    Address VARCHAR(100)
);
INSERT INTO Student (RegistrationNumber, Name, Department, Session, CGPA, Address) VALUES
('R001', 'John Doe', 'Computer Science', 2022, 3.5, '123 Main St'),
('R002', 'Jane Smith', 'Information Technology', 2022, 3.7, '456 Maple Ave'),
('R003', 'Alice Johnson', 'Software Engineering', 2023, 3.9, '789 Pine Rd'),
('R004', 'Bob Brown', 'Computer Science', 2023, 3.4, '101 Oak St'),
('R005', 'Charlie Davis', 'Information Technology', 2024, 3.2, '234 Elm St'),
('R006', 'Daisy White', 'Computer Science', 2024, 3.8, '567 Cedar Ave'),
('R007', 'Eve Black', 'Software Engineering', 2022, 3.6, '890 Birch Rd'),
('R008', 'Frank Green', 'Information Technology', 2023, 3.1, '345 Spruce St'),
('R009', 'Grace Lee', 'Computer Science', 2024, 3.5, '678 Walnut Ave'),
('R010', 'Hank Kim', 'Software Engineering', 2023, 3.3, '901 Cherry St');
INSERT INTO Student (RegistrationNumber, Name, Department, Session, CGPA, Address)
VALUES ('R011', 'Ivy Wilson', 'Computer Science', 2024, 3.6, '202 Pineapple St');
UPDATE Student
SET CGPA = 3.9
WHERE RegistrationNumber = 'R001';
SELECT * FROM Student;
SELECT * FROM Student WHERE RegistrationNumber = 'R002';
DELETE FROM Student WHERE RegistrationNumber = 'R010';