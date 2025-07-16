----------- Case 1: Vehicle Testing and Certification ---------------
-- Create database
CREATE DATABASE VehicleTest;

use VehicleTest;

-- Create table
-- Relationship =
-- 1 Each session has test engineer, test location, prototype unit of a car model
-- CarModel
CREATE TABLE CarModel (
	ModelID INT PRIMARY KEY IDENTITY(1,1),
	ModelName VARCHAR(20),
	CarType VARCHAR(10) not null,
	EngineCapacity FLOAT not null,
	YearLaunched INT not null,
	FuelType VARCHAR(15) not null,
);

-- PrototypeVehicle
CREATE TABLE PrototypeVehicle (
	PrototypeID INT PRIMARY KEY IDENTITY(1,1),
	PrototypeName VARCHAR(20) NOT NULL,
	PrototypeNum INT NOT NULL,
	ModelID INT NOT NULL,

	FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID),
);

-- TestEngineer
CREATE TABLE TestEngineer (
	EngineerID INT PRIMARY KEY IDENTITY(1,1),
	EngineerName VARCHAR(30) NOT NULL,
	EmployeeID INT NOT NULL,
);

-- TestLocation
CREATE TABLE TestLocation (
	LocationID INT PRIMARY KEY IDENTITY(1,1),
	City VARCHAR(20) NOT NULL,
	LocationName VARCHAR(20) NOT NULL,
	LocationAddr VARCHAR(40) NOT NULL,
	Country VARCHAR(20) NOT NULL,
);

-- VehicleTest 
CREATE TABLE VehicleTest(
	TestID INT PRIMARY KEY IDENTITY(1,1),
	EngineerID INT NOT NULL,
	LocationID INT NOT NULL,
	PrototypeID INT NOT NULL,
	ModelID INT NOT NULL,
	TestDate DATE NOT NULL,
	TestType VARCHAR(15) NOT NULL,
	IsPass BIT NOT NULL,
	Notes TEXT,

	FOREIGN KEY (EngineerID) REFERENCES TestEngineer(EngineerID),
	FOREIGN KEY (LocationID) REFERENCES TestLocation(LocationID),
	FOREIGN KEY (PrototypeID) REFERENCES PrototypeVehicle(PrototypeID),
	FOREIGN KEY (ModelID) REFERENCES CarModel(ModelID),
);
