create database db;
use db;
CREATE TABLE customers (
Customer_ID INT PRIMARY KEY,
Customer_Name VARCHAR(100),
city VARCHAR(100),
country VARCHAR(100));
INSERT INTO customers (Customer_ID, Customer_Name, City, Country)
VALUES(1, 'John Doe', 'New York', 'USA'),
(2, 'Jane Smith', 'London', 'UK'),
(3, 'Alice Brown', 'Sydney', 'Australia'),
(4, 'Bob White', 'Toronto', 'Canada'),
(5, 'Charlie Green', 'Paris', 'France');
CREATE TABLE orders (
Order_ID INT PRIMARY KEY,
Customer_ID INT,
Order_Date DATE,
Amount INT,
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID));
INSERT INTO orders (Order_ID, Customer_ID, Order_Date, Amount)
VALUES(101, 1,'2024-01-01', 1500),
(102, 2,'2024-01-03', 2000),
(103, 1,'2024-01-05', 2500),
(104, 3, '2024-01-07', 1800),
(105, 4, '2024-01-10', 3000),
(106, 5, '2024-01-15', 1200);
Select *from Customers,Orders;
SELECT Orders.OrderID,Orders.OrderDate,Orders.Amount,Customers.CustomerName 
FROM Orders INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT Orders.OrderID, Orders.OrderDate, Orders.Amount, Customers.CustomerName
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
SELECT Customers.CustomerName, Customers.City, Customers.Country, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Customers.City, Customers.Country, Orders.OrderID, Orders.OrderDate, Orders.Amount
FROM Customers RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate,Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID;
SELECT Customers.CustomerName,Orders.OrderID,Orders.Amount
FROM Customers
INNER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
WHERE Orders.Amount > 2000;
SELECT C1.CustomerName AS Customer1, 
C2.CustomerName AS Customer2, O1.Amount
FROM Orders O1 JOIN Orders O2
ON O1.Amount = O2.Amount 
AND O1.OrderID < O2.OrderID
JOIN Customers C1
ON O1.CustomerID = C1.CustomerID
JOIN Customers C2
ON O2.CustomerID = C2.CustomerID;
SELECT Customers.CustomerName, Customers.City
FROM Customers
UNION ALL
SELECT  null,Orders.Amount
FROM Orders;
SELECT CustomerName, City, NULL AS Amount
FROM Customers
UNION ALL
SELECT NULL AS CustomerName, NULL AS City, Amount
FROM Orders;
CREATE TABLE VIP_Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100));
INSERT INTO VIP_Customers (CustomerID, CustomerName)
VALUES (1, 'John Doe'),
(3, 'Alice Brown'),
(5, 'Charlie Green');
SELECT Customers.CustomerName
FROM Customers
INNER JOIN VIP_Customers
ON Customers.CustomerName = VIP_Customers.CustomerName;
SELECT Customers.CustomerName, Orders.Amount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Orders.Amount > 1500;
SELECT Customers.CustomerName, SUM(Orders.Amount) AS TotalAmount
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;
SELECT DISTINCT C1.CustomerName
FROM Customers C1
JOIN Customers C2
ON C1.City = C2.City AND C1.CustomerID <> C2.CustomerID
JOIN Orders
ON C1.CustomerID = Orders.CustomerID
WHERE Orders.Amount > 2000;
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName;
