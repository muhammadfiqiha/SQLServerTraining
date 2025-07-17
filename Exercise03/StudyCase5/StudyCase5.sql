------ Study Case 5 Warranty Registration and Claim Tracking -------

-- Create database
CREATE DATABASE WarrantyClaim;

USE WarrantyClaim;

-- Create table
-- Requirements and Relationship
-- 1. Every car sold is registered for warranty
-- 2. Each warranty is linked to a car's VIN, purchase date, and warranty period
-- 3. Customers may submit claims if problems occur during the warranty period
-- 4. Each claim includes problem description, service center, repair date, and cost covered

-- Car
CREATE TABLE Car (
	CarId INT PRIMARY KEY IDENTITY(1,1),
	CarModel VARCHAR(20),
	CarVIN VARCHAR(20) UNIQUE,
	WarrantyId INT NOT NULL,
);

-- Customer
CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY IDENTITY(1,1),
	CustName VARCHAR(30),
);

-- Warranty
CREATE TABLE WarrantyRegistration (
	WarrantyId INT PRIMARY KEY IDENTITY(1,1),
	CarVIN VARCHAR(20) NOT NULL,
	PurchaseDate DATE,
	WarrantyPeriod DATE NOT NULL,
);

ALTER TABLE Car
ADD FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId);

ALTER TABLE WarrantyRegistration
ADD FOREIGN KEY (CarVIN) REFERENCES Car(CarVIN);

-- Claims
CREATE TABLE WarrantyClaim (
	ClaimId INT PRIMARY KEY IDENTITY(1,1),
	ServiceCenter VARCHAR(20),
	RepairDate DATE,
	CostCovered MONEY,
	ClaimStatus VARCHAR(10),
	IssueReported TEXT,
	CustomerId INT NOT NULL,
	WarrantyId INT NOT NULL,

	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId),
);