-- VIEW
-- Sales Report
CREATE VIEW vw_SalesReport
AS
SELECT
	ca.AgreementId as Id,
	a.AgreementDate as AgreementDate,
	a.CustId as CustomerId,
	ca.CarId,
	a.FixedPrice,
	a.DiscountRate,
	a.IsPaymentFinished,
	a.DownPayment,
	a.PaymentMethod,
	a.SalespersonId
FROM 
	CarUnitAgreement ca
LEFT JOIN
	Agreement a 
ON
	ca.AgreementId = a.AgreementId; 

SELECT * FROM vw_SalesReport;

-- Credit Status
CREATE VIEW vw_CreditStatus
AS
SELECT 
	CreditId as Id,
	CustId as CustomerId,
	CreditNominal,
	Tenor,
	AmountPerMonth,
	CreditStatus
FROM
	Credit;

SELECT * FROM vw_CreditStatus;

-- Car Available List
CREATE VIEW vw_AvailableCarList
AS
SELECT
	DealerId,
	ModelId,
	Stock,
	DealerAddedPrice as Price
FROM
	DealerCarList
WHERE
	Stock > 0;

SELECT * FROM vw_AvailableCarList;
