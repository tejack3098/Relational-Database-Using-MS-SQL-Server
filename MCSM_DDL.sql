USE master
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'MCSM')
    DROP DATABASE MCSM
GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE MCSM
GO

USE MCSM
GO

CREATE TABLE Customer(
	Customer_ID INT IDENTITY(100,1) NOT NULL PRIMARY KEY,
	Customer_Name VARCHAR(50) NOT NULL,
	Contact_Number VARCHAR(10) NOT NULL UNIQUE,
	Email_ID VARCHAR(30) NOT NULL UNIQUE,
	Street_Address VARCHAR(100) NOT NULL,
	City VARCHAR(30) NOT NULL,
	[State] VARCHAR(30) NOT NULL,
	Postal_Code VARCHAR(5) NOT NULL,
	CONSTRAINT chk_cust_num CHECK ( LEN(Contact_Number) = 10),
	CONSTRAINT chk_cust_email CHECK ( Email_ID LIKE '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%')
);
GO

CREATE TABLE Role(
	Role_ID INT IDENTITY(200,1) NOT NULL PRIMARY KEY,
	Role_Type VARCHAR(20)
);
GO

CREATE TABLE Priority(
	Priority_ID INT IDENTITY(150,1) NOT NULL PRIMARY KEY,
	Priority_Type VARCHAR(20) NOT NULL,
	Priority_Description VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Delivery_Mode(
	Delivery_Mode_ID INT IDENTITY(250,1) NOT NULL PRIMARY KEY,
	Delivery_Mode_Type VARCHAR(20) NOT NULL,
	Delivery_Mode_Description VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Service_Location(
	Zipcode VARCHAR(5) NOT NULL PRIMARY KEY,
	Location_Name VARCHAR(20) NOT NULL,
	City VARCHAR(25) NOT NULL
);
GO


CREATE TABLE Payment_Type(
	Payment_Type_ID INT IDENTITY(50,1) NOT NULL PRIMARY KEY,
	Payment_Type_Name VARCHAR(30) NOT NULL,
);
GO

CREATE TABLE Address(
	Address_ID INT IDENTITY(175,1) NOT NULL PRIMARY KEY,
	Street VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	[State] VARCHAR(30) NOT NULL,
	Postal_Code VARCHAR(5) NOT NULL
);
GO

CREATE TABLE Package_Type(
	Package_Type_ID INT IDENTITY(425,1) NOT NULL PRIMARY KEY,
	Package_Type_Name VARCHAR(30) NOT NULL,
);
GO

CREATE TABLE Offices(
	Office_ID INT IDENTITY(100,1) NOT NULL PRIMARY KEY,
	Street_Address VARCHAR(30) NOT NULL,	
	City VARCHAR(30) NOT NULL,
	[State] VARCHAR(30) NOT NULL,
	Postal_Code VARCHAR(5) NOT NULL,
	Contact_Number VARCHAR(10) NOT NULL UNIQUE
);
GO

CREATE TABLE Warehouse(
	Warehouse_ID INT IDENTITY(2000,1) NOT NULL PRIMARY KEY,
	Warehouse_Location VARCHAR(255) NOT NULL,
	Capacity Numeric(8,2) NOT NULL,
	Office_ID INT NOT NULL,
	CONSTRAINT office_warehouse_oid_fk FOREIGN KEY(Office_ID) REFERENCES Offices(Office_ID),
);
GO

CREATE TABLE Employee(
	Employee_ID INT IDENTITY(200,1) NOT NULL PRIMARY KEY,
	Employee_Name VARCHAR(50) NOT NULL,
	SSN VARBINARY(400) NOT NULL UNIQUE,
	[Address] VARCHAR(255) NOT NULL,
	Contact_Number VARCHAR(10) NOT NULL UNIQUE,
	Email_ID VARCHAR(30) NOT NULL UNIQUE,
	Office_ID INT,
	Warehouse_ID INT,
	Role_ID INT NOT NULL,
	CONSTRAINT chk_emp_num CHECK ( LEN(Contact_Number) = 10),
	CONSTRAINT chk_emp_email CHECK ( Email_ID LIKE '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%'),
	CONSTRAINT office_oid_fk FOREIGN KEY(Office_ID) REFERENCES Offices(Office_ID),
	CONSTRAINT warehouse_wid_fk FOREIGN KEY(Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
	CONSTRAINT role_rid_fk FOREIGN KEY(Role_ID) REFERENCES Role(Role_ID) 
);
GO


CREATE TABLE Vehicle(
	Vehicle_Number VARCHAR(12) NOT NULL PRIMARY KEY,
	Capacity NUMERIC(8,2) NOT NULL,
	Employee_ID INT NOT NULL,
	CONSTRAINT emp_driverid_fk FOREIGN KEY(Employee_ID) REFERENCES Employee(Employee_ID)
);
GO



CREATE TABLE Shipment(
	Shipment_ID INT NOT NULL IDENTITY(1000,1) PRIMARY KEY, 
	Shipment_Date DATE NOT NULL,
	Expected_Delivery_Date DATE NOT NULL,
	Total_Quantity INT NOT NULL,
	Total_Weight NUMERIC(4,1) NOT NULL,
	Shipment_Last_Location VARCHAR(20) NOT NULL,
	Shipment_Status VARCHAR(15) NOT NULL,
	Origin_Warehouse_ID INT NOT NULL, 
	Destination_Warehouse_ID INT NOT NULL, 
	Vehicle_Number VARCHAR(12) NOT NULL,
	CONSTRAINT shipment_status_ck CHECK(Shipment_Status IN('Prepared','Ready For Pick Up ','Shipped','In-Transit', 'Delivered','Cancelled','Delayed')),
	CONSTRAINT warehouse_org_wid_fk FOREIGN KEY(Origin_Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
	CONSTRAINT warehouse_dest_wid_fk FOREIGN KEY(Destination_Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
	CONSTRAINT vehicle_veh_no_fk FOREIGN KEY(Vehicle_Number) REFERENCES Vehicle(Vehicle_Number)
);
GO

CREATE TABLE Package(
	Package_ID INT IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	Package_Weight NUMERIC(3,1) NOT NULL,
	Last_Updated_Location VARCHAR(20) NOT NULL,
	Delivery_Status VARCHAR(15) NOT NULL,
	Package_Type_ID INT NOT NULL,
	Delivery_Mode_ID INT NOT NULL,
	Origin_Address_ID INT NOT NULL,
	Destination_Address_ID INT NOT NULL,
	Customer_ID INT NOT NULL,
	Priority_ID INT NOT NULL,
	Service_Location_Zipcode VARCHAR(5) NOT NULL, 
	Shipment_ID INT,
	Warehouse_ID INT,
	Office_ID INT NOT NULL,
	CONSTRAINT pkg_weight_ck CHECK(Package_Weight < 100),
	CONSTRAINT delivery_status_ck CHECK(Delivery_Status IN('Order Placed','Dispatched','In-Transit', 'Delivered','Cancelled','Delayed')),
	CONSTRAINT pkg_pti_fk FOREIGN KEY(Package_Type_ID) REFERENCES Package_Type(Package_Type_ID),
	CONSTRAINT dm_dmi_fk FOREIGN KEY(Delivery_Mode_ID) REFERENCES Delivery_Mode(Delivery_Mode_ID),
	CONSTRAINT add_org_fk FOREIGN KEY(Origin_Address_ID) REFERENCES Address(Address_Id),
	CONSTRAINT add_dest_fk FOREIGN KEY(Destination_Address_ID) REFERENCES Address(Address_Id),
	CONSTRAINT cust_custid_fk FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID),
	CONSTRAINT priority_pid_fk FOREIGN KEY(Priority_ID) REFERENCES Priority(Priority_ID),
	CONSTRAINT service_location_zip FOREIGN KEY(Service_Location_Zipcode) REFERENCES Service_Location(Zipcode),
	CONSTRAINT shipment_sid_fk FOREIGN KEY(Shipment_ID) REFERENCES Shipment(Shipment_ID),
	CONSTRAINT warehouse_pkg_wid_fk FOREIGN KEY(Warehouse_ID) REFERENCES Warehouse(Warehouse_ID),
	CONSTRAINT office_pkg_oid_fk FOREIGN KEY(Office_ID) REFERENCES Offices(Office_ID)
);
GO


CREATE TABLE Payments(
    Payment_ID INT IDENTITY(1000,1) NOT NULL  PRIMARY KEY,
	Payment_Date  DATE NOT NULL,
    Total_Amount NUMERIC(8,2) NOT NULL,
	Payment_Status VARCHAR(15) NOT NULL,
    Payment_Type_ID INT NOT NULL,
    Package_ID INT NOT NULL,
	CONSTRAINT payment_status_ck CHECK( Payment_Status IN ('Pending', 'Complete','Refunded', 'Failed', 'Revoked', 'Cancelled')), 
	CONSTRAINT emp_paymentid_fk FOREIGN KEY(Payment_Type_ID) REFERENCES PAYMENT_TYPE(Payment_Type_ID),
	CONSTRAINT package_type_packageid_fk FOREIGN KEY(Package_ID) REFERENCES PACKAGE(Package_ID)
);
GO

CREATE TABLE Shipment_Logs(
	log_ID INT IDENTITY PRIMARY KEY,
	Shipment_ID INT NOT NULL , 
	Shipment_Date DATE NOT NULL,
	Expected_Delivery_Date DATE NOT NULL,
	Total_Quantity INT NOT NULL,
	Total_Weight NUMERIC(4,1) NOT NULL,
	Shipment_Last_Location VARCHAR(20) NOT NULL,
	Shipment_Status VARCHAR(15) NOT NULL,
	Origin_Warehouse_ID INT NOT NULL, 
	Destination_Warehouse_ID INT NOT NULL, 
	Vehicle_Number VARCHAR(12) NOT NULL,
	updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL' or operation = 'UPD')
);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Non Clustered Indexes 

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Package_emp]
ON [dbo].[PACKAGE] ([PACKAGE_ID],[CUSTOMER_ID]);

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Warehouse]
ON [dbo].[WAREHOUSE] ([Warehouse_location]);

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Shipment]
ON [dbo].[SHIPMENT] ([Shipment_Date]);

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Payment]
ON [dbo].[PAYMENTS] ([Payment_Status]);

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Customer]
ON [dbo].[CUSTOMER] ([Customer_Name]);


--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Column Encryption

--CREATE A MASTER KEY FOR THE DATABASE. 
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Mypass@123';
--DROP MASTER KEY 

--VERIFY THAT MASTER KEY EXISTS

--SELECT NAME KeyName,
--  symmetric_key_id KeyID,
--  key_length KeyLength,
--  algorithm_desc KeyAlgorithm
--FROM sys.symmetric_keys;
--GO

--CREATE A SELF SIGNED CERTIFICATE AND NAME IT EmpSSN
CREATE CERTIFICATE EmpSSN  
   WITH SUBJECT = 'Employee SSN';  
GO 
--DROP CERTIFICATE EmpSSN

--CREATE A SYMMETRIC KEY  WITH AES 256 ALGORITHM USING THE CERTIFICATE
--AS ENCRYPTION/DECRYPTION METHOD

CREATE SYMMETRIC KEY EmpSSN_SM 
	WITH ALGORITHM = AES_256  
    ENCRYPTION BY CERTIFICATE EmpSSN;  
GO  
--DROP SYMMETRIC KEY EmpPass_SM 

--NOW WE ARE READY TO ENCRYPT THE PASSWORD AND ALSO DECRYPT

--ENCRYPTION IS DONE WHILE INSERTING DATA IN THE INSERT SCRIPT 

--DECRYPTION IS DONE IN VIEW4 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UDF

--UDF1 (udf_caluclatePackagePrice) - Calculates price of the package based on Priority, Package Type, Weight and Returns Total_Amount as an Output 

CREATE FUNCTION udf_caluclatePackagePrice
( 
	@priority varchar(25), 
	@package_type varchar(25),
	@weight numeric(4,1)
 )	
RETURNS INT
AS
BEGIN
	Declare @output NUMERIC(6,1), @PriorityPrice  NUMERIC(6,1) , @PackageTypePrice NUMERIC(6,1), @WeightRangePrice NUMERIC(6,1)

	SET @PriorityPrice = (SELECT CASE
		WHEN @priority='A' THEN 5
		WHEN @priority='B' THEN 4
		WHEN @priority='C' THEN 3
		WHEN @priority='D' THEN 2
		WHEN @priority='E' THEN 1 END)

	SET @PackageTypePrice = ( SELECT CASE
		WHEN @package_type IN ('Non-Perishable', 'Non- Fragile',  'Electronics', 'Jewelry' ) THEN 10
		WHEN @package_type IN ('Perishable', 'Food Delivery', 'Medicine','Fragile') THEN 5 END)

	SET @WeightRangePrice = (@weight * 0.5)

	SET @output = @PriorityPrice + @PackageTypePrice + @WeightRangePrice

	RETURN @output
END
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDF1 (udf_caluclatepackagePrice) Execution

--Select dbo.udf_caluclatepackagePrice('A', 'Perishable', '59')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UDF2 (udf_GetPaymentStatus) - Returns Payment Status From Package ID

CREATE FUNCTION udf_GetPaymentStatus 
(
	@Package_ID int
) 
RETURNS VARCHAR(25)
AS
BEGIN
	DECLARE @PaymentStatus varchar(25)

	SELECT @PaymentStatus = Payment_Status 
	FROM PAYMENTS pay INNER JOIN Package p ON p.Package_ID=pay.Package_ID
	WHERE pay.Package_ID=@Package_ID
	RETURN @PaymentStatus
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDF2 (udf_GetPaymentStatus) Execution

--Select [dbo].[udf_GetPaymentStatus] ('1004') as 'Status';

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--UDF3 (udf_GetWarehouseInformation) - Get Warehouse_locaction From 

CREATE FUNCTION udf_GetWarehouseInformation
(
	@Shipment_ID INT
) 
RETURNS VARCHAR(25)
AS
BEGIN
	DECLARE @Warehouse_location varchar(25)
	
	SELECT @Warehouse_location = w.Warehouse_Location
	FROM Shipment S INNER JOIN Warehouse w ON s.Destination_Warehouse_ID=w.Warehouse_ID
	WHERE S.Shipment_ID=@Shipment_ID
	RETURN @Warehouse_location

END
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDF3 (udf_GetWarehouseInformation) Execution

--Select [dbo].[udf_GetWarehouseInformation] ('1007') as Warehosue_Location;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Stored Procedures

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

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Trigger (trg_Shipment_Logs) - Keeps track of Sshipment Status by storing logs in Shipment_Logs table

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

---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Views

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

---------------------------------------------------------------------------------------------------------------------------------------------------------
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

-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- View4 (vw_employeeDecrytedSSN) --View to retrieve decryted SSN of Emplpoyees

OPEN SYMMETRIC KEY EmpSSN_SM  
DECRYPTION BY CERTIFICATE EmpSSN;
GO

CREATE VIEW vw_employeeDecrytedSSN AS
(
    Select Employee_ID, Employee_name, convert(varchar, DECRYPTBYKEY(SSN)) as SSN from Employee
);
GO
--SELECT * FROM vw_employeeDecrytedSSN;
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- View5 (vw_GetPackageCountsForWarehouse) -- View to display Count of Packages in a origin Warehouse that needs to be shipped

CREATE VIEW vw_GetPackageCountsForWarehouse AS 
(
    SELECT Warehouse_ID,COUNT(Package_ID) AS no_of_packages FROM Package GROUP BY Warehouse_ID
);
GO

--Select * from vw_GetPackageCountsForWarehouse
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- View6 (vw_GetNoOfCustomersInCity) -- View to display Number of Customers per City


CREATE VIEW vw_GetNoOfCustomersInCity AS 
(
    SELECT City,COUNT(Customer_ID) AS no_of_Customers FROM Customer GROUP BY City
);
GO

--Select * from vw_GetNoOfCustomersInCity
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- View7 (vw_GetRevenueFromPackageType) -- View to display Revenue Per Package Type


CREATE VIEW vw_GetRevenueFromPackageType AS
(
    SELECT pct.Package_Type_Name,SUM(py.Total_Amount) AS Revenue, COUNT(pc.Package_ID) as PackageCount FROM Package_Type pct 
	INNER JOIN Package pc ON pct.Package_Type_ID=pc.Package_Type_ID
	INNER JOIN Payments py ON pc.Package_ID=py.Package_ID
	GROUP BY pct.Package_Type_Name
);
GO

--Select * from vw_GetRevenueFromPackageType
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------