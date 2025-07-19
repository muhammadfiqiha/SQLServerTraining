CREATE DATABASE AutoCarDealership;
USE AutoCarDealership;

CREATE TABLE Dealer (
	DealerId int identity(1,1) primary key,
	Region varchar(15) not null,
	City varchar(15) not null,
	DealerName varchar(15) not null,
	DealerTaxRate int not null,
);

CREATE TABLE CarModel (
	ModelId int identity(1,1) primary key,
	BasePriceMil money not null,
	FuelType varchar(12) not null,
);

CREATE TABLE CarUnit (
	CarId int identity(1,1) primary key,
	CarVIN nvarchar(15) unique,
	ModelId int not null,
	DealerId int not null,
	IsSold bit not null,
);

CREATE TABLE Employee (
	EmployeeId int identity(1,1) primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	IsActive bit not null,
	Email nvarchar(30) not null,
	PhoneNumber varchar(15) not null,
	HireDate date,
);

CREATE TABLE SalesPerson (
	SalespersonId int identity(1,1) primary key,
	SalespersonCode varchar(10) not null unique,
	EmpId int not null unique,
	DealerId int not null,
);

CREATE TABLE Customer (
	CustomerId int identity(1,1) primary key,
	FirstName varchar(20) not null,
	LastName varchar(20) not null,
	PhoneNumber varchar(15) not null,
	CustomerAddr text not null,
	Age int not null,
	CustomerIdentityNum varchar(18),
	PaySlip nvarchar(2083),
);

CREATE TABLE ConsultHistory (
	ConsultId int identity(1,1) primary key,
	CustId int not null,
	DealerId int not null,
	SalespersonId int not null,
	CarId int not null,
	BudgetMillion money not null,
	ConsultDate date not null,
	Note text,
);

CREATE TABLE TestDrive (
	TestId int identity(1,1) primary key,
	CustId int not null,
	DealerId int not null,
	SalespersonId int not null,
	CarId int not null,
	Note text,
	TestDate date,
	Result bit,
	TestLocation int,
);

CREATE TABLE Agreement (
	AgreementId int primary key identity(1,1),
	CustId int not null,
	SalespersonId int not null,
	FixedPrice money not null,
	DiscountRate int not null,
	DownPayment money not null,
	PaymentMethod varchar(10),
	AgreementDate date,
	IsPaymentFinished bit not null,
	CreditId int,
);

CREATE TABLE DealerCarList (
	DealerCarId int primary key identity(1,1),
	DealerId int not null,
	ModelId int not null,
	DealerAddedPrice money not null,
	Stock int not null,
);

CREATE TABLE CarUnitAgreement (
	Id int primary key identity(1,1),
	CarId int not null,
	AgreementId int not null,
);

CREATE TABLE Credit (
	CreditId int primary key identity(1,1),
	CustId int not null,
	AgreementId int not null unique,
	CreditNominal money not null,
	Tenor int not null,
	AmountPerMonth money not null,
	CreditStatus varchar(10) not null check (CreditStatus in('Active', 'Overdue', 'Finished')),
);

CREATE TABLE PaymentHistory (
	Id int primary key identity(1,1),
	AgreementId int not null,
	PaymentDate date not null,
	AmountMillion money not null,
	CreditId int,
	PaymentCount int,
	Notes text,
);

CREATE TABLE WarrantyRegistration (
	WarrantyId int primary key identity(1,1),
	CarId int not null unique,
	PurchaseDate date,
	ExpiredDate date not null,
);

CREATE TABLE WarrantyClaim (
	ClaimId int primary key identity(1,1),
	ServiceId int not null,
	RepairDate date not null,
	CostCovered money,
	ClaimStatus varchar(12),
	IssueReported text,
	CustomerId int not null,
	WarrantyId int not null,
);

CREATE TABLE CarMaintenanceStatus (
	Id int primary key identity(1,1),
	CarId int not null,
	CustId int not null,
	DistanceTraveled float,
	EngineStatus bit, -- healthy or not healthy
	StnkNum varchar(20),
	BpkpNum varchar(20),
);

CREATE TABLE CarService (
	ServiceId int primary key identity(1,1),
	Region varchar(20) not null,
	City varchar(20) not null,
	ServiceName varchar(20) not null,
);

CREATE TABLE ServiceAppointment (
	AppointmentId int primary key identity(1,1),
	CarId int not null,
	ServiceId int not null,
	ServiceDate date not null,
	ProblemDesc varchar(20) not null,
	Feedback text,
);


-- ADD FOREIGN KEY
ALTER TABLE CarUnit
ADD FOREIGN KEY (ModelId) REFERENCES CarModel(ModelId);
ALTER TABLE CarUnit
ADD FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId);

ALTER TABLE SalesPerson
ADD FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId);
ALTER TABLE SalesPerson
ADD FOREIGN KEY (EmpId) REFERENCES Employee(EmployeeId);

ALTER TABLE ConsultHistory
ADD FOREIGN KEY (CustId) REFERENCES Customer(CustomerId);
ALTER TABLE ConsultHistory
ADD FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId);
ALTER TABLE ConsultHistory
ADD FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId);
ALTER TABLE ConsultHistory
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);

ALTER TABLE TestDrive
ADD FOREIGN KEY (CustId) REFERENCES Customer(CustomerId);
ALTER TABLE TestDrive
ADD FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId);
ALTER TABLE TestDrive
ADD FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId);
ALTER TABLE TestDrive
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);

ALTER TABLE Agreement
ADD FOREIGN KEY (CustId) REFERENCES Customer(CustomerId);
ALTER TABLE Agreement
ADD FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId);

ALTER TABLE DealerCarList
ADD FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId);
ALTER TABLE DealerCarList
ADD FOREIGN KEY (ModelId) REFERENCES CarModel(ModelId);

ALTER TABLE CarUnitAgreement
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);
ALTER TABLE CarUnitAgreement
ADD FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId);

ALTER TABLE Credit
ADD FOREIGN KEY (CustId) REFERENCES Customer(CustomerId);
ALTER TABLE Credit
ADD FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId);

ALTER TABLE PaymentHistory
ADD FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId);
ALTER TABLE PaymentHistory
ADD FOREIGN KEY (CreditId) REFERENCES Credit(CreditId);

ALTER TABLE WarrantyRegistration
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);

ALTER TABLE WarrantyClaim
ADD FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId);

ALTER TABLE CarMaintenanceStatus
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);
ALTER TABLE CarMaintenanceStatus
ADD FOREIGN KEY (CustId) REFERENCES Customer(CustomerId);

ALTER TABLE ServiceAppointment
ADD FOREIGN KEY (CarId) REFERENCES CarUnit(CarId);
ALTER TABLE ServiceAppointment
ADD FOREIGN KEY (ServiceId) REFERENCES CarService(ServiceId);

-- Merge Credit and Agreement (or make it one to one) DONE
-- Add tax for different dealer DONE
-- Add 1 more table (junction) to facilitate buyer who will buy 2 cars or more (car, dealer, agreement/loi) DONE
-- Fix Car and Dealer so it will add price and stock from dealer (could add 1 junction table) DONE
