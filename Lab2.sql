Select phone from Customers
-- ÜBUNG 1 ---------------
-- alle Ziffern bis auf die letzten 3
select left(phone, len(phone)-3), phone from Customers

-- 3 x anfügen
select concat(left(phone, len(phone)-3), 'xxx') as anonymosPhone, phone from Customers

-- left gibt mir die ersten x Zeichen von phone
 -- x ist hier len(phone)-3, also die Länger der Telefonnumer -3

-- concat fügt die ersten x Zeichen von phone mit 'xxx' zusammen


-- ÜBUNG 2 ---------------

-- STUFF ersetzt die Anzahl der Zeichen y ab Position x durch den String replace
select STUFF('0123456789', 1, 7, 'xxxxxxx')
-- ist nicht variabel, da die Länge der Telefonnummern unterschiedlich ist

-- verwendung von Replicate
select replicate('x', len(phone)-3) as anonymosPhone, phone from Customers

select concat(replicate('x', len(phone)-3), right(phone, 3)) as anonymosPhone, phone from Customers
-- concat fügt replicate und right zusammen
--  replicate gibt mit lenght-2 mal 'x'
--  right gibt die letzten 3 Zeichen von phone zurück

select concat(replicate('x', len(phone)-3), reverse(left(reverse(phone), 3))) from Customers

-- Übung 3 ---------------
-- an welcher Stelle befindet sich das letzte Leerzeichen


-- CharIndex gibt uns den ERSTEN Index an dem ein Zeichn vorkommt
select charIndex(' ' , 'Wolfgang Amadeus Mozart')
select reverse(charIndex(' ' , 'Wolfgang Amadeus Mozart'))
select reverse ('Wolfgang Amadeus Mozart')

-- Variable Mozart:
declare @Mozart nvarchar(50) = 'Wolfgang Amadeus Mozart'
-- Variable Händel:
declare @Handel nvarchar(50) = 'Georg Friedrich Händel'
select len(@Mozart)+1-charIndex(' ' , reverse(@Mozart))
	as letztesLeerzeichen
select len(@Handel)+1-charIndex(' ' , reverse(@Handel))
	as letztesLeerzeichen



-- Übung 4 ---------------
-- An welchem Wochentag wurde ich geboren?
-- mit Datename weekday bekomme ich den Namen des Wochentags
select Datename(weekday, '2002-08-06') as Wochentag
-- Dienstag stimmt, da 6.8.2002 ein Dienstag war

-- Geburtstage der Angestellten
select FirstName, LastName, Cast(BirthDate as date) as Birthdate, 
  Datename(weekday, BirthDate) as Wochentag from Employees
  -- Cast(BirthDate as date) gibt mir nur das Datum zurück, ohne die Uhrzeit
  -- Datename(weekday, BirthDate) gibt mir den Namen des Wochentags zurück
  -- as Birthdate und as Wochentag ändern den Spaltennamen in der Ausgabe

-- Übung 5 ---------------
-- vor wie vielen Jahren kam der erste Star Wars Film in die Kinos? 25. Mai 1977
select DATEDIFF(year, '1977-05-25', GETDATE()) as JahreSeitStarWars

select FirstName, LastName, Cast(BirthDate as date) as BirthDate, 
  DATENAME(weekday, Birthdate) as Wochentag from Employees

-- Übung 6 ---------------
-- mein Alter berechnen
-- DateDiff gibt die Differenz zwischen zwei Daten zurück, wir verwenden Tage als Einheit
-- wegen Schaltjahr rechnen wir tage / 365.25 um auf Jahre zu kommen

select Datediff(DD, '2002-08-06', GETDATE())/365.25 as Age

-- Floor rundet die Zahl ab
-- DateDiff berechnet die Differenz zwischen heute und dem Birthdate (wegen DD in Tagen)
--  Die Tage werden dann durch 365.25 geteilt, um wieder auf Jahre zu kommen (.25 wegen Schaltjahr)
select FLOOR(DATEDIFF(DD, BirthDate, getdate())/365.25) as Age, 
	format(BirthDate, 'D', 'de-de') as BirthDate, -- format auf deutsches Datumsformat
	(FirstName + ' ' +LastName) as Name from Employees


-- Übung 7 ---------------
-- Format der Vor- und Nachnamen überprüfen (nur erster Buchtabe groß, Rest klein)

-- um das zu überprüfen, machen wir zuerst den ersten Buchstaben klein und den Rest groß
select concat(lower(left(FirstName, 1)), upper(right(FirstName, len(FirstName)-1))),
  concat(lower(left(LastName, 1)), upper(right(LastName, len(LastName)-1))) 
  from Employees

-- richtig wäre es umgekehrt:
select concat(UPPER(left(FirstName, 1)), LOWER(right(FirstName, len(FirstName)-1))),
  concat(UPPER(left(LastName, 1)), LOWER(right(LastName, len(LastName)-1))) 
  from Employees


-- Übung 8 ---------------
-- Trennen von Vor und Nachnamen 
select ContactName from Customers

select reverse(ContactName), len(ContactName), CHARINDEX(' ', reverse(ContactName)) , left(reverse(ContactName), charindex(' ', reverse(ContactName))) from Customers

-- suchen nach dem 2. Leerzeichen mit Reverse
select reverse(right(reverse(ContactName), Len(ContactName)-charindex(' ', reverse(ContactName)))) as Vorname,
	reverse(left(reverse(ContactName), charindex(' ', reverse(ContactName))-1)) as Nachname from Customers

-- gehen wir davon aus, dass es nur 1 Vornamen gibt dann können wir auch nach dem ersten Leerzeichen suchen
select left(ContactName, charindex(' ', ContactName)-1) as Vorname, 
	right(ContactName, len(ContactName)-charindex(' ', ContactName)) as Nachname 
	from Customers
