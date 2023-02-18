USE MCSM
GO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Customer Table Insert Queries

INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Shreeyash Lahane','8573954274','lahane.sh@northeastern.edu','75 Saint Alphonsus St','Boston','Massachusetts','02120')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Tejas Chaudhari','8547589652','chaudhari.tej@northeastern.edu','65 Tremont St','Boston','Massachusetts','02254')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Anushree Dutta','7586985478','dutta.anush@northeastern.edu','81 Portland Street','Worcester','Massachusetts','01031')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Hemant Karkare','7455858692','karkare.he@northeastern.edu','22 Amory St','Leeds','Massachusetts','01053')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Manuel Montrond','8574257274','montrond.man@northeastern.edu','55 Dalton St','Berkshire','Massachusetts','01226')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Shreya Jain','8570054274','jain.sh@northeastern.edu','89 Washington St','Essex','Massachusetts','01910')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Tejal Sinha','8547889652','sinha.te@northeastern.edu','65 Ashland St','Manchester','Massachusetts','01944')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Cameron Paul','6176985478','paul.ca@northeastern.edu','21 Camden Ave','Franklin','Massachusetts','01360')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Betty Timber','6175858692','timber.be@northeastern.edu','34 Park St','Springfield','Massachusetts','01199')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Steffy Carl','6174257274','carl.st@northeastern.edu','212 Boylston St','Chelmsford','Massachusetts','01824')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Shankar Sharma','8573933374','shankar.sh@northeastern.edu','79 Saint Alphonsus St','Boston','Massachusetts','02120')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Tejal Chavan','8547589621','chavan.tej@northeastern.edu','64 Tremont St','Boston','Massachusetts','02255')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Catherine Harry','7586975478','harry.cath@northeastern.edu','80 Portland Street','Worcester','Massachusetts','01031')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Harvey Karl','7455858600','karl.har@northeastern.edu','20 Amory St','Leeds','Massachusetts','01052')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Manny Murray','8574257774','murray.man@northeastern.edu','51 Dalton St','Berkshire','Massachusetts','01225')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Sarah William','8511054274','william.sa@northeastern.edu','09 Washington St','Essex','Massachusetts','01911')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Russel Tim','8547079652','tim.ru@northeastern.edu','69 Ashland St','Manchester','Massachusetts','01945')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Jake Kelly','6176225478','kelly.ja@northeastern.edu','20 Camden Ave','Franklin','Massachusetts','01361')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Ben Brenner','6100858692','brenner.be@northeastern.edu','134 Park St','Springfield','Massachusetts','01198')
INSERT INTO Customer (Customer_Name, Contact_Number, Email_ID, Street_Address, City, [State], Postal_Code) VALUES ('Stefphen Meryl','5174257274','meryl.st@northeastern.edu','300 Boylston St','Chelmsford','Massachusetts','01825')
--SELECT * FROM Customer 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Role Table Insert Queries

INSERT INTO Role (Role_Type) VALUES ('Delivery Person')
INSERT INTO Role (Role_Type) VALUES ('Vehicle Driver')
INSERT INTO Role (Role_Type) VALUES ('Warehouse Employee')
INSERT INTO Role (Role_Type) VALUES ('Warehouse Manager')
INSERT INTO Role (Role_Type) VALUES ('Office Employee')
INSERT INTO Role (Role_Type) VALUES ('Office Manager')
INSERT INTO Role (Role_Type) VALUES ('Supervisor')
INSERT INTO Role (Role_Type) VALUES ('Junior Manager')
INSERT INTO Role (Role_Type) VALUES ('Junior Supervisor')
INSERT INTO Role (Role_Type) VALUES ('Trainee')
--SELECT * FROM Role;

-----------------------------------------------------------------------------------------------------------
--Priority Table Insert Queries

INSERT INTO Priority (Priority_Type, Priority_Description) VALUES ('A','One Day Rush')
INSERT INTO Priority (Priority_Type, Priority_Description) VALUES ('B','1-2 Days')
INSERT INTO Priority (Priority_Type, Priority_Description) VALUES ('C','2-5 Days')
INSERT INTO Priority (Priority_Type, Priority_Description) VALUES ('D','Standard Delivery')
--SELECT * FROM priority;

------------------------------------------------------------------------------------------------------------
-- Delivery_Mode Table Insert Queries

INSERT INTO Delivery_Mode (Delivery_Mode_Type, Delivery_Mode_Description) VALUES ('A','Door Delivery')
INSERT INTO Delivery_Mode (Delivery_Mode_Type, Delivery_Mode_Description) VALUES ('B','Pickup')
--SELECT * FROM Delivery_Mode

------------------------------------------------------------------------------------------------------------
-- Service_Location Insert Queries

INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('02120','Roxbury Crossing','Boston')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('02254','Boylston','Boston')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01031','Portland','Worcester')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('02118', 'Garforth','Leeds')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01226', 'Dalton','Berkshire')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01910', 'Lynn','Essex')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01944', 'Manchester','Essex')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01360', 'Northfield','Franklin')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01199', 'Springfield','Hampden')
INSERT INTO Service_Location (Zipcode, Location_Name, City) VALUES ('01824', 'Chelmsford','Middlesex')
--SELECT * FROM Service_Location;

------------------------------------------------------------------------------------------------------------
-- Payment_Type Table Insert Queries

INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Debit Card')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Credit Card')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Internet Banking')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Digital Wallet')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Cash')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Google Pay')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Zelle')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Apple Pay')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Venmo')
INSERT INTO Payment_Type (Payment_Type_Name) VALUES ('Mobile Banking')
--SELECT * from Payment_Type

--------------------------------------------------------------------------------------------------------------------------------
-- Address Table Insert Queries

INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('65 Tremont St','Boston','Massachusetts','02120')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('29 Copley St','Boston','Massachusetts','02254')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('26 Amory St','Leeds','Massachusetts','01053')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('55 Main St','Springfield','Massachusetts','01199')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('81 Portland Street','Worcester','Massachusetts','01031')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('22 Parker Hill Ave','Berkshire','Massachusetts','01226')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('75 Adam St','Berkshire','Massachusetts','01223')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('65 Washington St','Middlesex','Massachusetts','01824')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('35 Northampton St','Franklin','Massachusetts','01360')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('21 Camden Ave','Franklin','Massachusetts','01350')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('34 Park St','Hampden','Massachusetts','01198')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('212 Boylston st','hampden','Massachusetts','01196')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('2 Hamington st','Essex','Massachusetts','01909')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('41 Macy St','Manchester','Massachusetts','01944')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('64 Tremont St','Boston','Massachusetts','02120')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('79 Saint Alphonsus St','Boston','Massachusetts','02255')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('20 Amory St','Leeds','Massachusetts','01052')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('54 Main St','Springfield','Massachusetts','01198')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('80 Portland Street','Worcester','Massachusetts','01031')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('23 Parker Hill Ave','Berkshire','Massachusetts','01225')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('74 Adam St','Berkshire','Massachusetts','01224')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('69 Washington St','Middlesex','Massachusetts','01825')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('36 Northampton St','Franklin','Massachusetts','01361')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('20 Camden Ave','Franklin','Massachusetts','01351')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('35 Park St','Hampden','Massachusetts','01198')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('210 Boylston st','hampden','Massachusetts','01196')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('21 Hamington st','Essex','Massachusetts','01911')
INSERT INTO [Address] (Street, City, [State], Postal_Code) VALUES ('40 Macy St','Manchester','Massachusetts','01945')


--SELECT * from Address;

-----------------------------------------------------------------------------------------------------------------------------------
-- Package_Type Insert Queries

INSERT INTO Package_Type (Package_Type_Name) VALUES ('Food Delivery')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Perishable')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Non-Perishable')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Medicine')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Fragile')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Non- Fragile')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Jewelry')
INSERT INTO Package_Type (Package_Type_Name) VALUES ('Electronics')
--SELECT * FROM Package_Type

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Offices Table Insert Queries

INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('15 Tremont St', 'Boston', 'MA', '02120', '8573135199')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('1511 Boylston St', 'Boston', 'MA', '02254', '8573135299')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('123 Northampton St', 'Worcester', 'MA', '01031', '8574435399')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('152 Boylston St', 'Leeds', 'MA', '02118', '8576635499')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('17 commonwealth ave', 'Berkshire', 'MA', '01226', '8573135599')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('14 camden st', 'Essex', 'MA', '01910', '8572235179')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('1611 washington st', 'Essex', 'MA', '01944', '8572235299')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('112 northampton st', 'Franklin', 'MA', '01360', '8575135399')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('154 boylston st', 'Hampden', 'MA', '01199', '8576679499')
INSERT INTO Offices (Street_Address, City, [State], Postal_Code, Contact_Number) VALUES ('11 commonwealth ave', 'Middlesex', 'MA', '01824', '8573144599')
--SELECT * FROM offices;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Warehouse Table Insert Queries

INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Amity Street',7000.07, '100')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Leyden Street', 8800.88, '101')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Mulberry Street',10000, '102')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Sandwich Road',78000 , '103')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Alewife Brook Parkway',50990 , '104')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Brattle Street',10010, '105')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Neptune Road',7089.8 , '106')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Brookline Avenue',61002, '107')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Charles Street',67221, '108')
INSERT into Warehouse (Warehouse_Location, Capacity, Office_ID) values ('Day Boulevard', 91000, '109')
--SELECT * FROM Warehouse;

---------------------------------------------------------------------------------------------------------------------
--OPEN THE SYMMETRIC KEY WITH WHICH TO ENCRYPT THE DATA.  
OPEN SYMMETRIC KEY EmpSSN_SM  
DECRYPTION BY CERTIFICATE EmpSSN;  

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
--

---Office Employees
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Nicholas Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'459334872')),'Boston','6173135199', 'nivh@gmail.com', '100', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lily Ross', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'298384556')),'Boston','6172215199', 'lil@gmail.com', '100', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Sabrina Harris', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary, '847466668')),'Boston','6172225199', 'sabrina@gmail.com', '101', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Cherry Andrews', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'746625536')) ,'Boston','6172235199', 'cherry@gmail.com', '101', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Dominik Carroll', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary, '758728315')),'Worcester','6172245199', 'dominik@gmail.com', '102', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Gianna Ross', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary, '321598561')),'Worcester','6172255199', 'gianna@gmail.com', '102', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Kellan Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'945711093')) ,'Leeds','6172265199', 'kellan@gmail.com', '103', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lily Melanie', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'279563395')) ,'Leeds','6172275199', 'melnaie@gmail.com', '103', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Amanda Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'321786386')) ,'Berkshire','6172285199', 'amansa@gmail.com', '104', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Patrick Carroll', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'909771465')) ,'Berkshire','6172295199', 'carroll@gmail.com', '104', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Adam Elliott', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'326714660')) ,'Essex','6172305199', 'ellioee@gmail.com', '105', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Tiana Riley', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'614459405')) ,'Essex','6172315199', 'tiana@gmail.com', '105', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Roland Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'911998612')) ,'Essex','6172325199', 'roland@gmail.com', '106', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Cameron Ross', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'548376753')) ,'Essex','6172335199', 'cameron@gmail.com', '106', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Nicholas Gibson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'166290505')) ,'Franklin','6172345199', 'gibson@gmail.com', '107', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Allen Cameron', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'647943796')) ,'Franklin','6172355199', 'allen@gmail.com', '107', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Nicholas Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'777181171')) ,'Hampden','6172365199', 'holas@gmail.com', '108', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lily Allen', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'556235197')) ,'Hampden','6172375199', 'lilallen@gmail.com', '108', NULL, '205' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Cameron Roberts', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'838633569')) ,'Middlesex','6172395199', 'camrob@gmail.com', '109', NULL, '204' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lily Cameron', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'573213339')) ,'Middlesex','6172405199', 'camlil@gmail.com', '109', NULL, '205' )


-- Warehouse Employees
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Emily Davis', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'865523050')) ,'Boston','6173135201', 'avis@gmail.com', NULL, '2000', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Tony Crawford', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'748758443')) ,'Boston','6173135001', 'tony@gmail.com', NULL, '2000', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Nicholas Crawford', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'849752749')) ,'Boston','6173135002', 'craw@gmail.com', NULL, '2000', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Daryl Wilson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'911435420')) ,'Boston','6173135202', 'daryl@gmail.com', NULL, '2001', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Cadie Riley', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'305823229')) ,'Boston','6173135003', 'cadie@gmail.com', NULL, '2001', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Maria Henderson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'107988168')) ,'Boston','6173135004', 'maria@gmail.com', NULL, '2001', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Aiden Baker', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'470607112')),'Worcester','6173135203', 'baker@gmail.com', NULL, '2002', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Paul Parker', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'600663102')) ,'Worcester','6173135005', 'paul@gmail.com', NULL, '2002', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Luke Cooper', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'684303626')) ,'Worcester','6173135006', 'luke@gmail.com', NULL, '2002', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Preston Ellis', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'251450750')) ,'Leeds','6173135225', 'preston@gmail.com', NULL, '2003', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('David Ellis', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'635104050')) ,'Leeds','6173135007', 'david@gmail.com', NULL, '2003', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Amy Tucker', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'516471841')) ,'Leeds','6173135008', 'amy@gmail.com', NULL, '2003', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Hailey Robinson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'240847469')) ,'Berkshire','6173135226', 'hailey@gmail.com', NULL, '2004', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Charlie Craig', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'508220187')) ,'Berkshire','6173135009', 'charlie@gmail.com', NULL, '2004', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Myra Murray', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'693707031')) ,'Berkshire','6173135010', 'myra@gmail.com', NULL, '2004', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Tara Hunt', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'799999666')) ,'Essex','6173135227', 'tara@gmail.com', NULL, '2005', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Vincent Morgan', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'636048479')) ,'Essex','6173135011', 'vincent@gmail.com', NULL, '2005', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lucy Perkins', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'313610413')) ,'Essex','6173135012', 'lucy@gmail.com', NULL, '2005', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('David Richardson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'335072455')) ,'Essex','6173135228', 'davidRich@gmail.com', NULL, '2006', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Brianna Richardson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'413681251')) ,'Essex','6173135013', 'briana@gmail.com', NULL, '2006', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Tyler Turner', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'796139496')) ,'Essex','6173135014', 'tyler@gmail.com', NULL, '2006', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Martin Hunt', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'398817086')) ,'Franklin','6173135230', 'martin@gmail.com', NULL, '2007', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Vincent Perkins', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'589655645')) ,'Franklin','6173135015', 'vincnt@gmail.com', NULL, '2007', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Byron Cole', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'402402284')) ,'Franklin','6173135016', 'byron@gmail.com', NULL, '2007', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Sawyer Lucy', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'594984995')) ,'Hampden','6173135231', 'lsawyer@gmail.com', NULL, '2008', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Sawyer Watson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'942422968')) ,'Hampden','6173135017', 'watson@gmail.com', NULL, '2008', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Miller Clark', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'728862604')) ,'Hampden','6173135018', 'miller@gmail.com', NULL, '2008', '203' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Amy Cole', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'464088447')) ,'Middlesex','6173135234', 'coleamy@gmail.com', NULL, '2009', '200' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Eddy Wright', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'176251459')) ,'Middlesex','6173135019', 'eddy@gmail.com', NULL, '2009', '202' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Daisy Adams', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'765282223')) ,'Middlesex','6173135020', 'daisy@gmail.com', NULL, '2009', '203' )


--Vehicle Drivers
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Amelia Montgomery', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'330021448'))  ,'Boston','6174135400', 'psalm@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lily Evans', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'112382661'))  ,'Worcester','6177735401', 'chloe@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Adrian Ferguson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'945325075'))  ,'Leeds','6173195402', 'sarah@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Richard Taylor', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'315722241'))  ,'Berkshire','6173137403', 'mansi@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Bruce Higgins',EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'468675565'))  ,'Essex','6173805404', 'saloni@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Daryl Wilson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'741685006'))  ,'Franklin','6173138405', 'caron@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Antony Martin', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'416242596'))  ,'Hampden','6173135406', 'adammartin@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Frederick Hall', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'753531367'))  ,'Middlesex','6175145407', 'jen@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Ellia Anderson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'806044897'))  ,'Boston','6173135409', 'elliaanderson@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Julian Hill', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'863618039'))  ,'Leeds','6175145410', 'julianhill@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Byron Barnes', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'406096456'))  ,'Franklin','6175145412', 'byronbarnes@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Stella Bennett', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'381217207'))  ,'Boston','6174135413', 'stellabenn@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Alen Moore', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'460349828'))  ,'Worcester','6177735414', 'alenmoore@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Lyndon Armstrong', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'569584585'))  ,'Leeds','6173195415', 'lyndonarms@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Chloe Miller', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'895253131'))  ,'Berkshire','6173137416', 'chloemiller@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Jasmine Scott',EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'318789266'))  ,'Essex','6173805417', 'jasminescott@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Arianna Carter', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'796753669'))  ,'Franklin','6173138418', 'ariannacarter@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Alford Murray', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'685216689'))  ,'Hampden','6173135419', 'alfordmurray@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Amy Johnston', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'820296811'))  ,'Middlesex','6175145420', 'amyJohnson@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Dainton Anderson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'711178982'))  ,'Boston','6173135421', 'dainton@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Nicholas Spencer', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'258286904'))  ,'Leeds','6175145422', 'nicholasspencer@gmail.com', NULL, NULL, '201' )
INSERT into Employee (Employee_Name, SSN, [Address], Contact_Number, Email_ID, Office_ID, Warehouse_ID, Role_ID ) values ('Jacob Richardson', EncryptByKey(Key_GUID('EmpSSN_SM'), convert(varbinary,'577501374'))  ,'Franklin','6175145423', 'jacobrhicard@gmail.com', NULL, NULL, '201' )
--SELECT * FROM Employee


INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('C4BM53','500.40','250')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('C4BM87','460.50','251')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('A0BB50','420','252')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('C4SY55','490','253')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P4LM53','500','254')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('D4UM53','500','255')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('I4BB53','390','256')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('H4IC53','440','257')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('M4YU53','440.50','258')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P4TY09','410','259')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P4TY12','410','260')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('J4BM53', '500.40','261')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('K4BM87', '460.50', '262')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('L0BB50', '420', '263')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('M4SY55', '490', '264')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('N4LM53', '500', '265')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('W0UM53', '500', '266')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('I4LB53', '390', '267')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P4KC53', '440', '268')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('M4II53', '440.50', '269')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P9BI09', '410', '270')
INSERT INTO vehicle (Vehicle_Number, Capacity, Employee_ID) VALUES ('P9BI19', '410', '271')
--SELECT * FROM Vehicle;


INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-07-02','2022-07-05', '150', '600.2', 'tremont', 'Prepared', '2001', '2002','C4BM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-08-02','2022-08-05', '115', '500.4', 'saks ave', 'Shipped', '2001', '2009','A0BB50')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-09-02','2022-09-05', '120', '400.1', 'commonwealth ave', 'In-Transit', '2009', '2002','C4BM87')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-10-02','2022-10-05', '105', '550.8', 'parker hill ave', 'Shipped', '2006', '2008','C4SY55')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-11-02','2022-11-05', '130', '440.5', 'camden ave', 'Prepared', '2009', '2008','P4LM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-11-01','2022-11-05', '100', '570.6', 'tremont', 'In-Transit', '2005', '2008','D4UM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-02','2022-02-05', '134', '480.4', 'parker hill av', 'Delivered', '2006', '2002','I4BB53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-03-02','2022-03-05', '108', '460.6', 'tremont', 'Cancelled', '2004', '2002','H4IC53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-09-22','2022-09-25', '140', '550.5', 'camden ave', 'Delayed', '2001', '2007','P4TY09')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-02','2022-02-05', '140', '510.3', 'camden ave', 'Delayed', '2005', '2004','P4TY12')

INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-12', '2022-02-15', '140', '509.1', 'camden ave', 'Delayed', '2005', '2004', 'P9BI19')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-07-12', '2022-07-15', '150', '600.2', 'tremont', 'Prepared', '2001', '2002', 'J4BM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-08-12', '2022-08-15', '115', '500.4', 'saks ave', 'Shipped', '2001', '2009', 'K4BM87')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-09-12', '2022-09-15', '120', '400.1', 'commonwealth ave', 'In-Transit', '2009', '2002', 'L0BB50')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-10-12', '2022-10-15', '105', '550.8', 'parker hill ave', 'Shipped', '2006', '2008', 'M4SY55')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-11-12', '2022-11-15', '130', '440.5', 'camden ave', 'Prepared', '2009', '2008', 'N4LM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-11-12', '2022-11-15', '100', '570.6', 'tremont', 'In-Transit', '2005', '2008', 'W0UM53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-12', '2022-02-15', '134', '480.4', 'parker hill av', 'Delivered', '2006', '2002', 'I4LB53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-03-12', '2022-03-15', '108', '460.6', 'tremont', 'Cancelled', '2004', '2002', 'P4KC53')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-09-23', '2022-09-25', '140', '550.5', 'camden ave', 'Delayed', '2001', '2007', 'M4II53') 
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-12', '2022-02-15', '140', '510.3', 'camden ave', 'Prepared', '2005', '2001', 'P9BI09')
INSERT INTO Shipment (Shipment_Date, Expected_Delivery_Date, Total_Quantity, Total_Weight, Shipment_Last_Location, Shipment_Status, Origin_Warehouse_ID, Destination_Warehouse_ID, Vehicle_Number) VALUES('2022-02-12', '2022-02-15', '140', '510.3', 'camden ave', 'Delayed', '2005', '2004', 'P9BI19')
--SELECT * FROM Shipment

--Select * from Customer
--Select * from Package_Type
--Select * from Delivery_Mode

--Select * from Priority

--Select * From Warehouse where Warehouse_ID = 2007
--Select * from Offices where Office_ID = 107

--Select * from Address where Address_ID = 184
--Select * from Address where Postal_Code = '01360'

--Select * from Shipment where Shipment_ID = 1009

--Select * from Service_Location

INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('25','Amity Street','Order Placed', '425','250','175','184', '100','150','01360',NULL,'2000', '100' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('40','29 Copley St','Dispatched', '427','251','176','179', '101','152','01031','1000','2001', '101' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('50','20 Parkley St','In-Transit', '432','251','182','179', '109','152','01824','1002','2009', '109' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('35','Charlesgate','In-Transit', '430','250','187','185', '105','153','01199','1005','2005', '105' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('18','Park Drive','Delayed', '431','251','176','183', '101','151','01360','1008','2001', '101' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('21','Emmet Place','Cancelled', '428','251','180','179','104','153','01031','1007','2004', '104' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('20','Longfellow Place','Dispatched', '426','250','176','182', '101','152','01824','1001','2001', '101' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('47','Newcomb Street','Dispatched', '428','251','188','178', '106','152','01199','1003','2006', '106' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('16','Longfellow Place','Order Placed', '425','250','182','178', '109','151','01199','1004','2009', '109' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('45','Addison Street','Delivered', '429','251','184','178', '107','153','01199','1006','2006', '106' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('10','Jason Terrace','Delayed', '426','250','187','183', '105','153','01360','1009','2005', '105' )

INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('21', 'Meghan Terrace', 'Delayed', '427', '251', '187', '180', '105', '152', '01226', '1010', '2005', '105' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('13', 'Jason Lane', 'Order Placed', '432', '251', '190', '179', '111', '151', '01031', '1011', '2001', '101' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('16', 'Liu Place', 'Dispatched', '429', '251', '190', '182', '111', '153', '01824', '1012', '2001', '101' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('12', 'Princeton Road', 'Cancelled', '430', '250', '182', '179', '109', '153', '01031', '1013', '2009', '109' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('19', 'Park Road', 'Order Placed', '431', '251', '188', '178', '106', '150', '01199', '1014', '2006', '106' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('17', 'Clemsen Road', 'Delayed', '427', '250', '196', '178', '119', '152', '01199', '1015', '2009', '109' )
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('12', 'Tram Road', 'Cancelled', '426', '250', '187', '178', '105', '151', '01199', '1016', '2005', '105')
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('22', 'Carter Road', 'Delayed', '425', '250', '188', '193', '106', '153', '01031', '1017', '2006', '106')
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('21', 'Temple Place', 'In-Transit', '431', '251', '180', '179', '104', '150', '01031', '1018', '2004', '104')
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('18', 'Northampton Street', 'Delayed', '432', '251', '176', '183', '101', '151', '01360', '1019', '2001', '101')
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('18', 'Washington Street', 'In-Transit', '425', '250', '187', '176', '105', '152', '02254', '1020', '2005', '105')
INSERT INTO Package (Package_Weight, Last_Updated_Location, Delivery_Status, Package_Type_ID, Delivery_Mode_ID, Origin_Address_ID, Destination_Address_ID, Customer_ID, Priority_ID, Service_Location_Zipcode, Shipment_ID, Warehouse_ID, Office_ID ) VALUES ('10', 'Southampton Street', 'Cancelled', '429', '250', '187', '180', '105', '153', '01226', '1021', '2005', '105')
--Select * from Package


--Select p.Package_ID, s.Shipment_ID, p.Package_Weight, s.Shipment_Date, s.Expected_Delivery_Date, s.Shipment_Status ,p.Delivery_Status
--from Package p join Shipment s on p.Shipment_ID = s.Shipment_ID
--where p.Package_ID = 1010

INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-07-02', '55', 'Pending', 51,  1000)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-07-01', '40', 'Complete', 50,  1001)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-09-01', '35', 'Complete', 52,  1002)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-10-30', '25', 'Complete', 54,  1003)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-09-22', '50', 'Failed', 50,  1004)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-03-01', '35', 'Refunded', 56,  1005)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-08-01', '25', 'Complete', 55,  1006)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-10-04', '60', 'Complete', 52,  1007)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-11-01', '15', 'Pending', 50,  1008)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-02', '60', 'Complete', 55,  1009)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-02', '50', 'Revoked', 58,  1010)
--Select * from Payments

INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-11', '25', 'Pending', 51,  1011)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-07-10', '36', 'Pending', 52,  1012)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-08-11', '44', 'Complete', 55,  1013)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-08-12', '35', 'Refunded', 54,  1014)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-09-11', '34', 'Complete', 52,  1015)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-11-11', '23', 'Pending', 56,  1016)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-11-11', '28', 'Revoked', 57,  1017)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-10', '31', 'Complete', 58,  1018)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-03-09', '32', 'Complete', 55,  1019)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-09-22', '44', 'Pending', 57,  1020)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-11', '33', 'Complete', 54,  1021)
INSERT INTO Payments (Payment_Date, Total_Amount, Payment_Status, Payment_Type_ID, Package_ID) VALUES ('2022-02-02', '39', 'Refunded', 57,  1022)



