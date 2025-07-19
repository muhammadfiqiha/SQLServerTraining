INSERT INTO Dealer(Region, City, DealerName, DealerTaxRate)
VALUES
('Jawa', 'Jakarta', 'Dealer A', 11),
('Jawa', 'Surabaya', 'Dealer B', 11),
('Jawa', 'Bandung', 'Dealer C', 11),
('Sumatera', 'Palembang', 'Dealer D', 9),
('Kalimantan', 'Banjarmasin', 'Dealer E', 9),
('Sulawesi', 'Makassar', 'Dealer F', 10),
('Maluku', 'Ambon', 'Dealer G', 10),
('Bali', 'Denpasar', 'Dealer H', 11);

INSERT INTO CarModel(BasePriceMil, FuelType)
VALUES
(120.0, 'Petrol'),
(140.0, 'Petrol'),
(180.0, 'Diesel'),
(240.0, 'EV'),
(200.0, 'Diesel');

INSERT INTO CarUnit(CarVIN, ModelId, DealerId, IsSold)
VALUES
('A11', 1, 1, 0),
('A21', 2, 1, 1),
('A31', 3, 1, 0),
('A41', 4, 1, 0),
('A51', 5, 1, 0),
('B11', 1, 2, 0),
('B21', 2, 2, 0),
('B31', 3, 2, 0),
('B41', 4, 2, 1),
('B51', 5, 2, 0),
('C11', 1, 3, 0),
('C21', 2, 3, 1),
('C31', 3, 3, 0),
('C41', 4, 3, 0),
('C51', 5, 3, 0),
('D11', 1, 4, 1),
('D21', 2, 4, 0),
('D31', 3, 4, 0),
('D41', 4, 4, 0),
('D51', 5, 4, 0),
('E11', 1, 5, 0),
('E21', 2, 5, 0),
('E31', 3, 5, 1),
('E41', 4, 5, 0),
('E51', 5, 5, 0);

INSERT INTO SalesPerson(SalespersonCode, EmpId, DealerId)
VALUES
('AB', 1, 1),
('CD', 2, 2),
('EF', 3, 3),
('GH', 4, 4),
('IJ', 5, 5);

INSERT INTO Employee(FirstName, LastName, IsActive, Email, PhoneNumber, HireDate)
VALUES
('Abraham', 'Lincoln', 1, 'abrahamlincoln123@gmail.com', '089284921254', '2025-01-01'),
('J.J.', 'Abrams', 1, 'abramsjj123@gmail.com', '089321469429', '2025-02-01'),
('Elon', 'Musk', 1, 'elonmusk123@gmail.com', '082322114574', '2025-02-01'),
('George', 'Bush', 1, 'georgebush123@gmail.com', '082312341384', '2025-03-24'),
('Ersnt', 'Ising', 1, 'ernstising123@gmail.com', '083412342112', '2025-06-25');

INSERT INTO Customer(FirstName, LastName, PhoneNumber, CustomerAddr, Age)
VALUES
('Albert', 'Einstein', '082313029374', 'Ellaine Road no. 43', 45),
('Marie', 'Curie', '084921240482', 'St. John Road no. 12', 41),
('Simo', 'Hayha', '083212494535', 'Moscow Street 3', 32),
('Qin', 'ShiHuang', '082239348641', 'Strawberry Road no. 21', 28),
('Isaac', 'Newton', '089412574432', 'Carnaby Street no. 11', 42);

INSERT INTO ConsultHistory(CustId, DealerId, SalespersonId, CarId, BudgetMillion, ConsultDate, Note)
VALUES
(1, 2, 2, 9, 280.0, '2020-03-24', 'Customer wanted to test drive first.'),
(2, 3, 3, 15, 180.0, '2020-04-26', 'Customer needed to rethink first.'),
(3, 1, 1, 2, 250.0, '2020-09-18', 'Customer wanted to test drive first.'),
(4, 4, 4, 16, 300.0, '2021-01-09', 'Customer needed to rediscuss first.'),
(5, 5, 5, 23, 100.0, '2021-01-12', 'Customer will send news about his choice by Friday.');

INSERT INTO TestDrive(CustId, DealerId, SalespersonId, CarId, Note, TestDate, Result, Testlocation)
VALUES
(1, 2, 2, 9, 'The test went smooth.', '2020-03-27', 1, 2),
(3, 1, 1, 2, 'The test went fine.', '2020-09-22', 1, 1),
(2, 3, 3, 15, 'There was a problem with the seat. Customer wanted to change the car to Model 2.', '2020-10-27', 0, 3),
(2, 3, 3, 12, 'The test gone smoothly', '2020-10-28', 1, 3),
(5, 5, 5, 23, 'The test went fine.', '2021-01-21', 1, 5),
(4, 4, 4, 16, 'There was a problem with the steering wheel.', '2021-07-07', 0, 4),
(4, 4, 4, 16, 'The test went fine with other car.', '2021-07-10', 1, 4);

INSERT INTO Agreement(CustId, SalespersonId, FixedPrice, DiscountRate, DownPayment, PaymentMethod, AgreementDate, IsPaymentFinished, CreditId)
VALUES
(1, 2, 255.0, 5, 50.0, 'Cash', '2020-04-01', 1, null),
(2, 3, 167.0, 10, 30.0, 'Credit', '2020-11-10', 0, 1),
(3, 1, 221.0, 8, 50.0, 'Cash', '2020-09-29', 1, null),
(4, 4, 144.0, 5, 40.0, 'Cash', '2021-07-24', 1, null),
(5, 5, 197.0, 5, 35.0, 'Credit', '2021-01-31', 0, 2);

INSERT INTO Credit(CustId, AgreementId, CreditNominal, Tenor, AmountPerMonth, CreditStatus) 
VALUES 
(2, 2, 137.0, 48, 2.86, 'Active'),
(5, 5, 162.0, 12, 13.50, 'Active');

INSERT INTO DealerCarList(DealerId, ModelId, DealerAddedPrice, Stock)
VALUES
(1, 1, 130.0, 1), -- 1
(1, 2, 150.0, 1),
(1, 3, 190.0, 1),
(1, 4, 250.0, 1),
(1, 5, 210.0, 1), 
(2, 1, 125.0, 1), -- 6
(2, 2, 145.0, 1),
(2, 3, 185.0, 1),
(2, 4, 245.0, 1),
(2, 5, 205.0, 1),
(3, 1, 127.0, 1), -- 11
(3, 2, 147.0, 1),
(3, 3, 187.0, 1),
(3, 4, 247.0, 1),
(3, 5, 207.0, 1),
(4, 1, 125.0, 1), -- 16
(4, 2, 145.0, 1),
(4, 3, 185.0, 1),
(4, 4, 245.0, 1),
(4, 5, 205.0, 1),
(5, 1, 125.0, 1), -- 21
(5, 2, 145.0, 1),
(5, 3, 185.0, 1),
(5, 4, 245.0, 1),
(5, 5, 205.0, 1);

INSERT INTO CarUnitAgreement(CarId, AgreementId)
VALUES
(9, 1),
(12, 2),
(2, 3),
(16, 4),
(23, 5);

INSERT INTO PaymentHistory(AgreementId, PaymentDate, AmountMillion, CreditId, PaymentCount, Notes) 
VALUES
(1, '2020-04-01', 50.0, null, 1, 'Down Payment for Agreement 1.'),
(1, '2020-04-02', 205.0, null, 2, 'Finish Payment for Agreement 1.'),
(3, '2020-09-29', 50.0, null, 1, 'Down Payment for Agreement 3.'),
(3, '2020-10-01', 171.0, null, 2, 'Finish Payment for Agreement 3.'),
(2, '2020-11-10', 30.0, 1, 1, 'Down Payment for Agreement 2.'),
(2, '2020-11-12', 2.86, 1, 2, 'Second Payment for Agreement 2.'),
(2, '2020-12-12', 2.86, 1, 3, 'Third Payment for Agreement 2.'),
(2, '2021-01-10', 2.86, 1, 2, 'Fourth Payment for Agreement 2.'),
(5, '2021-01-31', 35.0, 2, 1, 'Down Payment for Agreement 5.'),
(5, '2021-02-07', 13.50, 2, 2, 'Second Payment for Agreement 5.'),
(2, '2021-02-09', 2.86, 1, 3, 'Fifth Payment for Agreement 2.'),
(5, '2021-03-08', 13.50, 2, 3, 'Third Payment for Agreement 5.'),
(2, '2021-03-09', 2.86, 1, 2, 'Sixth Payment for Agreement 2.'),
(5, '2021-04-10', 13.50, 2, 4, 'Fourth Payment for Agreement 5.'),
(2, '2021-04-11', 2.86, 1, 3, 'Seventh Payment for Agreement 2.'),
(5, '2021-05-05', 13.50, 2, 5, 'Fifth Payment for Agreement 5.'),
(2, '2021-05-10', 2.86, 1, 2, 'Eighth Payment for Agreement 2.'),
(5, '2021-06-03', 13.50, 2, 6, 'Sixth Payment for Agreement 5.'),
(2, '2021-06-09', 2.86, 1, 3, 'Ninth Payment for Agreement 2.'),
(2, '2021-07-12', 2.86, 1, 2, 'Tenth Payment for Agreement 2.'),
(5, '2021-07-12', 13.50, 2, 7, 'Seventh Payment for Agreement 5.'),
(4, '2021-07-24', 40.0, null, 1, 'Down Payment for Agreement 4.'),
(4, '2021-07-25', 104.0, null, 2, 'Finish Payment for Agreement 4.'),
(5, '2021-08-09', 13.50, 2, 8, 'Eighth Payment for Agreement 5.'),
(2, '2021-08-15', 2.86, 1, 3, 'Eleventh Payment for Agreement 2.'),
(5, '2021-09-08', 13.50, 2, 9, 'Ninth Payment for Agreement 5.'),
(2, '2021-09-18', 2.86, 1, 3, 'Eleventh Payment for Agreement 2.'),
(5, '2021-10-11', 13.50, 2, 10, 'Tenth Payment for Agreement 5.'),
(2, '2021-10-17', 2.86, 1, 3, 'Eleventh Payment for Agreement 2.'),
(5, '2021-11-08', 13.50, 2, 11, 'Eleventh Payment for Agreement 5.'),
(2, '2021-11-14', 2.86, 1, 3, 'Eleventh Payment for Agreement 2.');

INSERT INTO WarrantyRegistration(CarId, PurchaseDate, ExpiredDate)
VALUES
(9, '2020-04-02', '2025-04-02'),
(12, '2020-11-12', '2025-11-12'),
(2, '2020-10-01', '2025-10-01'),
(16, '2021-07-25', '2026-07-25'),
(23, '2021-02-07', '2026-02-07');

INSERT INTO WarrantyClaim(ServiceId, RepairDate, CostCovered, ClaimStatus, IssueReported, CustomerId, WarrantyId) 
VALUES
(3, '2021-01-13', 2.0, 'Completed', 'Damaged seat cover.', 2, 2),
(3, '2021-02-22', 5.0, 'Completed', 'Brake failure.', 2, 2),
(2, '2021-04-28', 3.0, 'Completed', 'Air conditioning failure.', 1, 1),
(4, '2021-11-30', 4.0, 'Completed', 'Body/paint defect.', 4, 4),
(4, '2022-02-08', null, 'In Progress', 'Engine failure', 4, 4);

-- INSERT INTO CarMaintenanceStatus() 
-- INSERT INTO ServiceAppointment() 
-- INSERT INTO CarService() 