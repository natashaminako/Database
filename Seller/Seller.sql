CREATE DATABASE seller;
USE seller;
CREATE TABLE Seller (
    NoVend INT PRIMARY KEY,
    SexSend CHAR(1),
    NomeSend VARCHAR(100)
);
CREATE TABLE Customer (
    NroCli INT PRIMARY KEY,
    endCli VARCHAR(255),
    nameCli VARCHAR(100),
    NoVend INT,
    FOREIGN KEY (NoVend) REFERENCES Seller(NoVend)
);
CREATE TABLE Department (
    codeDept INT PRIMARY KEY,
    nameDept VARCHAR(100),
    acronymDept VARCHAR(10)
);
CREATE TABLE Advisor (
    codeOrient INT PRIMARY KEY,
    nameOrient VARCHAR(100),
    phoneOrient VARCHAR(15)
);
CREATE TABLE Student (
    numberStudent INT PRIMARY KEY,
    codeDept INT,
    codeOrient INT,
    codeCourse INT,
    FOREIGN KEY (codeDept) REFERENCES Department(codeDept),
    FOREIGN KEY (codeOrient) REFERENCES Advisor(codeOrient)
);
CREATE TABLE OrderPurchase (
    codOrdemPra INT PRIMARY KEY,
    dtIssuance DATE,
    codFornecedor INT,
    nomeFornecedor VARCHAR(100),
    addressFornecedor VARCHAR(255),
    valorTotalOrdem DECIMAL(10, 2)
);
CREATE TABLE OrderItem (
    codOrdemPra INT,
    codItem INT,
    valorTotalItem DECIMAL(10, 2),
    PRIMARY KEY (codOrdemPra, codItem),
    FOREIGN KEY (codOrdemPra) REFERENCES OrderPurchase(codOrdemPra)
);
CREATE TABLE Material (
    codItem INT,
    codMaterial INT,
    descricaoMaterial VARCHAR(255),
    qtComprada INT,
    valorUnitario DECIMAL(10, 2),
    PRIMARY KEY (codItem, codMaterial),
    FOREIGN KEY (codItem) REFERENCES OrderItem(codItem)
);
