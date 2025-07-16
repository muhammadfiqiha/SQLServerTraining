---------- Study Case 4 Car Rental Division System -----------
-- Create Database
CREATE DATABASE CarRental;

USE CarRental;

-- Create Table
-- Requirements and relationship
-- 1. Each rental branch manages a fleet of vehicles
-- 2. Customers can rent cars for specific data range and changed by daily rate
-- 3. Each rental is assigned to a staff member who process a booking
-- 4. Company wants to track vehicle status, mileage, and rental history

-- Rental Branch
CREATE TABLE RentalBranch (
	BranchId INT PRIMARY KEY IDENTITY(1,1),
	BranchName VARCHAR(20) NOT NULL,
	LocationId INT NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
);

-- Vehicle
CREATE TABLE Vehicle (
	VehicleId INT PRIMARY KEY IDENTITY(1,1),
	ModelId INT NOT NULL,
	VehicleNum NVARCHAR(10) NOT NULL,
	VehicleStatus VARCHAR(15) NOT NULL,
	VehicleMileage FLOAT NOT NULL,
	BranchId INT NOT NULL,

	FOREIGN KEY (BranchId) REFERENCES RentalBranch(BranchId),
);

-- Customer
CREATE TABLE Customer (
	CustomerId INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	PhoneNumber VARCHAR(15),
);

-- Employee
CREATE TABLE Employee (
	EmployeeId INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(15),
	LastName VARCHAR(15),
	PhoneNumber VARCHAR(15),
);

-- Rental Contract
CREATE TABLE RentalContract (
	ContractId INT PRIMARY KEY IDENTITY(1,1),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	DailyRate FLOAT NOT NULL,
	CustomerId INT NOT NULL,
	VehicleId INT NOT NULL,
	BranchId INT NOT NULL,
	StaffId INT NOT NULL,

	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (VehicleId) REFERENCES Vehicle(VehicleId),
	FOREIGN KEY (BranchId) REFERENCES RentalBranch(BranchId),
	FOREIGN KEY (StaffId) REFERENCES Employee(EmployeeId),
);