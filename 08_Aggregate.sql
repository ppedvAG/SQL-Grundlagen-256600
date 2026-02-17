-- Aggregate Funcitons

-- Min und Max bei Strings sortiert nach Alphabet
select Min(ProductName),
Max(ProductName),
-- Sum(ProductName) Fehler, da Sum nur für numerische Werte funktioniert
-- AVG(ProductName) Fehler, da AVG nur für numerische Werte funktioniert
Sum(UnitsInStock),
Avg(UnitPrice) 
from Products


-- Count: Wie viele Produkte gibt es, die Über dem Durschnittspreis liegen?
select Count(ProductID) from Products
--where UnitPrice > AVG(UnitPrice) -- Fehler, da AVG eine Aggregatfunktion ist und nicht in einer WHERE Klausel verwendet werden kann
where UnitPrice > (select Avg(UnitPrice) from Products) -- Lösung: Subquery verwenden


-- Distinct und OrderBy, wieviele Bestellungen hat ein Employee bearbeitet?
select Count(*) as anzahl,
	EmployeeID
from Orders
group by EmployeeID
order by EmployeeID

select EmployeeId, Count(*)
from Orders group by EmployeeID

select * from Orders
order by EmployeeID


-- wie viele unterschiedliche Produkte hat ein Employee verkauft?
select Count(Distinct o.OrderID) as anzahl,
	e.EmployeeID
from Employees e inner join Orders o on e.EmployeeID = o.EmployeeID
group by e.EmployeeID
order by e.EmployeeID



-- Having funktioniert wie where, aber erst nach dem Gruppieren
Select ProductName, Sum(Quantity) as TotalQuantity, Count(*) as AnzahlBestellungen
from [Order Details] od inner join Products p on od.ProductID = p.ProductID
group by p.ProductName
having Sum(Quantity) > 1000
order by TotalQuantity desc

-- Wie viele Produkte hat jeder Employee verkauft? Summe aller Quantity pro Employee
Select o.EmployeeID, Sum(Quantity) as TotalQuantity, Count(*) as AnzahlBestellungen
from [Order Details] od inner join Orders o on od.OrderID = o.OrderID
group by o.EmployeeID
order by EmployeeID
