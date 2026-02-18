-- Modul 12 Case

select ShippedDate, RequiredDate,
	CASE
		WHEN ShippedDate is null then 'noch nicht versendet'
		when ShippedDate > RequiredDate then 'zu spät'
		else 'passt'
	end as bewertung
from Orders
order by bewertung

select CASE
		WHEN ShippedDate is null then 'noch nicht versendet'
		when ShippedDate > RequiredDate then 'zu spät'
		else 'passt'
	end as bewertung, 
	count(*) as anzahl,
	cast(cast((100.0/(select count(*) from Orders))*count(*) as decimal(4,2)) as nvarchar(5)) +' %' as Prozent
from Orders
group by CASE
		WHEN ShippedDate is null then 'noch nicht versendet'
		when ShippedDate > RequiredDate then 'zu spät'
		else 'passt'
	end