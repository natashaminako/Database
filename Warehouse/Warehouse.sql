CREATE DATABASE warehouse;
USE warehouse;
CREATE TABLE Vendor (
    Vendor_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Commission DECIMAL(10, 2)
);

CREATE TABLE Warehouse (
    Warehouse_ID INT PRIMARY KEY,
    Address VARCHAR(255)
);

CREATE TABLE Part (
    Part_ID INT PRIMARY KEY,
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    Stock_Quantity INT,
    Warehouse_ID INT,
    FOREIGN KEY (Warehouse_ID) REFERENCES Warehouse(Warehouse_ID)
);

CREATE TABLE Client (
    Client_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Total_Billing DECIMAL(15, 2),
    Credit_Limit DECIMAL(15, 2),
    Vendor_ID INT,
    FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID)
);

CREATE TABLE `Order` (
    Order_Number INT PRIMARY KEY,
    Order_Date DATE,
    Client_ID INT,
    Vendor_ID INT,
    Client_Name VARCHAR(100),
    Client_Address VARCHAR(255),
    FOREIGN KEY (Client_ID) REFERENCES Client(Client_ID),
    FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID)
);

CREATE TABLE Order_Item (
    Order_Item_ID INT PRIMARY KEY,
    Order_Number INT,
    Part_ID INT,
    Quantity INT,
    Quoted_Price DECIMAL(10, 2),
    FOREIGN KEY (Order_Number) REFERENCES `Order`(Order_Number),
    FOREIGN KEY (Part_ID) REFERENCES Part(Part_ID)
);
