-- Joins

-- alle Bestellungen mit Kundendaten, auch wenn es keinen Kunden gibt, der zu einer Bestellung gehört
select Orders.CustomerID, Customers.CustomerId from Orders left join Customers on Orders.CustomerID = Customers.CustomerID

-- gleich mit right join, ist einfach ein left join mit der 2. Tabelle 
select Orders.CustomerID, Customers.CustomerId from Customers right join Orders on Orders.CustomerID = Customers.CustomerID


select o.OrderID, o.CustomerID, c.CustomerID from Orders o inner join Customers c on o.CustomerID  = c.CustomerID
-- Unterschied zwischen inner und left join: 
-- inner join gibt nur die Bestellungen zurück, die einen Kunden haben, 
-- left join gibt alle Bestellungen zurück, auch wenn es keinen Kunden gibt, der zu einer Bestellung gehört

-- full outer join gibt alle Bestellungen und Customers
select o.OrderID, o.CustomerID, c.CustomerID from Orders o full outer join Customers c on o.CustomerID  = c.CustomerID


-- warum sind bei full outer join 2 zeilen mehr als bei inner join?
-- es gibt 2 Bestellungen, die keinen Kunden haben, aber es gibt keinen Kunden, 
-- der keine Bestellung hat, deshalb gibt es 2 zeilen mehr als bei inner join
-- select 2 bestellungen die keinen kunden haben
select * from Orders o where o.CustomerID is null
-- stimmt nicht es gibt keine bestellungen die keinen kunden haben, 
-- es gibt aber 2 bestellungen die einen kunden haben, der nicht in der customers tabelle ist
-- überprüfen: 
select * from Orders o where o.CustomerID not in (select CustomerID from Customers)
 

select * from Customers c where c.CustomerID not in (select CustomerID from Orders)
-- es gibt 2 kunden die keine Bestelung haben, deswegen ist full outer join 2 zeilen mehr als inner join

-- heißt right join auf customers hat 2 zeilen mehr als left join auf orders
select Orders.CustomerID, Customers.CustomerId from Orders right join Customers on Orders.CustomerID = Customers.CustomerID -- 832
select Orders.CustomerID, Customers.CustomerId from Orders left join Customers on Orders.CustomerID = Customers.CustomerID -- 830

-- alle Kunden die keine Bestellungen haben
select c.CustomerID from Customers as c left join Orders o on c.CustomerID = o.CustomerID 
where o.CustomerID is null

-- es gibt keine Bestellungen mit CustomerID null
select * from Orders where CustomerId is null

-- aber wenn ich einen outer join mache (zb. Left), dann wird zu allen Kunden, die keine
-- Bestellungen haben eine Zeile mit null in der CustomerID Spalte der Orders Tabelle zurückgegeben
select c.CustomerID, o.CustomerID from Customers as c left join Orders o on c.CustomerID = o.CustomerID 
order by o.CustomerID

-- join auf 2 Tabellen

select o.OrderID, c.CustomerID, e.EmployeeID, c.Phone as CustomerPhone, e.HomePhone as EmployeePhone 
	from Orders o inner join Customers c on o.CustomerID  = c.CustomerID
	left join Employees e on o.EmployeeID = e.EmployeeID



-- Self join
select e1.EmployeeID, e1.FirstName as EmployeeName, e2.EmployeeID, e2.FirstName as ReportFirstName from Employees e1 left join Employees e2 on e1.ReportsTo = e2.EmployeeID

select EmployeeID, FirstName, ReportsTo from Employees