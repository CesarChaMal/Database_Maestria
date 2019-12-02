SELECT 
	lastname,firstname
FROM
	Employees

SELECT 
	lastname,firstname
FROM
	Employees
WHERE
	lastname LIKE 'b%'

SELECT 
	lastname,firstname
FROM
	Employees
WHERE
	lastname LIKE '_a%'

SELECT 
	lastname,firstname
FROM
	Employees
WHERE
	lastname LIKE '%a%'

SELECT 
	lastname,firstname
FROM
	Employees
WHERE
	lastname LIKE '_ull%'

SELECT 
	lastname, firstname, city
FROM 
	Employees
WHERE 
	city NOT IN ('seattle','redmond','tacoma')

SELECT 
	lastname, firstname, city
FROM 
	Employees
WHERE 
	city IN ('seattle','redmond','tacoma')

SELECT 
	lastname, firstname, birthdate
FROM 
	Employees
WHERE 
	birthdate BETWEEN '1.1.1993'AND '31.12.1993'

SELECT 
	lastname, firstname, birthdate
FROM 
	Employees
WHERE 
	birthdate NOT BETWEEN '1.1.1993'AND '31.12.1993'

SELECT 
	lastname, firstname, city
FROM 
	Employees
WHERE 
	city <> 'london'

SELECT 
	lastname, firstname, city
FROM 
	Employees
WHERE 
	city != 'london'

SELECT 
	lastname, firstname, city
FROM 
	Employees
WHERE 
	lastname LIKE 'b%' AND city NOT IN ('seattle','redmond','tacoma')

SELECT
	companyname, contactname, region
FROM 
	Suppliers
WHERE 
	region IS NOT NULL

SELECT
	companyname, contactname, region
FROM 
	Suppliers
WHERE 
	region IS NULL

DECLARE @suma float;
SET @suma = 0;
SELECT 
	@suma = (@suma + unitsinstock)
FROM 
	Products;
SELECT @suma

SELECT 
	AVG(unitsinstock) as avg, (SUM(unitsinstock)/COUNT(unitsinstock)) as average,COUNT(unitsinstock),SUM(unitsinstock)
FROM 
	Products;

DECLARE @suma float;
DECLARE @contador int;
DECLARE @resultado float;
SET @suma = 0;
SET @contador = 0;
SET @resultado = 0;

SELECT 
	@suma = (@suma + unitsinstock), @contador = (@contador + 1)
FROM 
	Products;

SELECT 
	@resultado = @suma/@contador
FROM 
	Products;

SELECT	@suma
SELECT	@contador
-- SET @resultado = @suma/@contador
SELECT	@resultado

SELECT 
	AVG(unitsinstock) AS "Promedio De Unidades"
FROM 
	Products

SELECT 
	unitprice
FROM 
	Products
order by unitprice desc;

SELECT 
	MAX(unitprice)
FROM 
	Products

SELECT 
	MIN(unitprice)
FROM 
	Products

SELECT 
	title
FROM 
	Employees


SELECT 
	*
FROM 
	Employees

SELECT 
	COUNT(*)
FROM 
	Employees

SELECT 
	COUNT(EmployeeID)
FROM 
	Employees

SELECT 
	COUNT(LastName)
FROM 
	Employees

SELECT 
	COUNT(title)
FROM 
	Employees

SELECT 
	COUNT(DISTINCT title)
FROM 
	Employees

SELECT 
	title, COUNT(title)
FROM 
	Employees
GROUP BY 
	title


SELECT 
	city, COUNT(city)
FROM 
	Employees
GROUP BY 
	city


SELECT 
	city, COUNT(city)
FROM 
	Employees
WHERE
	city LIKE 'London'
GROUP BY 
	city

SELECT 
	city, COUNT(city)
FROM 
	Employees
GROUP BY 
	city
HAVING 
	city LIKE 'London'


SELECT 
	city, COUNT(city)
FROM 
	Employees
GROUP BY 
	city
HAVING 
	COUNT(city) > 2

SELECT 
	city, COUNT(city)
FROM 
	Employees
WHERE
	COUNT(city)>2
GROUP BY 
	city

SELECT 
	city, COUNT(city)
FROM 
	Employees
WHERE
	city in (SELECT city from branch)
GROUP BY 
	city


SELECT 
	title, city, COUNT(title)
FROM 
	Employees
GROUP BY 
	title, city
WITH ROLLUP;


SELECT
	temp.*
FROM
	(
	SELECT 
		COUNT(title) total
	FROM 
		Employees
	GROUP BY 
		title
	) temp

SELECT
	temp.*
FROM
	(
	SELECT 
		COUNT(city) totalCities
	FROM 
		Employees
	GROUP BY 
		city
	) temp


SELECT
	temp.*,temp2.*
FROM
	(
	SELECT 
		COUNT(title) total
	FROM 
		Employees
	GROUP BY 
		title
	) temp,
	(
	SELECT 
		COUNT(city) totalCities
	FROM 
		Employees
	GROUP BY 
		city
	) temp2


SELECT 
	country, COUNT(*) AS [number of customers]
FROM 
	Customers

SELECT 
	country
FROM 
	Customers

SELECT 
	country, COUNT(*) AS [number of customers]
FROM 
	Customers
GROUP BY 
	country

SELECT 
	country, COUNT(*) AS [number of customers]
FROM 
	Customers
GROUP BY 
	country
HAVING 
	COUNT(*) > 5 AND COUNT(*) < 10

SELECT 
	companyname, phone
FROM 
	Shippers
ORDER BY 
	companyname

SELECT 
	lastname, firstname
FROM 
	Employees
ORDER BY 
	lastname ASC, firstname DESC

SELECT 
	productid, productname, unitprice
FROM 
	Products
ORDER BY 
	unitprice DESC

SELECT 
	TOP 10 productid, productname, unitprice
FROM 
	Products
ORDER BY 
	unitprice DESC

SELECT 
	TOP 1 productid, productname, unitprice
FROM 
	Products
ORDER BY 
	unitprice DESC

--Producto Cartesiano
SELECT 
	*
FROM 
	Products, Categories


SELECT 
	*
FROM 
	Products, Categories
WHERE 
	Products.categoryid = Categories.categoryid

SELECT 
	*
FROM 
	Products 
INNER JOIN 
	Categories
ON Products.categoryid = Categories.categoryid


-- Ejemlpo subquery en el select
SELECT 
(
	(SELECT MIN(Unitprice)FROM Products) 
	+	
	(SELECT MAX(Unitprice)FROM Products)
)
/2 as NewPrice


SELECT 
(
	(SELECT 40) 
	+	
	(SELECT 50)
)
/2 as NewPrice


SELECT 
	(SELECT AVG(Unitprice)
	FROM Products
	) as AvgPrice
	, 
	(SELECT MAX(Unitprice)
	FROM Products
	) as MaxPrice

SELECT 
	AVG(Unitprice),MAX(Unitprice)
FROM 
	Products

SELECT 
	ProductName, UnitPrice, (SELECT AVG(Unitprice)FROM Products) as AvgPrice
FROM 
	Products
WHERE 
	CategoryID = 2

-- Ejemlpo subquery en el having
SELECT 
	CategoryID, AVG(UnitPrice) AS 'Average Price'
FROM 
	Products P
GROUP BY 
	CategoryID
HAVING 
	AVG(UnitPrice) > (SELECT AVG(UnitPrice)FROM Products)

-- ejemplo IN
SELECT 
	OrderID, CustomerID, EmployeeID, OrderDate
FROM 
	Orders
WHERE 
	CustomerID IN (SELECT 
			TOP 1 CustomerID
			FROM Customers
			WHERE City = 'London')
	AND 
	EmployeeID = 1

-- ejemplo EXISTS
SELECT 
	OrderID, CustomerID, EmployeeID, OrderDate
FROM 
	Orders
WHERE 
	EXISTS (SELECT 
			TOP 0 CustomerID
			FROM Customers
			WHERE City = 'London')
	AND 
	EmployeeID = 1

-- ejemplo EXISTS
SELECT 
	OrderID, CustomerID, EmployeeID, OrderDate
FROM 
	Orders
WHERE 
	EXISTS (SELECT 
			TOP 1 CustomerID
			FROM Customers
			WHERE City = 'London')
	AND 
	EmployeeID = 1


/*
La siguiente tabla muestra algún ejemplo del operador ANY y ALL 


Valor 1 Operador Valor 2 Resultado 
3 > ANY  (2,5,7)  Cierto 
3  = ANY (2,5,7) Falso 
3  = ANY (2,3,5,7) Cierto 
3  > ALL (2,5,7) Falso 
3 < ALL (5,6,7) Cierto 

El operacion =ANY es equivalente al operador IN, ambos devuelven el mismo resultado.
*/

--  Ejemplo ALL
SELECT 
	ProductID, ProductName, UnitPrice
FROM 
	Products
WHERE 
	UnitPrice > ALL (SELECT 
				UnitPrice
			FROM 
				Products
			WHERE 
				CategoryID = 2)
ORDER BY UnitPrice DESC


--  Ejemplo ANY
SELECT 
	ProductID, ProductName, UnitPrice
FROM 
	Products
WHERE 
	UnitPrice > ANY (SELECT 
				MAX (UnitPrice)
			FROM 
				Products
			WHERE 
				CategoryID = 2)

ORDER BY UnitPrice DESC

-- Ejemlpo subquery en el from
SELECT 
	OD.OrderID, OD.ProductID, OD.UnitPrice
FROM 
	[Order Details] OD
INNER JOIN (SELECT 
	ProductID, ProductName
      FROM 
	Products
      WHERE 
	CategoryID = 2) AS P
ON 
	P.ProductID = OD.ProductID
WHERE 
	OrderID BETWEEN 10250 AND 10300


SELECT 
	O.OrderID, O.CustomerID, O.EmployeeID, O.OrderDate
FROM 
	Orders O
JOIN 
	Customers C
ON 
	O.CustomerID = C.CustomerID
WHERE 
	City = 'London'
	AND 
	EmployeeID = 1


SELECT 
	CompanyName AS Customer,
	(OD.UnitPrice * Quantity * (1-Discount)) AS Price,
	Discount
FROM 
	[Order Details] OD JOIN Orders O ON O.OrderID = OD.OrderID
JOIN 
	Customers CS 
ON 
	CS.CustomerID = O.CustomerID
ORDER BY 
	Customer

SELECT 
	CompanyName AS Customer,
	(OD.UnitPrice * Quantity * (1-Discount)) AS Price,Discount
FROM 
	[Order Details] OD JOIN Orders O ON O.OrderID = OD.OrderID
JOIN 
	Customers CS 
ON 
	CS.CustomerID = O.CustomerID
ORDER BY 
	Customer
COMPUTE 
	AVG(Discount) BY Customer

SELECT 
	CategoryName AS Category,
	ProductName AS Product,
	CompanyName AS Customer,
	(OD.UnitPrice * Quantity * (1-Discount)) AS Price, 
	Discount
FROM 
	[Order Details] OD 
JOIN 
	Orders O 
ON 
	O.OrderID = OD.OrderID
JOIN 
	Products P 
ON 	
	P.ProductID = OD.ProductID 
JOIN 
	Categories C
ON 
	C.categoryID = P.CategoryID 
JOIN 
	Customers CS
ON 
	CS.CustomerID = O.CustomerID 
ORDER BY 
	Category


SELECT 
	CategoryName AS Category,
	ProductName AS Product,
	CompanyName AS Customer,
	(OD.UnitPrice * Quantity * (1-Discount)) AS Price, 
	Discount
FROM 
	[Order Details] OD 
JOIN 
	Orders O 
ON 
	O.OrderID = OD.OrderID
JOIN 
	Products P 
ON 	
	P.ProductID = OD.ProductID 
JOIN 
	Categories C
ON 
	C.categoryID = P.CategoryID 
JOIN 
	Customers CS
ON 
	CS.CustomerID = O.CustomerID 
ORDER BY 
	Category
COMPUTE 
	SUM((OD.UnitPrice * Quantity * (1-Discount))) BY Category

SELECT 
	CategoryName AS Category,
	ProductName AS Product,
	(OD.UnitPrice * Quantity * (1-Discount)) AS Price,
	Discount
FROM 
	[Order Details] OD
JOIN 
	Orders O
ON 
	O.OrderID = OD.OrderID
JOIN 
	Products P
ON 
	P.ProductID = OD.ProductID
JOIN 
	Categories C
ON 
	C.categoryID = P.CategoryID
ORDER BY 
	Category, Product
COMPUTE AVG(Discount)BY Category, Product
COMPUTE AVG(Discount)BY Category
COMPUTE SUM((OD.UnitPrice * Quantity * (1-Discount)))
COMPUTE SUM(Price) BY Category (Partial results)

-- ejemplo query correlativo


