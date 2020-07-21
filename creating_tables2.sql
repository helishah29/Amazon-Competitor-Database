-- All other tables are created now and given thier respective references according to the design

-- For all the tables created: 
-- The NULL constraints
-- All the datatypes of columns
-- The Key Constraints
-- are defined clearly

USE AmazonCompetitor;

-- Table Address for storing Customer's Address
Create Table Address
(
AddressID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Customers(CustomerID),
StreetAddress1 varchar(30) Not NULL,
StreetAddress2 varchar(30) Not NULL,
City varchar(30) Not NULL,
AddressState varchar(10) Not NULL,
Country varchar(30) Not NULL,
ZipCode int Not NULL,
);

-- Table CardDetails for storing Customer's Payment Information
Create Table CardDetails
(
CardID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Customers(CustomerID),
CardNumber varchar(16) Not NULL,
CardName varchar(30) Not NULL,
CardCompany varchar(30) Not NULL,
CardType varchar(10) Not NULL,
);

-- Table Invoice for storing Invoice Information for an Order
Create Table Invoice
(
InvoiceID int Not NULL Primary Key,
InvoiceAmount money Not NULL,
InvoiceGenerationDate date Not NULL,
);

-- Table Orders for storing Customer's Order Information
Create Table Orders
(
OrderID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Customers(CustomerID),
OrderStatus varchar(20) Not NULL,
OrderPrice money Not NULL,
OrderPlaceDate date Not NULL,
EstDeliveryDate date Not NULL,
InvoiceID int Not NULL Foreign Key References Invoice(InvoiceID),
);

-- Table WishList for storing Customer's WishList Products Information
Create Table WishList
(
WishListID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Customers(CustomerID),
);

-- Table WishListMapping for mapping Customer's WishList Information to Product Information
Create Table WishListMapping
(
WishListMappingID int Not NULL Primary Key,
WishListID int Not NULL Foreign Key References WishList(WishListID),
ProductID int Not NULL Foreign Key References Products(ProductID),
);

-- Table ProductSuggestions for storing the mapping of Product-Customer
-- According to the Products suggested to the Customer
Create Table ProductSuggestions
(
ProductSuggestionID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Customers(CustomerID),
ProductID int Not NULL Foreign Key References Products(ProductID),
);

-- Table Shipping for storing the shipping Information for an Order
Create Table Shipping
(
ShippingID int Not NULL Primary Key,
ShippingCompany varchar(30) Not NULL,
ShippingFare money Not NULL,
OrderID int Not NULL Foreign Key References Orders(OrderID),
);

-- Table ProductOrder for mapping the Product Information for an Order
-- There can be 
Create Table ProductOrder
(
ProductOrderID int Not NULL Primary Key,
OrderID int Not NULL Foreign Key References Orders(OrderID),
ProductID int Not NULL Foreign Key References Products(ProductID),
ProductQuantity int Not NULL,
);

-- Table OrderShipping for mapping the Shipping Information for an Order
-- There can be more than one Shipping for just one Order
Create Table OrderShipping
(
ProductOrderID int Not NULL Primary Key,
OrderID int Not NULL Foreign Key References Orders(OrderID),
ProductID int Not NULL Foreign Key References Products(ProductID),
);

-- Table Reviews for storing the reviews for a particular Product
-- There can be more than one reviwes for just one Product
-- The comments can be by both concerned parties: the customer and the product owner
Create Table Review
(
ReviewID int Not NULL Primary Key,
CustomerID int Not NULL Foreign Key References Orders(OrderID),
ProductID int Not NULL Foreign Key References Products(ProductID),
Rating int Not NULL,
CustomerNotes varchar(30),
ProductOwnerNotes varchar(30),
);

-- Table Suppliers for storing the Information about the Suppliers for a particular Product
Create Table Suppliers
(
SupplierID int Not NULL Primary Key,
SupplierName varchar(30) Not NULL,
SupplierContact varchar(10) Not NULL,
SupplierEmail varchar(30) Not NULL,
SupplierAddress varchar(50) Not NULL,
);

-- Table ProductSupplier for mapping the Suppliers to the Products
-- Many-to-Many relationship
Create Table ProductSupplier
(
ProductSupplierID int Not NULL Primary Key,
ProductID int Not NULL Foreign Key References Products(ProductID),
SupplierID int Not NULL Foreign Key References Suppliers(SupplierID),
);

-- Table Warehouse for storing the Information about the warehouse for a particular product
-- This is also useful for shipping
Create Table Warehouse
(
WarehouseID int Not NULL Primary Key,
StreetAddress varchar(30) Not NULL,
City varchar(30) Not NULL,
WarehouseState varchar(30) Not NULL,
ZipCode int Not NULL,
);

-- Table WarehouseProduct for mapping the products to a particular warehouse
-- Same products maybe in multiple warehouses
Create Table WarehouseProduct
(
WarehouseProductID int Not NULL Primary Key,
WarehouseID int Not NULL Foreign Key References Warehouse(WarehouseID),
ProductID int Not NULL Foreign Key References Products(ProductID),
ProductInQuantity int Not NULL,
ProductOnWayQuantity int Not NULL,
ReturnQuantity int Not NULL,
);

-- Table ShippingWarehouse for mapping the shipping order to a particular warehouse
-- Same orders may have different shipping
-- But, same shipping must have same warehouses
Create Table ShippingWarehouse
(
ShippingWarehouseID int Not NULL Primary Key,
WarehouseID int Not NULL Foreign Key References Warehouse(WarehouseID),
ShippingID int Not NULL Foreign Key References Shipping(ShippingID),
);
