-- Function to Calculate Estimated Car Price From Dealer Markup Price, Dealer Tax Rate, and Discount Rate 
CREATE FUNCTION ufnGetCarEstimatedFinalPrice (
	@modelid int,
	@dealerid int,
	@discountrate int
)
RETURNS money
AS
BEGIN
	DECLARE @price money
	DECLARE @taxrate int
	DECLARE @fixedprice money

	-- Get Price from DealerCar
	SET @price = (SELECT DealerAddedPrice FROM DealerCarList
				  WHERE ModelId = @modelid AND DealerId = @dealerid)

	SET @taxrate = (SELECT DealerTaxRate FROM Dealer
					WHERE DealerId = @dealerid)

	SET @fixedprice = @price * (1 + (@taxrate / 100) - (@discountrate / 100))

	RETURN @fixedprice
END

SELECT dbo.ufnGetCarEstimatedFinalPrice(1, 2, 10) AS EstimatedPrice;