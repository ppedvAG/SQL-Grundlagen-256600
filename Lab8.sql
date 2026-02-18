-- Lab 8 Aggregatsfunktionen
-- Übung 1 -------------
-- Wie viele Produkte haben wir im Sortiment
select count(*) as Anzahl_Produkte
from Products

-- ÜPbung 2 -------------
-- In wie vielen Ländern haben wir (=Northwind-Unternehmen) Kunden?
-- Sorgen Sie dafür, dass die Ausgabe auch eine Spaltenüberschrift hat.
select count(distinct Country) as Länderanzahl
from Customers


-- Übung 3 -------------
-- Was ist durchschnittliche Produktpreis pro Anbieter (Supplier)?
-- Geben Sie Durchschnittspreis, SupplierID und CompanyName aus.
select avg(p.UnitPrice) as Durchschnittspreis,p.SupplierID, CompanyName
from Suppliers s inner Join Products p on s.SupplierID = p.SupplierID
group by p.SupplierID, CompanyName
order by avg(p.UnitPrice)

-- Übung4 -------------
-- Geben Sie die Summe der Frachtkosten pro Kunde im jeweiligen Land aus, die im Jahr 1996 entstanden sind.
-- Erstellen Sie eine Spaltenüberschrift.
-- Ordnen Sie die Frachtkosten absteigend nach der Summe der Frachtkosten.
select sum(Freight) as 'Summe Frachtkosten/Kunde'
	,CustomerID, ShipCountry
from Orders
where Year(ShippedDate) = 1996
group by CustomerId, ShipCountry
order by sum(Freight) desc

select ShippedDate, 
Year(ShippedDate), Month(ShippedDate), Day(ShippedDate),
	format(cast(ShippedDate as date), 'D', 'de-de')
	from Orders