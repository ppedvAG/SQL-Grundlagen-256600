-- Datentypen
-- Explizite Konvertierung von Datentypen in einem Vergleich

-- Variable @UnitsInStock vom Typ smallint
declare @UnitsInStock smallint = 5
-- Varaible @UnitPrice vom Typ int
declare @UnitPrice int = 20

-- die kann ich implizit vergleichen
select @UnitsInStock, @UnitPrice
where @UnitsInStock < @UnitPrice 

declare @UnitsInStock2 smallint = 5
-- Varaible @UnitPrice vom Typ varchar
declare @UnitPrice2 varchar(10) = '20'

select @UnitsInStock2, @UnitPrice2
where @UnitsInStock2 < @UnitPrice2 and @UnitPrice2 = 20
-- ich kann string implizit mit zahlen vergleichen, muss mich aber darauf verlassen, dass tatsächlich eine Zahl im String steht.


declare @UnitsInStock3 smallint = 5
-- Varaible @UnitPrice vom Typ varchar
declare @UnitPrice3 varchar(10) = 'twenty'

select @UnitsInStock3, @UnitPrice3
where @UnitsInStock3 < @UnitPrice3 and @UnitPrice3 = 20
-- wenn keine Zahl im String steht, schägt die Konvertierung fehl
