-- create database
if not exists(select name from sys.databases where name='Exercise01')
begin
	create database Exercise01
end;

-- switch db
use Exercise01;

-- Case 1
create table Plant(
	Id int identity(1,1) primary key,
	PlantName varchar(30) not null,
	City varchar(15) not null,
	Country varchar(15) not null,
	TotalArea float not null,
	YearStarted int not null,
);

-- Case 2
create table CarModel(
	Id int identity(1,1) primary key,
	ModelName varchar(20) not null,
	CarType varchar(10) not null,
	EngineCapacity float not null,
	YearLaunched int not null,
	FuelType varchar(15) not null,
);

-- Case 3
create table ProductionPlan(
	Id int identity(1,1) primary key,
	ReferenceName varchar(30) not null,
	MonthApplied varchar(10) not null,
	YearApplied int not null,
	NumberOfUnits int not null,
	Notes text,
);

-- Case 4
create table Dealer(
	Id int identity(1,1) primary key,
	DealerName varchar(15) not null,
	City varchar(20) not null,
	Province varchar(30) not null,
	PhoneNumber varchar(14) not null,
	YearStarted int not null,
);

-- Case 5
create table CarSale(
	Id int identity(1,1) primary key,
	CustomerName varchar(30) not null,
	ModelName varchar(20) not null,
	OrderDate date not null,
	Price money not null,
	IsCredit bit not null,
);

-- Case 6
create table MaintenanceLog(
	Id int identity(1,1) primary key,
	CustomerName varchar(30) not null,
	ModelName varchar(20) not null,
	ServiceDate date not null,
	ServiceType varchar(20) not null,
	ServiceId int not null,
);

-- Case 7
create table PartInventory(
	Id int identity(1,1) primary key,
	PartName varchar(18) not null,
	PartNumber int not null,
	PartCategory varchar(15) not null,
	StockQty int,
	UnitPrice int not null,
	IsActive bit not null,
);

-- Case 8
create table CustomerFeedback(
	Id int identity(1,1) primary key,
	CustomerName varchar(30) not null,
	Rating smallint not null,
	ModelName varchar(20) not null,
	FeedbackDate date not null,
	Comments text,
);
