-- Modul 9 Prozeduren

/*
	- Sind gespeicherte SQL Anweisungen (nicht nur SELECT sonder alle anderen auch, zb. Update, Create, Alter)
	- Arbeiten mit Variablen (als Übergabeparameter)
	- Praktisch zum automatisieren von Code
*/

-- Prozedur für Rechnungsdaten einer gewissen Order
create procedure uspRechnungsDatenOrderID 
	(@OrderID INT) -- klammer nur bei mehreren Variablen notwendig
as
select * from vRechnungsDaten
where OrderID = @OrderID

-- Prozedur verwenden mit exec
exec uspRechnungsDatenOrderID 10248


-- Prozedur mit mehreren Parametern
-- Bestellung nach Employee und Customer
create procedure uspOrderCustomerEmployee
(@CustomerID nchar(5), @LastName nvarchar(20))
as
select o.OrderID, o.CustomerID, o.OrderDate, e.LastName, e.FirstName, e.HomePhone
from Orders o inner Join Employees e on o.EmployeeID = e.EmployeeID 
where o.CustomerID like @CustomerID and e.LastName like '%'+@LastName+'%'

declare @CustID nchar(5) = 'VINET'
declare @LName nvarchar(20) = 'Buch'
exec uspOrderCustomerEmployee @CustID, @LName