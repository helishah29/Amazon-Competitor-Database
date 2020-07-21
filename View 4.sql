USE AmazonCompetitor;
GO

-- Show Users those are Paying through their CreditCards
CREATE VIEW PayCredit
AS
SELECT FirstName, OrderID, OrderPrice, CardType, CardCompany
FROM
Customers AS C JOIN Orders AS O ON O.CustomerID=C.CustomerID
JOIN CardDetails AS CD ON C.CustomerID=CD.CustomerID
WHERE CardType='Credit';
GO

SELECT * FROM PayCredit;