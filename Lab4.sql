-- Where Übungen
use northwind

-- Übung 1 -----
-- Kontaktdaten aller Kunden, die in Frankreich ansässig sind
select CustomerID, CompanyName, ContactName, Phone from Customers
	where Country = 'France'

-- Übung 2 -----
-- Kontaktdaten aller Kunden, die in Buenos Aires in Argentinien ansässig sind
select CustomerID, CompanyName, ContactName, Phone from Customers
	where Country = 'Argentina' and City = 'Buenos Aires'

-- Übung 3 -----
-- Kontaktdaten aller portugiesischen und spanischen Kunden
select CustomerID, CompanyName, ContactName, Phone from Customers
	where Country = 'Portugal' or Country = 'Spain'

-- Übung 4 -----
-- Alle Produkte, von denen mehr als 100 vorhanden sind
select * from products
  where UnitsInStock > 100

-- Übung 5 -----
-- Alle Produkte, deren ProduktID zwichen 10 und 15 (inklusiv) liegt
select ProductID, ProductName, UnitPrice from Products
 where ProductId between 10 and 15

-- Übung 6 -----
-- Alle Produkte, die von den Anbietern 2, 7 oder 15 geliefert werden
select ProductID, ProductName, UnitPrice, SupplierID from Products
	where SupplierID in (2, 7, 15)

-- Übung 7 -----
-- Alle Produkte, die vom Anbieter 5, 10, oder 15 stammen, 
-- von denen mehr als 10 St. vorrätig sind und deren Stückpreis unter 100 liegt
select ProductID, ProductName, UnitPrice, UnitsInStock from Products
	where SupplierID in (5, 10, 15) and UnitsInStock > 10 and UnitPrice < 100

-- Übung 8 -----
-- Ausgabe: Bestellnummer, Wunschtermin, Lieferdatum, Lieferverzögerung
-- Ergebnisse von Bestellungen, die noch nicht geliefert wurden nicht ausgeben
-- Datumsangaben in leserelichem Format ohne Uhrzeit
select * from Orders

select OrderId, 
  Format(ShippedDate, 'd', 'de-de') as Lieferdatum, 
  Format(RequiredDate, 'd', 'de-de') as Wunschdatum, 
  Datediff(day, RequiredDate, ShippedDate) as Lieferverzoegerung from Orders
	where ShippedDate is not null
	order by Lieferverzoegerung

select AVG(Datediff(day, RequiredDate, ShippedDate)) as Lieferverzoegerung from Orders
	where ShippedDate is not null
	

