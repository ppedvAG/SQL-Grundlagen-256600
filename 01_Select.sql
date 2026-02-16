USE northwind
GO

-- Sortieren mit OderBy
SELECT ProductID, ProductName, UnitPrice from Products
ORDER BY UnitPrice DESC

-- Group By Gruppieren
SELECT UnitPrice, Count(UnitPrice) from Products
GROUP BY UnitPrice
ORDER BY UnitPrice DESC

-- Where Bedingung mit Vergleichsoperatoren
SELECT ProductID, ProductName, UnitPrice from Products
where UnitPrice = 38

SELECT ProductID, ProductName, UnitPrice from Products
where UnitPrice >= 38
order By UnitPrice

-- unterschied where und having: 
-- where filtert Zeilen vor der Gruppierung, 
-- having filtert Gruppen nach der Gruppierung
-- Beispiel mit groupBy und where und having
select UnitPrice, Count(UnitPrice) from Products
where UnitsInStock > 0
group by UnitPrice
having count(UnitPrice) > 1


select UnitPrice, Count(UnitPrice) from Products

group by UnitPrice, UnitsInStock
having UnitsInStock > 0 and count(UnitPrice) > 1


-- Select Abfagen können Duplikate zurückgeben
select Country from Customers
order by Country
-- Distinct gibt nur eindeutige Werte zurück
select distinct Country from Customers
order by Country
-- Funktioniert auch mit Group By, da Group By die Zeilen in Gruppen zusammenfasst
select Country from Customers
group by Country
order by Country
-- Unterschied zwischen Distinct und Group By:
-- Distinct filtert Duplikate aus der Ergebnismenge, 
-- während Group By die Zeilen in Gruppen zusammenfasst und 
-- Aggregatfunktionen auf diese Gruppen anwenden kann.



-- Order By mit mehreren Spalten
SELECT ProductID, ProductName, UnitPrice from Products
ORDER BY UnitPrice, ProductName ASC -- ASC ist die Standardreihenfolge, kann weggelassen werden
-- zuerst wird nach UnitPrice sortiert, bei gleichen UnitPrice wird nach ProductName sortiert

-- OrderBy einer Splate, die nicht im Select Teil ist
SELECT ProductID, ProductName from Products
ORDER BY UnitPrice

-- OrderBy mit aliases 
select ProductID as ProduktID, ProductName as Produktname, UnitPrice as Stückpreis from Products
Order by Stückpreis DESC, Produktname ASC


-- Top Klausel gibt uns die ersten x Zeilen
select Top 3 CustomerID, CompanyName from Customers
-- wenn ich kein OrderBy angebe, bekomme ich die ersten 3 Zeilen der Tabelle zurück,
-- die Reihenfolge ist nicht definiert, da SQL Server die Zeilen in keiner bestimmten Reihenfolge speichert

-- Top mit OrderBy
select Top 3 CustomerID, CompanyName from Customers
order by CompanyName

-- Top mit Where
select Top 3 CustomerID, CompanyName, Country from Customers
where Country = 'Germany'


-- Top gibts auch mit rechtsklick auf Tabelle - select top 1000 rows