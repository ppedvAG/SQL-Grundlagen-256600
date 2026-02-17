USE northwind
-- Groß oder Kleinbuchstaben nur bei Namen von Tabellen, Datenbanken, Spalten, etc. relevant, nicht bei Schlüsselwörtern
-- Einzeiliger Kommentar mit doppeltem -
/*
Mehrzeiliger Kommentar mit Schrägstrich und Sternchen
*/

-- Mit Select einfache Ausgabe machen
select 101 as 'ID', 'Franz' as 'Name', 31 as 'Alter'


-- String Funktionen bzw. Text-Datentypen 
-- LEN gibt die Länge eines Strings zurück, einschließlich Leerzeichen
select len(CompanyName) From Customers

-- LEFT/Right gibt die Anzahl der Zeichen von links oder rechts zurück
select left(CompanyName, 5) From Customers
select right(CompanyName, 5) From Customers

-- STUFF(Spalte, x, y, replace) ersetzt die Anzahl der Zeichen y ab Position x durch den String replace
Select STUFF(Phone, LEN(Phone) - 3, 4, 'XXXX') From Customers

-- REPLACE(Spalte, 'search', 'replace') ersetzt alle Vorkommen von search durch replace
select REPLACE(CompanyName, ' ', '_') From Customers

-- SUBSTRING(Spalte, x, y) gibt die Anzahl der Zeichen y ab Position x zurück
select SUBSTRING(CompanyName, 1, 5) From Customers

-- PATINDEX('%search%', Spalte) gibt die Position des ersten Vorkommens von search zurück,
-- % steht für beliebige Zeichen
select CompanyName from Customers
select patindex('%en', CompanyName), CustomerID From Customers -- gibt die Position des ersten Vorkommens 
select CompanyName , CustomerID from Customers where patindex('%en', CompanyName) > 0; -- gibt alle CompanyNames zurück, die mit 'en' enden


-- CONCAT(Spalte1, Spalte2, ...) fügt die Werte der Spalten zusammen
select FirstName, LastName, CONCAT(FirstName, ' ', LastName) as FullName From Employees
-- mit as gib ich einen Spaltennamen für die Ausgabe an, hier FullName

-- Alternative Schreibweise ohne CONCAT
select FirstName + ' ' + LastName as FullName From Employees

-------------------------------------------------------------------------------------------

-- Datumsfunktionen

-- GETDATE() gibt das aktuelle Datum und Uhrzeit zurück
select GETDATE()
select CURRENT_TIMESTAMP
select SYSDATETIME()
-- Unterschied zwischen GETDATE() und SYSDATETIME(): 
-- GETDATE() gibt das Datum und die Uhrzeit im Format datetime zurück, 
-- während SYSDATETIME() das Datum und die Uhrzeit im Format datetime2 zurückgibt, 
-- welches eine höhere Genauigkeit bietet.


-- Datum aufteilen mit YEAR(), MONTH(), DAY() und DATEPART()
Select Year(GetDate()), Month(GetDate()), Day(GetDate()), DATEPART(hour, GetDate())
Select YEAR(OrderDate) as OrderYear, MONTH(OrderDate) as OrderMonth, DAY(OrderDate) as OrderDay From Orders

Select
Datepart(Year , OrderDate) as Jahr,
Datepart(quarter, OrderDate) as Quartal,
Datepart(week, OrderDate) as Woche,
Datepart(Weekday, OrderDate) as Wochentag -- gibt den Wochentag als Zahl zurück,
From Orders

select OrderDate, Datepart(Weekday, OrderDate) from Orders

select DATENAME(MONTH, OrderDate), Datepart(Month, OrderDate), 
	DATENAME(Weekday, OrderDate), DatePart(Weekday, OrderDate) from Orders


-- Intervall zu einem Datum addieren
select DATEADD(Day, 14, Getdate())

-- Differnz in Intervall zwischen zwei Daten
select DATEDIFF(Day, OrderDate, GetDate()) as DaysSinceOrder From Orders


----------------------------------------------------------------------------
-- Konvertierung von Datentypen
-- CAST oder CONVERT, wandeln Datentypen in der Ausgabe um
Select OrderDate  FROM Orders
Select Cast(OrderDate as date) FROM Orders -- ändert datetime zu date, also ohne Uhrzeit
select Convert(date, OrderDate) FROM Orders -- alternative Schreibweise

-- Datentyp ausgeben (date oder Datetime) alternative zu Explorer nachsehen
Select SQL_VARIANT_PROPERTY(OrderDate, 'BaseType') From Orders

-- ISNULL überprüft, ob eine Zelle NULL ist, also nicht ausgefüllt
Select ISNULL(Fax, 'kein Fax') as Fax From Customers
select Fax from Customers

-- alle Einträge die NULL sind
select * from Customers where Fax is null

-- Format deklarieren
DECLARE @d as date = '08/09/2024';

select FORMAT(@d, 'd', 'en-US') as US_Format,
	FORMAT(@d, 'd', 'de-DE') as DE_Format,
	FORMAT(@d, 'd', 'fr-FR') as FR_Format,
	FORMAT(@d, 'd', 'en-gb') as GB_Format;

select FORMAT(GETDATE(), 'd', 'en-US') as US_Format,
	FORMAT(GETDATE(), 'd', 'de-DE') as DE_Format,
	FORMAT(GETDATE(), 'd', 'fr-FR') as FR_Format,
	FORMAT(GETDATE(), 'd', 'en-gb') as GB_Format;

select FORMAT(GETDATE(), 'D', 'en-US') as US_Format,
	FORMAT(GETDATE(), 'D', 'de-DE') as DE_Format,
	FORMAT(GETDATE(), 'D', 'fr-FR') as FR_Format,
	FORMAT(GETDATE(), 'D', 'en-gb') as GB_Format;


-- mit Format Telefonnummer costomizen
Select FORMAT(436641234567, '+## ### #######') as FormattedPhoneNumber


-- Reverse
select Reverse(CompanyName) as ReversedCompanyName, CompanyName From Customers

-- Upper, Lower
select Upper(CompanyName) as UpperCompanyName, Lower(CompanyName) as LowerCompanyName, CompanyName From Customers

select Concat(Lower(Substring(CompanyName, 1, 1)), Upper(Substring(CompanyName, 2, Len(CompanyName)))) as FormattedCompanyName, CompanyName From Customers 




