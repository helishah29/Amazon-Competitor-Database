USE AmazonCompetitor;;
GO


SELECT * FROM Orders WHERE OrderID=8;












-- IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID('tr_Orders_Update'))
-- DROP TRIGGER [dbo].[tr_Orders_Update];

-- IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID('trInsertDisplay'))
-- DROP TRIGGER [dbo].[trInsertDisplay];
-- GO
-- BEGIN TRAN;

--  UPDATE Orders
--  SET OrderPrice = 1000
--  WHERE OrderID = 8

-- COMMIT TRAN;





