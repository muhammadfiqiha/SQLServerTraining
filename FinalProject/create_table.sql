CREATE DATABASE AutoCarDealership;
USE AutoCarDealership;

CREATE TABLE Dealer (
	DealerId int identity(1,1) primary key,
	Region varchar(15) not null,
	City varchar(15) not null,
	DealerName varchar(15) not null,
);

CREATE TABLE Car (
	CarId int identity(1,1) primary key,
	CarVIN nvarchar(15) unique,
	ModelId int not null,
	BasePrice money not null,
	DealerId int not null,
	WarrantyId int not null,

	FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
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
	EmpId int not null,
	DealerId int not null,

	FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
	FOREIGN KEY (EmpId) REFERENCES Employee(EmployeeId),
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
	Budget money not null,
	ConsultDate date,
	Note text,

	FOREIGN KEY (CustId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
	FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId),
	FOREIGN KEY (CarId) REFERENCES Car(CarId),
);

CREATE TABLE TestDrive (
	TestId int identity(1,1) primary key,
	CustId int not null,
	DealerId int not null,
	SalespersonId int not null,
	CarId int not null,
	Note text,
	TestDate date,
	Result int,
	TestLocation int,

	FOREIGN KEY (CustId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (DealerId) REFERENCES Dealer(DealerId),
	FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId),
	FOREIGN KEY (CarId) REFERENCES Car(CarId),
);

CREATE TABLE LetterIntent (
	LoiId int primary key identity(1,1),
	AgreementId int not null,
	FixedPrice money not null,
	DiscountAmount int not null,
	DownPayment money not null,
	TaxAmount money not null,
);

CREATE TABLE Agreement (
	AgreementId int primary key identity(1,1),
	CustId int not null,
	SalespersonId int not null,
	CarId int not null,
	LoiId int not null,
	PaymentMethod varchar(10),
	AgreementDate date,

	FOREIGN KEY (CustId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (SalespersonId) REFERENCES SalesPerson(SalespersonId),
	FOREIGN KEY (CarId) REFERENCES Car(CarId),
);

ALTER TABLE LetterIntent
ADD FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId);

ALTER TABLE Agreement
ADD FOREIGN KEY (LoiId) REFERENCES LetterIntent(LoiId);

CREATE TABLE Credit (
	CreditId int primary key identity(1,1),
	CustId int not null,
	AgreementId int not null,
	CreditNominal money not null,
	TotalPeriodInMonth int not null,
	AmountPerMonth money not null,
	CreditStatus bit not null,
	IsFinished bit not null,

	FOREIGN KEY (CustId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId),
);

CREATE TABLE PaymentHistory (
	Id int primary key identity(1,1),
	AgreementId int not null,
	PaymentDate date not null,
	Amount money not null,
	CreditId int,
	PaymentCount int,

	FOREIGN KEY (AgreementId) REFERENCES Agreement(AgreementId),
);

CREATE TABLE WarrantyRegistration (
	WarrantyId INT PRIMARY KEY IDENTITY(1,1),
	CarId int not null,
	PurchaseDate DATE,
	WarrantyPeriod DATE NOT NULL,
);

ALTER TABLE Car
ADD FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId);

ALTER TABLE WarrantyRegistration
ADD FOREIGN KEY (CarId) REFERENCES Car(CarId);

CREATE TABLE WarrantyClaim (
	ClaimId INT PRIMARY KEY IDENTITY(1,1),
	ServiceCenter VARCHAR(20),
	RepairDate DATE,
	CostCovered MONEY,
	ClaimStatus VARCHAR(10),
	IssueReported TEXT,
	CustomerId INT NOT NULL,
	WarrantyId INT NOT NULL,

	FOREIGN KEY (WarrantyId) REFERENCES WarrantyRegistration(WarrantyId),
);

CREATE TABLE CarMaintenanceStatus (
	Id int primary key identity(1,1),
	CarId int not null,
	CustId int not null,
	DistanceTraveled float,
	EngineStatus bit, -- healthy or not healthy
	StnkNum varchar(20),
	BpkpNum varchar(20),

	FOREIGN KEY (CarId) REFERENCES Car(CarId),
	FOREIGN KEY (CustId) REFERENCES Customer(CustomerId),
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

	FOREIGN KEY (CarId) REFERENCES Car(CarId),
	FOREIGN KEY (ServiceId) REFERENCES CarService(ServiceId),
);