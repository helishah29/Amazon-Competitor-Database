USE AmazonCompetitor;
GO

CREATE ROLE EntryOfProduct;
GRANT UPDATE
ON Products
TO EntryOfProduct;
GRANT INSERT,UPDATE
ON Orders
TO EntryOfProduct;

ALTER ROLE db_datareader ADD MEMBER EntryOfProduct;

USE AmazonCompetitor;
CREATE LOGIN DBMS WITH PASSWORD = 'Heli@123#',
DEFAULT_DATABASE = AmazonCompetitor;

CREATE USER Heli FOR LOGIN DBMS;
ALTER ROLE EntryOfProduct ADD MEMBER Heli;
