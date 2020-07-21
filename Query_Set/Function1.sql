USE AmazonCompetitor;
GO

-- Using 2 predefined aggregate funtions
-- This query makes use of built-in aggregate functions like MIN and MAX
-- Simple select statement is executed to get costliest order and least cost order placed by a customer.

SELECT  MAX(OrderPrice) AS CostliestOrder, 
MIN(OrderPrice) AS CheapestOrder  
FROM Orders; 

