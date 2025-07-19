|-----------------------------------------------------------------------------|
|----------------------- SQL Final Project Program ---------------------------|
}-------------------------- Auto Car Dealership ------------------------------|
|-----------------------------------------------------------------------------|



-------------- VIEW ------------------|
-- 1. Sales Report View				--|
SELECT * FROM vw_SalesReport;		--|
									--|
-- 2. Credit Status View			--|
SELECT * FROM vw_CreditStatus;		--|
									--|
-- 3. Available Car View			--|
SELECT * FROM vw_AvailableCarList;	--|
									--|
--------------------------------------|



------------------------------- FUNCTION ---------------------------------|
-- Calculate Estimated Car Price from									--|
-- Dealer Markup Price													--|
-- Dealer Tax Rate														--|
-- Discount Rate (user defined)											--|
																		--|
-- HOW TO USE															--|
-- 1. First parameter is car model id (int) with value 1-5				--|
-- 2. Second parameter is dealer id (int) with value 1-8				--|
-- 3. Third parameter is discount rate (int) with value 1-100			--|
																		--|
SELECT dbo.ufnGetCarEstimatedFinalPrice(1, 2, 10) AS EstimatedPrice;	--|
																		--|
--------------------------------------------------------------------------|



--------------------- STORED PROCEDURE -----------------------|
-- Stored procedures to register a new customer				--|
															--|
-- See Customer Table Before SP								--|
SELECT * FROM Customer;										--|
															--|
------ NOW BLOCK THE CODE FROM HERE	------					--|
DECLARE @newcustomerid int									--|
															--|
EXEC uspRegisterCustomer									--|
	@firstname = 'Thomas',									--|
	@lastname = 'Edison',									--|
	@phonenumber = '089212848793',							--|
	@address = 'Leipsich Street no. 18',					--|
	@age = 51,												--|
	@customerid = @newcustomerid							--|
OUTPUT														--|
															--|
-- Display the new customer									--|
SELECT * FROM Customer WHERE CustomerId = @newcustomerid;	--|
-- TO HERE AND RUN IN 1 BLOCK TO SEE THE NEW CUSTOMER --	--|
															--|
--------------------------------------------------------------|



-------------------------- TRIGGER -------------------------------|
																--|
-- Trigger to update stock and car status per unit (IsSold)		--|
-- In this case is using CarId 6 and 19							--|
																--|
---------------------- BEFORE TRIGGERS ---------------------------|
-- See the status (IsSold) before triggers						--|
SELECT * FROM CarUnit WHERE CarId = 6 OR CarId = 9;				--|
-- See stock before triggers									--|
SELECT															--|
	dc.DealerCarId,												--|
	dc.DealerId,												--|
	dc.ModelId,													--|
	dc.Stock													--|
FROM															--|
	DealerCarList dc											--|
JOIN															--|
	CarUnit cu													--|
ON																--|
	dc.DealerId = cu.DealerId AND dc.ModelId = cu.ModelId		--|
WHERE															--|
	cu.CarId = 6 OR cu.CarId = 19;								--|
																--|
																--|
--------------------- ACTIVATE TRIGGERS --------------------------|
-- Insert new data to car unit agreement						--|
INSERT INTO CarUnitAgreement(CarId, AgreementId)				--|
VALUES															--|
(6, 1),															--|
(19, 1);														--|
																--|
---------------------- AFTER TRIGGERS ----------------------------|
-- See Car Status Unit											--|
SELECT * FROM CarUnit WHERE CarId = 6 OR CarId = 19;			--|
																--|
-- See Stock in DealerCarList									--|
SELECT															--|
	dc.DealerCarId,												--|
	dc.DealerId,												--|
	dc.ModelId,													--|
	dc.Stock													--|
FROM															--|
	DealerCarList dc											--|
JOIN															--|
	CarUnit cu													--|
ON																--|
	dc.DealerId = cu.DealerId AND dc.ModelId = cu.ModelId		--|
WHERE															--|
	cu.CarId = 6 OR cu.CarId = 19;								--|
																--|
------------------------------------------------------------------|