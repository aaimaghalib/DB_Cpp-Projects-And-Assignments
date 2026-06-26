CREATE DATABASE Task1;
USE Task1;
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    CreditHours INT
);
INSERT INTO Courses (CourseID, CourseName, CreditHours) VALUES
(1, 'Mathematics', 3),
(2, 'Physics', 4),
(3, 'Chemistry', 3),
(4, 'Biology', 4),
(5, 'Computer Science', 3);
SELECT * FROM Courses;