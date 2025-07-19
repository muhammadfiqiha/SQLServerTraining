-- Trigger to Update Stock and Update Car Unit Status (IsSold)
CREATE TRIGGER trgStockAndUnitStatus
ON CarUnitAgreement
AFTER INSERT
AS
BEGIN
	-- Update Car Status (IsSold)
	UPDATE
		CarUnit
	SET 
		IsSold = 1
	FROM 
		CarUnit cu
	JOIN 
		inserted i
	ON
		cu.CarId = i.CarId;

	-- Update Stock
	UPDATE 
		DealerCarList
	SET 
		Stock = Stock - 1
	FROM
		DealerCarList dc
	JOIN
		CarUnit cu
	ON
		dc.ModelId = cu.ModelId AND dc.DealerId = cu.ModelId
	JOIN 
		inserted i
	ON
		i.CarId = cu.CarId;
END;

-- Run Triggers (example CarId 6 and 19)
-- See the status (IsSold) before triggers
SELECT * FROM CarUnit WHERE CarId = 6 OR CarId = 9;
-- See stock before triggers
SELECT 
	dc.DealerCarId,
	dc.DealerId,
	dc.ModelId,
	dc.Stock
FROM 
	DealerCarList dc
JOIN
	CarUnit cu
ON
	dc.DealerId = cu.DealerId AND dc.ModelId = cu.ModelId
WHERE
	cu.CarId = 6 OR cu.CarId = 19;

-- Insert new data to car unit agreement 
INSERT INTO CarUnitAgreement(CarId, AgreementId)
VALUES 
(6, 1),
(19, 1);

-- See Car Status Unit 
SELECT * FROM CarUnit WHERE CarId = 6 OR CarId = 19;

-- See Stock in DealerCarList 
SELECT 
	dc.DealerCarId,
	dc.DealerId,
	dc.ModelId,
	dc.Stock
FROM 
	DealerCarList dc
JOIN
	CarUnit cu
ON
	dc.DealerId = cu.DealerId AND dc.ModelId = cu.ModelId
WHERE
	cu.CarId = 6 OR cu.CarId = 19;