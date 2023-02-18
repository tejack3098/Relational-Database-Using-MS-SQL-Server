USE master
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'MCSM')
    DROP DATABASE MCSM
GO

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

----------------------------------------------------------------------------------------------------------------------------------------

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


--------------------------------------------------------------------------------------------------------------------------------------------

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