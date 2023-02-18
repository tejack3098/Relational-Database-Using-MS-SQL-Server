USE [MCSM]
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SP1 (usp_InsertPackageDetails) - Inserts Package Details in Package Tabe and returns Package_ID

CREATE PROCEDURE usp_InsertPackageDetails
(
	@Package_Weight NUMERIC(3,1),
	@Last_Updated_Location varchar(20),
	@Package_Type_ID INT,
	@Delivery_Mode_ID INT,
	@Origin_Address_ID INT,
	@Destination_Address_ID INT,
	@Customer_ID INT,
	@Priority_ID INT,
	@Service_Location_Zipcode VARCHAR(5),
	@Office_ID INT,																													
    @Package_ID INT OUT 
) 
AS 
BEGIN

	DECLARE @ INT

	BEGIN TRY
		
		IF (@Package_Weight IS NULL)
		BEGIN
			RETURN -1
		END

		IF NOT EXISTS (SELECT Package_Type_ID FROM Package_Type WHERE Package_Type_ID = @Package_Type_ID)
		BEGIN
			RETURN -2
		END

		IF NOT EXISTS (SELECT Delivery_Mode_ID FROM Delivery_Mode WHERE Delivery_Mode_ID = @Delivery_Mode_ID)
		BEGIN
			RETURN -3
		END

		IF NOT EXISTS (SELECT Address_ID FROM Address WHERE Address_ID = @Origin_Address_ID)
		BEGIN
			RETURN -4
		END

		IF NOT EXISTS (SELECT Address_ID FROM Address WHERE Address_ID = @Destination_Address_ID)
		BEGIN
			RETURN -5
		END

		IF NOT EXISTS (SELECT Customer_ID FROM Customer WHERE Customer_ID = @Customer_ID)
		BEGIN
			RETURN -6
		END

		IF NOT EXISTS (SELECT Priority_ID FROM [Priority] WHERE Priority_ID = @Priority_ID)
		BEGIN
			RETURN -7
		END

		IF NOT EXISTS (SELECT Zipcode FROM Service_Location WHERE Zipcode = @Service_Location_Zipcode)
		BEGIN
			RETURN -8
		END

		IF NOT EXISTS (SELECT Office_ID FROM Offices WHERE Office_ID = @Office_ID)
		BEGIN
			RETURN -9
		END

		BEGIN
			BEGIN TRAN
				INSERT INTO Package(Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID)
				VALUES (@Package_Weight, @Last_Updated_Location,'Order Placed', @Package_Type_ID, @Delivery_Mode_ID, @Origin_Address_ID, @Destination_Address_ID, @Customer_ID, @Priority_ID, @Service_Location_Zipcode, NULL, NULL, @Office_ID)

				SET @Package_ID = IDENT_CURRENT('Package')	
			COMMIT
			RETURN 1
		END

	END TRY

	BEGIN CATCH
		PRINT 'Error occured while inserting package details'
		ROLLBACK
		RETURN -99
	END CATCH
END
GO


----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SP2 (usp_UpdateShipmentStatus) - Updates Shipment Status as 'Delayed' on condition that Current Date exceeds Expected Deleivery Date and Package is not yet Delivered

CREATE PROCEDURE usp_UpdateShipmentStatus
AS
BEGIN
	BEGIN TRY

		BEGIN TRAN
			UPDATE Shipment
			SET Shipment_Status = 'Delayed'
			WHERE Expected_Delivery_Date <  CAST(GETDATE() as DATE) AND Shipment_Status <> 'Delivered'
		COMMIT
		RETURN 1
	END TRY

	BEGIN CATCH
		PRINT 'Error occured while updating Shipment Status'
		ROLLBACK
		RETURN -99
	END CATCH
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SP3 (usp_InsertPaymentDetailsForPackage) - Inserts Payment Details For Package using Package Id  and gives PaymentId as an output

CREATE PROCEDURE usp_InsertPaymentDetailsForPackage(
	@Package_ID INT,
	@Payment_Type_ID INT,
	@Payment_ID INT OUT
)
AS
BEGIN
	
	DECLARE @TotalAmount INT, @Priority_Type VARCHAR(20), @Package_Type_Name VARCHAR(30) , @Package_Weight NUMERIC(3,1)

	BEGIN TRY
		
		IF NOT EXISTS (SELECT Package_ID FROM Package WHERE Package_ID = @Package_ID)
		BEGIN
			RETURN -1
		END

		IF NOT EXISTS (SELECT Payment_Type_ID FROM Payment_Type WHERE Payment_Type_ID = @Payment_Type_ID)
		BEGIN
			RETURN -2
		END

		SELECT @Priority_Type = pr.Priority_Type FROM Package p INNER JOIN [Priority] pr On p.Priority_ID = pr.Priority_ID WHERE p.Package_ID = @Package_ID

		SELECT @Package_Type_Name = pt.Package_Type_Name FROM Package_Type pt INNER JOIN Package p ON pt.Package_Type_ID = p.Package_Type_ID where p.Package_ID = @Package_ID

		SELECT @Package_Weight = Package_Weight FROM Package WHERE Package_ID = @Package_ID

		SELECT @TotalAmount = dbo.udf_caluclatePackagePrice(@Priority_Type, @Package_Type_Name, @Package_Weight)

		BEGIN TRAN
			INSERT INTO Payments( Payment_Date, Total_Amount, Payment_Status ,Payment_Type_ID, Package_ID) VALUES (CAST(GETDATE() AS DATE), @TotalAmount, 'Pending',@Payment_Type_ID, @Package_ID)

			SET @Payment_ID = (SELECT Payment_ID FROM Payments WHERE Package_ID = @Package_ID)
		COMMIT
		RETURN 1
	END TRY

	BEGIN CATCH
		PRINT 'Error occured while Inserting Payment Details'
		ROLLBACK
		RETURN -99
	END CATCH
END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--SP4 (usp_UpdatePackageDeliveryStatus) - Updates the status of the package and returns 1 for successful update

CREATE PROCEDURE usp_UpdatePackageDeliveryStatus(
	@Package_ID INT,
	@Delivery_Status VARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		
		IF NOT EXISTS (SELECT Package_ID FROM Package WHERE Package_ID = @Package_ID)
		BEGIN
			RETURN -1
		END

		IF @Delivery_Status NOT IN('Order Placed','Dispatched','In-Transit', 'Delivered','Cancelled','Delayed')
		BEGIN
			RETURN -2
		END

		BEGIN TRAN

			UPDATE Package
			SET Delivery_Status = @Delivery_Status WHERE Package_ID = @Package_ID

		COMMIT
		RETURN 1
	END TRY

	BEGIN CATCH
		PRINT 'Error occured while updating package detais'
		ROLLBACK
		RETURN -99
	END CATCH
END
GO

---------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------Stored Procedure Execution--------------------------------------------------------------------
-- SP1 (usp_InsertPackageDetails) Execution

--DECLARE @ReturnValue1 INT, @Package_ID INT
--EXEC @ReturnValue1 = usp_InsertPackageDetails 28,' 21 Bolyston', '428','250', '176', '179', '101', '152', '01031', '101', @Package_ID OUT
--SELECT @ReturnValue1 AS ReturnValue, @Package_ID AS PackageID
--GO

---------------------------------------------------------------------------------------------------------------------------------------------
-- SP2 (usp_UpdateShipmentStatus) Execution

--DECLARE @ReturnValue2 INT
--EXEC @ReturnValue2 = usp_UpdateShipmentStatus
--SELECT @ReturnValue2 AS ReturnValue
--GO

---------------------------------------------------------------------------------------------------------------------------------------------
-- SP3 (usp_InsertPaymentDetailsForPackage) Execution

--DECLARE @ReturnValue3 INT, @Payment_ID INT
--EXEC @ReturnValue3 = usp_InsertPaymentDetailsForPackage 1011, 51, @Payment_ID OUT
--SELECT @ReturnValue3 AS ReturnValue, @Payment_ID AS PaymentID
--GO

----------------------------------------------------------------------------------------------------------------------------------------------
-- SP4 (usp_UpdatePackageDeliveryStatus) Execution

--DECLARE @ReturnValue4 INT, @Package_ID INT, @Delivery_Status VARCHAR(20)
--EXEC @ReturnValue4 = usp_UpdatePackageDeliveryStatus 1008, 'In-Transit'
--SELECT @ReturnValue4 AS ReturnValue
--GO

------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- View1 (vw_onlinePaymentPackage) -- View to see Package information that are NOT paid by CASH

CREATE VIEW vw_onlinePaymentPackage as (
    SELECT P.Package_ID, P.Package_Weight,PT.Payment_Type_Name,Pay.Total_Amount, P.Last_Updated_Location, P.Delivery_Status,P.Shipment_ID,P.Warehouse_ID  
    FROM Package P INNER JOIN Payments Pay 
    ON P.Package_ID=Pay.Package_ID
    INNER JOIN Payment_Type PT 
    ON Pay.Payment_Type_ID=PT.Payment_Type_ID 
    WHERE PT.Payment_Type_Name NOT IN ('CASH')
);
GO

--Select * from  vw_onlinePaymentPackage
--GO

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- View2 (vw_highPriorityCustomers) -- View to see Information of customers that have 'ONE DAY RUSH' priority packages

CREATE VIEW vw_highPriorityCustomers AS
(
    Select C.Customer_ID, C.Customer_Name, C.Contact_Number, C.Email_ID, C.[State],C.Postal_Code, C.Street_Address, PR.Priority_Type,PR.Priority_Description
    from CUSTOMER C INNER JOIN Package Pack 
    ON  C.CUSTOMER_ID= Pack.CUSTOMER_ID
    INNER JOIN PRIORITY PR
    ON Pack.Priority_ID = PR.priority_id 
    Where PR.Priority_Description = 'One Day Rush'
);
GO

--Select * from vw_highPriorityCustomers
--GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- View3 (vw_pickupOrders) -- View to see Package Information having delivery mode as Pick up


CREATE VIEW vw_pickupOrders AS 
(
    SELECT P.Package_ID, P.Package_Weight, P.Last_Updated_Location, P.Delivery_Status,P.Shipment_ID,P.Warehouse_ID, D.Delivery_Mode_Type,D.Delivery_Mode_Description
    From Package P Inner Join Delivery_mode D 
    ON P.Delivery_Mode_ID=D.Delivery_Mode_ID
    Where D.Delivery_Mode_Description='Pickup'
);
GO

--Select * from vw_pickupOrders
--GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- View4 (vw_employeeDecrytedSSN) --View to retrieve decryted SSN of Emplpoyees

--OPEN SYMMETRIC KEY EmpSSN_SM  
--DECRYPTION BY CERTIFICATE EmpSSN;

CREATE VIEW vw_employeeDecrytedSSN AS
(
    Select Employee_ID, Employee_name, convert(varchar, DECRYPTBYKEY(SSN)) as SSN from Employee
);
GO
--SELECT * FROM vw_employeeDecrytedSSN;
--GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- View5 (vw_GetPackageCountsForWarehouse) -- View to display Count of Packages in a origin Warehouse that needs to be shipped

CREATE VIEW vw_GetPackageCountsForWarehouse AS 
(
    SELECT Warehouse_ID,COUNT(Package_ID) AS no_of_packages FROM Package GROUP BY Warehouse_ID
);
GO

--Select * from vw_GetPackageCountsForWarehouse
--GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- View6 (vw_GetNoOfCustomersInCity) -- View to display Number of Customers per City


CREATE VIEW vw_GetNoOfCustomersInCity AS 
(
    SELECT City,COUNT(Customer_ID) AS no_of_Customers FROM Customer GROUP BY City
);
GO

--Select * from vw_GetNoOfCustomersInCity
--GO

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- View7 (vw_GetRevenueFromPackageType) -- View to display Revenue Per Package Type


CREATE VIEW vw_GetRevenueFromPackageType AS
(
    SELECT pct.Package_Type_Name,SUM(py.Total_Amount) AS Revenue, COUNT(pc.Package_ID) as PackageCount FROM Package_Type pct 
	INNER JOIN Package pc ON pct.Package_Type_ID=pc.Package_Type_ID
	INNER JOIN Payments py ON pc.Package_ID=py.Package_ID
	GROUP BY pct.Package_Type_Name
);
GO

drop view vw_GetRevenueFromPackageType

--Select * from vw_GetRevenueFromPackageType
--GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------