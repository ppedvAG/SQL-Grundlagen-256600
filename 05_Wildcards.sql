-- Wildcards und LIKE

-- Variable Greeting
declare @Greeting nvarchar(50) = 'Hallo Manager!'

Select @Greeting
where @Greeting LIKE 'Manager'

-- % Wildcard: Representiert alle Zeichen, keines, eines oder meherere
Select @Greeting
where @Greeting LIKE '%manager%'

-- _ Wildcard: Repräsentiert genau ein Zeichen
Select @Greeting
where @Greeting LIKE '%manager_'

Select FirstName from Employees
where FirstName LIKE '[A-C]%' -- Alle Namen die mit A, B oder C beginnen
-- [] Wildcard: Repräsentiert immer genau ein Zeichen aus der angegebenen Menge oder Bereich


Select FirstName from Employees
where FirstName LIKE '[A|JS]%' -- Alle Namen die mit A, J oder S beginnen 
-- | Wildcard: ist ein Oder, ist hier nicht unbedingt notwendig

-- n Wildcard: Negiert die angegebene Menge oder Bereich
Select FirstName from Employees
where FirstName LIKE 'n[A J S]%' -- Alle Namen die nicht mit A, J oder S beginnen

Select Phone from Customers
where Phone like '[0 (]%' -- Alle Telefonnummern die mit 0, ( oder beginnen

Select Phone from Customers 
where Phone like '%555%' -- Alle Telefonnummern die 555 enthalten

-- Telefonnummer die keine Klammern enthält
Select Phone from Customers 
where Phone like '%[^()]%' -- Funktioniert nicht, da es nach einem Zeichen sucht, das keine Klammern ist, aber es könnte Klammern enthalten

-- Telefonnummer die keine Klammern enthält
select Phone from Customers 
where Phone not like '%[()]%' -- mit not like können wir das Problem lösen, da es alle Telefonnummern ausschließt, die Klammern enthalten

-- Wildcard für Österreichische Telefonnummern
declare  @Phone nvarchar(50) = '+43 123 456789'
select @Phone  
where @Phone like '+43 [0-9][0-9][0-9] %' -- Alle Telefonnummern die mit +43 beginnen, was die Ländervorwahl für Österreich ist
-- in SQL etwas komplexer, da wie die Anzahl von Ziffern nicht einfach variabel angeben können

-- Bei where and oder or muss man immer beide seiten 2 mal angeben
-- also nicht
select UnitsInStock from Products 
-- where UnitsInStock > 0 and < 10 -- fehler
where UnitsInStock > 0 and UnitsInStock < 10 -- richtig

