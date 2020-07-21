USE AmazonCompetitor;
GO
-- This view desplays all the Customeers who placed and order and their respective order deatils
CREATE VIEW CustomerOrders 
AS
SELECT FirstName + ' ' + LastName AS CustomerName, OrderID, OrderPrice, OrderStatus 
FROM Customers AS C JOIN Orders AS A ON C.CustomerID = A.CustomerID

GO
SELECT * FROM CustomerOrders;
