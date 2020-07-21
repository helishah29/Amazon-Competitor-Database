USE AmazonCompetitor;
GO
-- Gives the address of a customer based on Customers and Address table
CREATE Procedure CustomerAddress @State VARCHAR (30) = NULL
AS
SELECT C.CustomerID, StreetAddress1, City, ZipCode
FROM Address AS A JOIN Customers AS C ON A.CustomerID = C.CustomerID
WHERE A.AddressState = @State;
