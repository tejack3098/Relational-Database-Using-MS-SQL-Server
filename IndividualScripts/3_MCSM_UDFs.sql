USE [MCSM]
GO

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDF3 (udf_GetWarehouseInformation) Execution

--Select [dbo].[udf_GetWarehouseInformation] ('1007') as Warehosue_Location;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

