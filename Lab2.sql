select 100 as Zahl,
	   'Donaudampfschifffahrtsgesellschaft' as Text,
	   200 as Rechnung

select CustomerID as KundenID, 
		CompanyName as Firmenname, 
		ContactName as Kontaktperson, 
		Phone as Telefonnummer 
		from Customers

select ProductID as ProduktID, 
		ProductName as Pruduktname, 
<<<<<<< HEAD
		UnitPrice as Stückpreis 
=======
		UnitPrice as StÃ¼ckpreis 
>>>>>>> 2d082061b1b679041a4bd52cf9639bcaf861e788
		from Products

select Freight as Nettofrachtkosten,
		Freight * 1.19 as Bruttofrachtkosten,
		Freight * 0.19 as MwSt from Orders

-- auf 2 Dezimalstellen Runden mit Round 
select Freight as Nettofrachtkosten,
		ROUND(Freight * 1.19, 2) as Bruttofrachtkosten,
		ROUND(Freight * 0.19, 2) as MwSt from Orders

-- auf 2 Dezimalstellen Runden und 0 entfernen mit str
select Freight as Nettofrachtkosten,
		STR(Freight * 1.19, 10, 2) as Bruttofrachtkosten,
		STR(Freight * 0.19, 10, 2) as MwSt from Orders
<<<<<<< HEAD
		-- STR(Spalte, Länge, Anzahl der Dezimalstellen) 
		-- gibt die Zahl als String zurück, wobei die Länge die Gesamtzahl der Zeichen angibt, 
		-- einschließlich Dezimalpunkt und Vorzeichen.
=======
		-- STR(Spalte, LÃ¤nge, Anzahl der Dezimalstellen) 
		-- gibt die Zahl als String zurÃ¼ck, wobei die LÃ¤nge die Gesamtzahl der Zeichen angibt, 
		-- einschlieÃŸlich Dezimalpunkt und Vorzeichen.
>>>>>>> 2d082061b1b679041a4bd52cf9639bcaf861e788
