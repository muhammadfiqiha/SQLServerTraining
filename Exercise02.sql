-- List Product name and their list prices from the production product table where the list price is greater than 1000
SELECT Name, ListPrice 
FROM Production.Product 
WHERE ListPrice >= 1000;

-- find employees in the humanresources employee table who were hired after jan 1 2012
SELECT BusinessEntityID, NationalIDNumber, LoginID, JobTitle, HireDate 
FROM HumanResources.Employee
WHERE HireDate > '2012-01-01';

-- display top 10 most expensive products based on list price in descending order
SELECT TOP 10 Name, ListPrice 
FROM Production.Product
ORDER BY ListPrice DESC;

-- show product names that start with the letter b from the production product table
SELECT Name
FROM Production.Product
WHERE Name like 'b%';

-- display oldest and youngest employee
SELECT BusinessEntityID, NationalIDNumber, LoginID, JobTitle, BirthDate
FROM HumanResources.Employee
WHERE BirthDate = (
	SELECT MAX(BirthDate) FROM HumanResources.Employee
	) 
	OR BirthDate = (
	SELECT MIN(BirthDate) FROM HumanResources.Employee
	);
