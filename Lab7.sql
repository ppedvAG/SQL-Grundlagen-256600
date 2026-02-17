-- Lab 6 Joins 
-- Übung 1 -------------
-- Alle Kunden aus Brasilien und deren Frachtkosten und weitere nützliche Spalten
select 
o.OrderID as Bestellnummer, 
c.CustomerID as Kundennummer,
c.CompanyName as Firmenname,
o.Freight as Frachtkosten
from Customers c inner join Orders o on c.CustomerID = o.CustomerID
where c.Country = 'Brazil'

select 
o.OrderID as Bestellnummer, 
o.CustomerID as Kundennummer,
c.CompanyName as Firmenname,
o.Freight as Frachtkosten
from Orders o inner join Customers as c on o.CustomerID = c.CustomerID
where c.Country = 'Brazil'

-- Übung 2 -------------
-- Alle Produkte mit Namen von Anbieter, die Soße verkaufen.
-- (CompanyName, ProductName, Ansprechperson, Telefonnummer)

-- nachsehen, welche Schreibweisen von Soße es gibt
select ProductName from Products where ProductName like '%sauce%'
select ProductName from Products where ProductName like '%soße%'

-- Lösung:
select p.ProductName, s.CompanyName, s.ContactName, s.Phone
from Products p inner join Suppliers s on p.SupplierID = s.SupplierID
where p.ProductName like '%sauce%' or p.ProductName like '%soße%'

-- Übung 3 -------------
-- Beschwerden bei Bestellungen 10251,10280,10990,11000
-- Welcher Angestellte hat die bearbeitet
-- Vor und Nachname als FullName
select o.OrderID, concat(e.FirstName,' ', e.LastName) as FullName,
(e.FirstName + ' ' + e.LastName) as FullName2
from Orders o inner join Employees e on o.EmployeeID = e.EmployeeID
where o.OrderID in (10251,10280,10990,11000)
-- wher o.OrderID = 10251 or o.OrderID = 10280..

-- Übung 4 -------------
-- Welche Kunden haben Chai Tee gekauft und wieviel
-- OrderID, CustomerID, CompanyName, ProductName, Quantity
select o.OrderID, c.CustomerID, c.CompanyName, p.ProductName, od.Quantity 
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
inner join [Order Details] od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
where p.ProductName like '%Chai%'



-- Übung 5 -------------
-- Alle Bestellungen, bei denen Bier verkauft wurde. 
-- Welcher Kunde? Wie viel? Welches Bier?
-- Der Produktname kann 'Bier' oder 'Lager' enthalten, oder mit 'ale' enden
-- Ausgabe nach Menge absteigend und Kundenname alphabetisch
select o.OrderID, c.CustomerID, c.CompanyName, p.ProductName, od.Quantity
from Orders o inner join Customers c on o.CustomerID = c.CustomerID
	inner join [Order Details] od on o.OrderID = od.OrderID
	inner join Products p on od.ProductID = p.ProductID
where p.ProductName like '%Bier%' 
	or p.ProductName like '%Lager%'
	or p.ProductName like '%ale'
order by od.Quantity desc, c.CompanyName asc


-- Übung 6 -------------
-- Wer ist der Chef von wem?
-- Ausgabe: Name Angestellter, ID Angestellter, Name Chef, ID Chef
-- neue Spaltenüberschriften
-- Vor- und Nachname als FullName
-- Auch Employees, die keinen Vorgesetzten haben, sollen in der Ausgabe erscheinen
select e.FirstName+' '+e.LastName as Mitarbeiter,
	e.EmployeeID as Mitarbeiternummer,
	v.FirstName+' '+v.LastName as Vorgesetzter,
	v.EmployeeID as Vorgesetztennummer
from Employees e left join Employees v on e.ReportsTo = v.EmployeeID

-- Mitarbeiter die keinen Vorgesetzten haben
select m.FirstName+' '+m.LastName as Mitarbeiter, 
	m.EmployeeId as MitarbeiterNummer
	from Employees m left join Employees c on m.ReportsTo = c.EmployeeID
	where c.EmployeeID is null


-- Übung 7 -------------
-- Liste von Mitfahrgelegenheiten (wer lebt in der gleichen Stadt)
-- keine Doppelten vorkommen (Dominik lebt in der gleicht Stadt wie Dominik)
-- Alphabetisch nach Städten und Kunden
select c1.CompanyName as Kunde, c1.City as Stadt,
c2.CompanyName as Mitfahrgelegenheit, c2.City as Kontrollfeld
from Customers c1 inner join Customers c2 on c1.City = c2.City
where c1.CustomerID != c2.CustomerID
order by c1.City, c1.CompanyName, c2.CompanyName