CREATE DATABASE	Requirement;
USE Requirement;

CREATE TABLE CUSTOMER(
CustomerID	INT,
Nameid		VARCHAR(20),
Email		VARCHAR(30),
Phone		INT,
Address		VARCHAR(40),
Note		VARCHAR(100)	
);
CREATE TABLE CAR(
CarID		INT,
Maker		VARCHAR(10),
Model		VARCHAR(20),
Year		INT,
Color		VARCHAR(20),
Note		VARCHAR(20)
);
CREATE TABLE CAR_ORDER(
OrderID		VARCHAR(20),
CostomerID	VARCHAR(20),
CarID		VARCHAR(20),
Amount		INT,
SalePrice	VARCHAR(20)
);
    