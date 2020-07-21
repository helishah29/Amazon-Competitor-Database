-- Two base tables are created first

-- For all the tables created: 
-- The NULL constraints
-- All the datatypes of columns
-- The Key Constraints
-- are defined clearly

USE AmazonCompetitor;

-- Table Customers
Create Table Customers
(
CustomerID int Not NULL Primary Key,
FirstName varchar(30) Not NULL,
LastName varchar(30) Not NULL,
UserName varchar(30) Not NULL,
LoginPassword varchar(10) Not NULL,
EmailAddress varchar(30) Not NULL,
ContactNumber varchar(10) Not NULL,
);

-- Table Products
Create Table Products
(
ProductID int Not NULL Primary Key,
ProductName varchar(20) Not NULL,
ProductDescription varchar(20) Not NULL,
Category varchar(20) Not NULL,
Price money NOT NULL,
);

