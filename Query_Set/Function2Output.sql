USE AmazonCompetitor;
GO
 -- Using the User defined function fnPoorRating that we just craeted.
 -- In this SELECT Query to use the return value formt hat function

 SELECT C.CustomerID, FirstName, ReviewID, CustomerNotes, Rating
 FROM Customers AS C JOIN Review AS R ON C.CustomerID=R.CustomerID
 WHERE Rating=dbo.fnPoorRating();