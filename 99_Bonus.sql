-- Bonus labs
-- nr 5

select EmployeeID, FirstName + ' ' + LastName as Fullname,
	Salary, Country
from Employees e1
where Salary in (select Min(Salary) from Employees e2 where e2.Country = e1.Country group by Country)

select Country, Salary, FirstName from Employees order by Salary

update Employees set Salary = 2200 where Salary =2300


-- nr 6
select EmployeeID, FirstName + ' ' + LastName as Fullname, 
	Salary, Country
from Employees where Salary between (select Min(Salary) from Employees) and 3000
order by Salary

-- Set Operatoren

Select	CustomerId as ContactId,
		CompanyName,
		ContactName,
		ContactTitle,
		Phone,
		'C' As Category
from Customers
Union all
select	Cast(SupplierID as nvarchar),
		CompanyName,
		ContactName	,
		ContactTitle,
		Phone,
		'S' as Category
from Suppliers


select top 1
	OrderId, Freight, 'niedrigster Wert' as Anmerkung
into #niedrigster_Wert
from Orders
order by Freight

select top 1
	OrderId, Freight, 'höchster Wert' as Anmerkung
into #hoechster_Wert
from Orders
order by Freight desc

select * from #niedrigster_Wert
union all
select * from #hoechster_Wert


-- Except und Intersect

SELECT City FROM Customers
Except
SELECT City FROM Suppliers;

-- Die JOIN-Variante für "Kunden-Länder ohne Lieferanten"
SELECT DISTINCT C.City 
FROM Customers C
Left JOIN Suppliers S ON C.City = S.City
WHERE S.City IS NULL;


SELECT City FROM Customers
Intersect
SELECT City FROM Suppliers;

SELECT DISTINCT C.City 
FROM Customers C
inner JOIN Suppliers S ON C.City = S.City

