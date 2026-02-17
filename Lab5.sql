-- Lab Modul 5 - Wildcards
-- Übung 1 -------------
-- Alle Produkte deren Namen mit L beginnt
select ProductId, ProductName from Products
where ProductName like 'L%' 

-- Übung 2 -------------
-- Alle Produkte die ein 'ost' im Namen enthalten
select ProductId, ProductName from Products
where ProductName like '%ost%'

-- Übung 3 -------------
-- Alle Produkte, deren Name mit D-L beginnt und mit a, b c, d oder m, n ,o endet
select ProductId, ProductName from Products
where ProductName like '[D-L]%[a-d|m-o]' 
-- alternativ
select ProductId, ProductName from Products
where ProductName like '[D-L]%[abcdmno]' 
-- alternativ
select ProductId, ProductName from Products
where ProductName like '[D-L]%'
	and ProductName like '%[a-dm-o]' 