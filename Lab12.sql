-- Lab 12
-- Übung 1-----------------

-- normale Case Schreibweise
select distinct Country,
	Case 
		when Country like 'Austria' then 'EU'
		when Country like  'USA' then 'nicht EU'
		when Country like  'UK' then 'Brexit'
		else 'unbekannt'
	end as Zugehörigkeit
from Customers
order by  Zugehörigkeit


-- einfache schreibweise von case
select distinct Country,
	Case Country
		when  'Austria' then 'EU'
		when  'USA' then 'nicht EU'
		when  'UK' then 'Brexit'
		else 'unbekannt'
	end as Zugehörigkeit
from Customers
order by  Zugehörigkeit

-- Übung 2 ---------
-- Teil 1 ----------
select c.CustomerID as Kundennummer,
	c.CompanyName as Firmenname,
	year(o.OrderDate) as Bestelljahr, 
	cast(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) 
		as decimal(10,2)) as Einkaufsumme,
	case 
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) >= 500
			then 'Premium'
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) < 500
			then 'Standard'
		else 'unbekannt'
	end as Kundenstatus
from Customers c 
left join Orders o on c.CustomerID = o. CustomerID
left join [Order Details] od on od.OrderID = o.OrderID
group by c.CustomerID, c.CompanyName, Year(o.OrderDate)
order by Bestelljahr

-- warum ist inner join falsch/anders
select c.CustomerID as Kundennummer,
	c.CompanyName as Firmenname,
	year(o.OrderDate) as Bestelljahr, 
	cast(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) 
		as decimal(10,2)) as Einkaufsumme,
	case 
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) >= 500
			then 'Premium'
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) < 500
			then 'Standard'
		else 'unbekannt'
	end as Kundenstatus
from Customers c 
inner join Orders o on c.CustomerID = o. CustomerID
inner join [Order Details] od on od.OrderID = o.OrderID
group by c.CustomerID, c.CompanyName, Year(o.OrderDate)
order by Einkaufsumme
-- alle Kunden ohne Bestellungen fallen weg, 
-- somit gibt es keinen unbekannt Status mehr

-- Teil 2
select c.CustomerID as Kundennummer,
	c.CompanyName as Firmenname,
	year(o.OrderDate) as Bestelljahr, 
	cast(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) 
		as decimal(10,2)) as Einkaufsumme,
	case 
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) >= 500
			then 'Premium'
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) < 500
			then 'Standard'
		else 'unbekannt'
	end as Kundenstatus
from Customers c 
left join Orders o on c.CustomerID = o. CustomerID
left join [Order Details] od on od.OrderID = o.OrderID
where year(OrderDate) in (1996,1997,1998)
group by c.CustomerID, c.CompanyName, Year(o.OrderDate)
order by Einkaufsumme

select c.CustomerID as Kundennummer,
	c.CompanyName as Firmenname,
	year(o.OrderDate) as Bestelljahr, 
	cast(sum(od.Quantity*od.UnitPrice*(1-od.Discount)) 
		as decimal(10,2)) as Einkaufsumme,
	case 
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) >= 500
			then 'Premium'
		when sum(od.Quantity*od.UnitPrice*(1-od.Discount)) < 500
			then 'Standard'
		else 'unbekannt'
	end as Kundenstatus
from Customers c 
left join Orders o on c.CustomerID = o. CustomerID
left join [Order Details] od on od.OrderID = o.OrderID
where o.CustomerID is null
group by c.CustomerID, c.CompanyName, Year(o.OrderDate)
order by Einkaufsumme
