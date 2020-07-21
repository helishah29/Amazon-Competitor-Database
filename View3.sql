USE AmazonCompetitor;
GO

-- Customer Rating Details View
CREATE VIEW CustomerRating 
AS
SELECT C.CustomerID, FirstName + ' ' + LastName AS CustomerName, Rating, 
CustomerNotes, ProductName 
FROM Review AS R JOIN Customers AS C ON C.CustomerID = R.CustomerID JOIN
Products AS P ON R.ProductID = P.ProductID; 
GO

SELECT * FROM CustomerRating;