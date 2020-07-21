USE AmazonCompetitor;
GO

CREATE Procedure SupplierOfProduct @ProductName VARCHAR(50) = NULL
AS
SELECT P.ProductName, S.SupplierID, SupplierName, SupplierEmail 
FROM ProductSupplier AS PS JOIN Products AS P ON P.ProductID = PS.ProductID 
JOIN Suppliers AS S ON PS.SupplierID = S.SupplierID
WHERE P.ProductName = @ProductName;
