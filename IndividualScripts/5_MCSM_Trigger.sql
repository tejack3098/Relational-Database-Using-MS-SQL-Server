USE MCSM
GO

CREATE TRIGGER trg_Shipment_Logs
ON Shipment 
AFTER INSERT,UPDATE,DELETE
AS BEGIN
SET NOCOUNT ON;


INSERT INTO Shipment_Logs(
        Shipment_ID, 
        Shipment_Date,
        Expected_Delivery_Date,
        Total_Quantity,
        Total_Weight,
        Shipment_Last_Location, 
        Shipment_Status, 
        Origin_Warehouse_ID,
		Destination_Warehouse_ID,
		Vehicle_Number,
		updated_at,
		operation
    )
    SELECT
        i.Shipment_ID,
        Shipment_Date,
        Expected_Delivery_Date,
        Total_Quantity,
        Total_Weight,
        i.Shipment_Last_Location,
		Shipment_Status,
		Origin_Warehouse_ID,
		Destination_Warehouse_ID,
		Vehicle_Number,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.Shipment_ID,
        Shipment_Date,
        Expected_Delivery_Date,
        Total_Quantity,
        Total_Weight,
        d.Shipment_Last_Location,
		Shipment_Status,
		Origin_Warehouse_ID,
		Destination_Warehouse_ID,
		Vehicle_Number,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
	
END
GO

/*Trigger Execution*/

--INSERT INTO Shipment VALUES('2022-10-20','2022-11-11', '144', '212.2', 'south boston', 'Prepared', '2006', '2001','I4BB53')

--Update Shipment
--Set Shipment_Status = 'In-Transit' where Shipment_ID = (Select TOP 1 [Shipment_ID] FROM Shipment ORDER BY Shipment_ID DESC)

--delete from Shipment where Shipment_ID = (Select TOP 1 [Shipment_ID] FROM Shipment ORDER BY Shipment_ID DESC)

--select * from Shipment_Logs

