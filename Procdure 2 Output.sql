USE AmazonCompetitor;
GO
EXEC SupplierOfProduct @ProductName = 'Tshirt';
-- for referring the correctness of result
SELECT * FROM Products;
SELECT * FROM ProductSupplier;
SELECT * FROM Suppliers;