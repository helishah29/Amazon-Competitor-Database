-- Created procedure to return products that have ratings in between some specified rating values.
-- Those specified ratings are MinRating and MaxRating
-- If no min rating is provided, it will display product details having rating as max rating.
USE AmazonCompetitor;
GO
-- P1
CREATE Procedure HighRatedProduct @MaxRating FLOAT = 0.0, @MinRating FLOAT = 0.0
AS
IF @MinRating = 0
BEGIN
	SELECT C.CustomerID,ProductName, P.ProductID, R.Rating, R.CustomerNotes
	FROM Customers AS C JOIN Review AS R ON C.CustomerID = R.CustomerID JOIN
	Products AS P ON R.ProductID = P.ProductID
	WHERE Rating = @MaxRating 
	ORDER BY Rating DESC;
END;
ELSE
BEGIN
SELECT C.CustomerID,ProductName, P.ProductID, R.Rating, R.CustomerNotes
	FROM Customers AS C JOIN Review AS R ON C.CustomerID = R.CustomerID JOIN
	Products AS P ON R.ProductID = P.ProductID
WHERE Rating BETWEEN @MinRating AND @MaxRating
	ORDER BY Rating DESC;
END;
