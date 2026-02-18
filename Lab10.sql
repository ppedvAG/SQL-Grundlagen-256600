-- Lab 10 Unterabfragen

-- Übung 1 -------------
-- Alle Bestellungen, deren Frachtkosten größer sind 
-- als der Durchschnitt der Frachtkosten
-- Ergebnis absteigend
select OrderID, Freight
from Orders
where Freight > (Select avg(Freight) from Orders)
order by Freight desc

-- Übung 2 -----------
-- SupplierID, CompanyName, Kontakt Infos, Land aller Supplier
-- die im gleichen Land sind wie Suppler nr 2
select SupplierID, CompanyName, ContactName, Country
from Suppliers
where Country = (Select Country from Suppliers where SupplierID = 2)
and SupplierID != 2


-- Übung 3 ------------
-- Name und ErstellDatum von Mitarbeiter
-- im selben jahr eingstellt wie Mr. Robert King
-- Titel Nachname  & Vorname  überprüft werden

select TitleOfCourtesy+' '+FirstName+' '+LastName as Fullname, HireDate
from Employees
where year(HireDate) =
	(select year(HireDate) from Employees 
	where TitleOfCourtesy+LastName+FirstName like 'Mr.KingRobert')

select TitleOfCourtesy+' '+FirstName+' '+LastName as Fullname, HireDate
from Employees
where year(HireDate) =
	(select year(HireDate) from Employees 
	where TitleOfCourtesy+LastName+FirstName like 'Mr.KingRobert')
and TitleOfCourtesy+LastName+FirstName not like 'Mr.KingRobert'
