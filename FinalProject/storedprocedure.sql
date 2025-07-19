-- Stored Procedure to Add Customer

CREATE PROCEDURE uspRegisterCustomer
	@firstname varchar(20),
	@lastname varchar(20),
	@phonenumber varchar(15),
	@address text,
	@age int,
	@customerid int output
AS
BEGIN
	INSERT INTO Customer (FirstName, LastName, PhoneNumber, CustomerAddr, Age)
	VALUES (@firstname, @lastname, @phonenumber, @address, @age);

	SET @customerid = SCOPE_IDENTITY();
END;

-- Run the stored procedures 
DECLARE @newcustomerid int -- RUN FROM HERE

EXEC uspRegisterCustomer
	@firstname = 'Thomas',
	@lastname = 'Edison',
	@phonenumber = '089212848793',
	@address = 'Leipsich Street no. 18',
	@age = 51,
	@customerid = @newcustomerid 
OUTPUT

-- Display the new customer
SELECT * FROM Customer WHERE CustomerId = @newcustomerid; -- TO HERE IN 1 BLOCK TO SEE THE NEW CUSTOMER
