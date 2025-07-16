------------- Study Case 3 Supplier and Procurement --------------
-- Create database
CREATE DATABASE SupplierProcurement;
use SupplierProcurement;

-- Create table
-- Requirements and relationship
-- 1. Some suppliers provide multiple parts, each part can be provided by many suppliers
-- 2. Track unit price per supplier, delivery lead time, and supplier rating.
-- 3. Parts are identified uniquely by part number and belong to a category.

-- Part Category
CREATE TABLE PartCategory (
	CategoryId INT PRIMARY KEY IDENTITY(1,1),
	CategoryName VARCHAR(15) NOT NULL,
);

-- Part
CREATE TABLE Part (
	Id INT PRIMARY KEY IDENTITY(1,1),
	PartNum INT UNIQUE NOT NULL,
	CategoryId INT NOT NULL,

	FOREIGN KEY (CategoryId) REFERENCES PartCategory(CategoryId)
);

-- Supplier
CREATE TABLE Supplier (
	SupplierId INT PRIMARY KEY IDENTITY(1,1),
	SupplierName VARCHAR(20) NOT NULL,
);

-- SupplierPartOffer
CREATE TABLE SupplierPartOffer (
	SupplierPartId INT PRIMARY KEY IDENTITY(1,1),
	SupplierId INT NOT NULL,
	PartId INT NOT NULL,
	UnitPrice FLOAT NOT NULL,
	LeadTimeDays INT NOT NULL,
	Rating FLOAT NOT NULL,

	FOREIGN KEY (SupplierId) REFERENCES Supplier(SupplierId),
	FOREIGN KEY (PartId) REFERENCES Part(Id),
);