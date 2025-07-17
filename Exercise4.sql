-- Study Case 1 Active Product Catalog View
CREATE VIEW vw_ActiveProductCatalog
AS
SELECT
	Name AS ProductName,
	ProductNumber,
	ListPrice,
	SellStartDate
FROM Production.Product
WHERE SellEndDate IS NULL;

SELECT * FROM vw_ActiveProductCatalog;

-- Study Case 2 Employee Directory with Job Titles
CREATE VIEW vw_EmployeeDirectory
as
SELECT 
	CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS FullName,
	ea.EmailAddress,
	e.JobTitle
FROM Person.Person p
INNER JOIN 
HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN
Person.EmailAddress ea
ON p.BusinessEntityID = ea.BusinessEntityID
WHERE e.CurrentFlag = 1;

SELECT * FROM vw_EmployeeDirectory;

-- Study Case 3 Sales Order Summary View
CREATE VIEW vw_SalesOrderSummary
AS
SELECT 
	soh.SalesOrderID AS OrderID,
	soh.OrderDate,
	CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS FullName,
	soh.TotalDue
FROM Sales.SalesOrderHeader soh
INNER JOIN
Sales.Customer c
ON soh.CustomerID = c.CustomerID
INNER JOIN
Person.Person p
ON soh.CustomerID = p.BusinessEntityID;

SELECT * FROM vw_SalesOrderSummary;

-- Study Case 4 Product Pricing by Category
CREATE VIEW vw_ProductPricingByCategory
AS
SELECT 
	p.Name AS ProductName,
	ps.Name AS SubcategoryName,
	ListPrice
FROM Production.Product p
LEFT JOIN
Production.ProductSubcategory ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
LEFT JOIN
Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
WHERE ListPrice > 0;

SELECT * FROM vw_ProductPricingByCategory;

-- Study Case 5 Frequent Customer View
CREATE VIEW vw_FrequentCustomers
AS
SELECT
	CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS CustFullName,
	COUNT(soh.SalesOrderID) AS TotalOrder
FROM Sales.SalesOrderHeader soh
INNER JOIN
Sales.Customer c
ON soh.CustomerID = c.CustomerID
INNER JOIN
Person.Person p
ON soh.CustomerID = p.BusinessEntityID
GROUP BY CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName)
HAVING COUNT(soh.SalesOrderID) > 3;

SELECT * FROM vw_FrequentCustomers;

-- Study Case 6 Dealer Sales Performance
CREATE VIEW vw_SalespersonPerformance
AS
SELECT
	CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS SalesFullName,
	SUM(TotalDue) AS SalesAmount,
	COUNT(soh.SalesOrderID) AS OrderHandled
FROM Sales.SalesOrderHeader soh
INNER JOIN
Sales.SalesPerson sp
ON soh.SalesPersonID = sp.BusinessEntityID
INNER JOIN
Person.Person p
ON soh.SalesPersonID = p.BusinessEntityID
WHERE soh.SalesPersonID IS NOT NULL
GROUP BY CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName);

SELECT * FROM vw_SalespersonPerformance;