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