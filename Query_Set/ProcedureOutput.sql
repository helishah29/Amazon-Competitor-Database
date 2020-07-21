USE AmazonCompetitor;
GO
-- For refrence to undrstand the results
SELECT * FROM Review;
EXEC HighRatedProduct @MaxRating = 4.0, @MinRating = 1.0;
EXEC HighRatedProduct @MaxRating = 9;
