-- Lab 09 Views und Prozeduren --

-- Übung 1 -------------
-- View für sinnvolle Spalten einer Rechung
create view v_Rechungsdaten as
select o.OrderID, c.CustomerID, o.ShipAddress,o.ShipCity, o.ShipCountry,
		od.ProductID, od.UnitPrice, od.Quantity, od.Discount,
		c.CompanyName, c.Phone as CompanyPhone, 
		Concat(e.FirstName,' ', e.LastName) as EmployeeName, e.HomePhone as EmployeePhone
from orders o 
inner join [Order Details] od on o.OrderID = od.OrderID
inner join Employees e on e.EmployeeID = o.EmployeeID
inner join Customers c on o.CustomerID = c.CustomerID

-- View anzeigen
select * from v_Rechungsdaten

-- Übung 2 --------------
-- Erstellen einer Prozedur p_Customer_Cities
-- Name der Stadt wird übergeben
-- Kunden und Bestelldaten aus dieser Stadt
create procedure p_Customer_Cities @City nvarchar(15) as
select c.CustomerID, c.CompanyName, c.PostalCode, c.Address, c.City,
	c.Country, o.OrderID, o.OrderDate
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
where c.City like @City

-- Ausführen mit Buenos Aires
exec p_Customer_Cities 'Buenos Aires'

-- gleich wie
select c.CustomerID, c.CompanyName, c.PostalCode, c.Address, c.City,
	c.Country, o.OrderID, o.OrderDate
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
where c.City like 'Buenos Aires'










