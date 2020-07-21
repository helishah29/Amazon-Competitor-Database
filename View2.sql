USE AmazonCompetitor;
GO

-- Describes the count of Products that are maximum rated from User's ratings
CREATE VIEW Top3RatedProducts
AS
SELECT TOP 3 COUNT(R.ProductID) AS ProductID
FROM Review AS R JOIN Products AS P ON R.ProductID = P.ProductID
GROUP BY P.ProductID
ORDER BY COUNT(R.Rating) DESC;
GO

SELECT * FROM Top3RatedProducts;
