-- Modul 9 Views 

/*
	Vorteile
	 - komplexe Abfragen speichern und wiederverwenden
	 - Sicherheit: User erlauben nur die View zu lesen, nicht zu verändern
	 - View sind immer aktuell (aktulle Daten)
	  => Beim Aufruf einer View wird das hinterlegte Statement ausgeführt
*/

-- einfache View erzeugen
--create View vAngestellterChefTelefonnummer as
--select a.EmployeeID as AngestelltenID, a.FirstName+' '+ a.LastName as AngestelltenName, a.HomePhone as AngestelltenTelefon,
--	c.EmployeeID as ChefID, c.FirstName+' '+ c.LastName as ChefName, c.HomePhone as ChefTelefon
--from Employees a inner join Employees c on a.ReportsTo = c.EmployeeID


-- Aufruf der View
--select * from vAngestellterChefTelefonnummer

-- View für RechnungsDaten
--create view vRechnungsDaten as
--select o.OrderID,
--	c.CustomerID, c.CompanyName, c.Country, c.City, c.PostalCode, c.Address, 
--	o.Freight, o.OrderDate,
--	e.LastName
--from [Order Details] od
--inner join Orders o on o.OrderID = od.OrderID
--inner join Customers c on o.CustomerID = c.CustomerID
--inner join Employees e on o.EmployeeID = e.EmployeeID
--group by o.OrderID,
--	c.CustomerID, c.CompanyName, c.Country, c.City, c.PostalCode, c.Address, 
--	o.Freight, o.OrderDate,
--	e.LastName

--select * from vRechnungsDaten
use northwind
alter view dbo.vRechnungsDaten as
select o.OrderID,
	c.CustomerID, c.CompanyName, c.Country, c.City, c.PostalCode, c.Address, 
	o.Freight, o.OrderDate,
	e.LastName,
	cast(sum((od.UnitPrice*od.Quantity)*(1-od.Discount))+o.Freight as decimal(10,2)) as SummePreis
from [Order Details] od
inner join Orders o on o.OrderID = od.OrderID
inner join Customers c on o.CustomerID = c.CustomerID
inner join Employees e on o.EmployeeID = e.EmployeeID
group by o.OrderID,
	c.CustomerID, c.CompanyName, c.Country, c.City, c.PostalCode, c.Address, 
	o.Freight, o.OrderDate,
	e.LastName

select * from vRechnungsDaten

