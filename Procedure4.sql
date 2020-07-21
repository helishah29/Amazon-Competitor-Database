USE AmazonCompetitor;
GO

-- Stored procduere to find the customers that have atleast twi items in thier WishList
DROP PROCEDURE BigWishList;
GO

CREATE PROCEDURE BigWishList
AS
BEGIN
Select W.CustomerID, FirstName+' '+LastName AS CustomerName 
From WishList AS W Join Customers AS C ON W.CustomerId =C.CustomerId
Join
WishListMapping AS WM ON W.WishListID = WM.WishListID
WHERE (SELECT DISTINCT(WishListID) FROM WishListMapping )
END