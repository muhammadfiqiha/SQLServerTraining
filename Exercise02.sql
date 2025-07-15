-- SECTION 1
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

-- SECTION 2
-- 5. List all sales order with customer full name, order date, total due amount
SELECT CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as CustomerFullName, a.OrderDate, a.TotalDue
FROM Sales.SalesOrderHeader a 
LEFT JOIN Person.Person b 
ON a.CustomerID = b.BusinessEntityID;

-- 6. Product Names and Subcategory Names
SELECT a.Name, b.Name 
FROM Production.Product a
LEFT JOIN Production.ProductSubcategory b
ON a.ProductSubcategoryID = b.ProductSubcategoryID;

-- 7. Show each employee name and their job title
SELECT CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as EmployeeFullName, a.JobTitle
FROM HumanResources.Employee a 
LEFT JOIN Person.Person b 
ON a.BusinessEntityID = b.BusinessEntityID;

-- 8. List all orders along with salesperson's full name (if assigned)
SELECT a.*, CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as SalesFullName
FROM Sales.SalesOrderHeader a 
LEFT JOIN Person.Person b 
ON a.SalesPersonID = b.BusinessEntityID;

-- SECTION 3
-- 9. Count the number of Products based on ProductLine
SELECT COUNT(ProductLine) as NumberOfProducts
FROM Production.Product;
-- correction
-- SELECT ProductLine, COUNT(ProductId) FROM Production.Product GROUP BY ProductLine;

-- 10. Find the average of list price of product for each subcategory id
SELECT b.Name as SubcategoryName, AVG(a.ListPrice) as AverageOfListPrice 
FROM Production.Product a
INNER JOIN Production.ProductSubcategory b
ON a.ProductSubcategoryID = b.ProductSubcategoryID
GROUP BY b.Name;

-- 11. Show the total number of employees in each JobTitle
SELECT JobTitle, COUNT(BusinessEntityID) as NumberOfEmployee 
FROM HumanResources.Employee
GROUP BY JobTitle;

-- 12. Count how many orders were placed per year
SELECT YEAR(OrderDate) as OrderYear, COUNT(SalesOrderID) as OrderTotal 
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate) 
ORDER BY OrderYear;

-- SECTION 4
-- 13.List the total sales amount (TotalDue) by customer full name
SELECT CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as CustomerFullName, SUM(a.TotalDue) as TotalSalesAmount
FROM Sales.SalesOrderHeader a 
INNER JOIN 
Person.Person b 
ON a.CustomerID = b.BusinessEntityID
GROUP BY CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName);

-- 14. Show the total number of orders for salesperson
SELECT CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as SalesName, COUNT(a.SalesOrderID) as OrderTotal
FROM Sales.SalesOrderHeader a 
RIGHT JOIN Person.Person b 
ON a.SalesPersonID = b.BusinessEntityID
GROUP BY CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) 
ORDER BY OrderTotal DESC;

-- 15. Average Order Amount (TotalDue) by Year
SELECT YEAR(OrderDate) as OrderYear, AVG(TotalDue) as OrderTotal 
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate) 
ORDER BY OrderYear;

-- 16. Top 5 products with the highest total quantity sold
SELECT TOP 5 b.Name as ProductName, SUM(a.OrderQty) as TotalQuantitySold
FROM Sales.SalesOrderDetail a 
LEFT JOIN 
Production.Product b
ON a.ProductID = b.ProductID
GROUP BY b.Name 
ORDER BY TotalQuantitySold DESC;

-- 17. For each subcategory, find the number of products with a list price greater than 500
SELECT b.Name as SubcategoryName, COUNT(a.ProductID) as TotalOfProduct 
FROM Production.Product a
LEFT JOIN Production.ProductSubcategory b
ON a.ProductSubcategoryID = b.ProductSubcategoryID
WHERE a.ListPrice > 500
GROUP BY b.Name 
ORDER BY TotalOfProduct DESC;

-- 18. Show the employee with the highest number of orders handled as salesperson
SELECT TOP 1 CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) as SalesName, COUNT(a.SalesOrderID) as OrderTotal
FROM Sales.SalesOrderHeader a 
RIGHT JOIN Person.Person b 
ON a.SalesPersonID = b.BusinessEntityID
GROUP BY CONCAT(b.FirstName, ' ', b.MiddleName, ' ', b.LastName) 
ORDER BY OrderTotal DESC;
