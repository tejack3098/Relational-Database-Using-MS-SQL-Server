USE MCSM
GO

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

drop view vw_GetRevenueFromPackageType

--Select * from vw_GetRevenueFromPackageType
--GO

-----------------------------------------------------------------------------------------------------------------------------------------------------------