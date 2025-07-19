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
