CREATE DATABASE SchoolManagement;

USE SchoolManagement;

CREATE TABLE Students (
		
        StudentID INT NOT NULL PRIMARY KEY,
        StudentName VARCHAR(50) NOT NULL,
        StudentAge INT CHECK(StudentAge >= 4),
        Email VARCHAR(50) UNIQUE
);

CREATE TABLE Courses (

		CourseID INT NOT NULL PRIMARY KEY,
        CourseName VARCHAR(50) NOT NULL,
        CreditHours INT CHECK(CreditHours > 0 AND CreditHours <= 3)
);

CREATE TABLE Enrollments (

		EnrollmentID INT NOT NULL PRIMARY KEY,
        StudentID INT NOT NULL,
        FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
        CourseID INT NOT NULL,
        FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
        EnrollmentDate DATE
);

INSERT INTO Students (StudentID, StudentName, StudentAge, Email)
VALUES
(1, "Aaima Ghalib", 21, "ag24@gmail.com"),
(2, "Nayab Khan", 20, "nk12@gmail.com"),
(3, "Saniya Isaq", 20, "si12@gmail.com"),
(4, "Iresha Khanam", 70, "ik12@gmail.com"),
(5, "Adeela Khanzada", 14, "ak12@gmail.com");

DESC Students;

INSERT INTO Courses (CourseID, CourseName, CreditHours)
VALUES
(10, "Marketing", 3),
(11, "Sales&Texttiles", 3),
(12, "Mass Communication", 3),
(13, "Negotiation", 3),
(14, "Leadership Skills", 3);

DESC Courses;

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(20, 1, 10, CURDATE()),
(21, 1, 11, CURDATE()),
(22, 5, 14, CURDATE()),
(23, 1, 14, CURDATE()),
(24, 1, 13, CURDATE());

DESC Enrollments;

SELECT * FROM Enrollments;
SELECT * FROM Students;
SELECT * FROM Courses;
