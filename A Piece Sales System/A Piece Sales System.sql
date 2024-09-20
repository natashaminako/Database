SHOW DATABASES;
CREATE DATABASE apiecesalessystem_sql;
USE apiecesalessystem_sql;

CREATE TABLE Vendor (
    code INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    commission DECIMAL(10, 2)
);

CREATE TABLE Customer (
    code INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    accumulated_billing DECIMAL(10, 2),
    credit_limit DECIMAL(10, 2),
    vendor_code INT,
    FOREIGN KEY (vendor_code) REFERENCES Vendor(code)
);

CREATE TABLE Warehouse (
    number INT PRIMARY KEY,
    address VARCHAR(255)
);

CREATE TABLE Part (
    code INT PRIMARY KEY,
    description VARCHAR(100),
    price DECIMAL(10, 2),
    quantity_in_stock INT,
    warehouse_number INT,
    FOREIGN KEY (warehouse_number) REFERENCES Warehouse(number)
);

CREATE TABLE Order (
    number INT PRIMARY KEY,
    date DATE,
    customer_code INT,
    vendor_code INT,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    FOREIGN KEY (customer_code) REFERENCES Customer(code),
    FOREIGN KEY (vendor_code) REFERENCES Vendor(code)
);

CREATE TABLE Order_Item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_number INT,
    part_code INT,
    quantity INT,
    quoted_price DECIMAL(10, 2),
    FOREIGN KEY (order_number) REFERENCES Order(number),
    FOREIGN KEY (part_code) REFERENCES Part(code)
);