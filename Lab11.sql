-- Lab 11 DML
-- Datenbank erstellen
create database TestDB

-- Employee Tabelle von northwind kopieren
select * into TestDB.dbo.Employees 
	from northwind.dbo.Employees

-- Neue Spalte Salary hinzufügen
alter table Employees
add Salary money

select * from Employees

-- Beliebige Werte in Salary Eintragen 
-- (hier wird einfach die ID mit 1000 multipliziert)
update Employees
set Salary = EmployeeID*1000

-- Andere Methode 
-- (aufwendig, für jede Zeile einzelnd schreiben):
update Employees
set Salary = 2500
where EmployeeID = 1

update Employees
set Salary = (CASE	
				when EmployeeID = 1 then 2700
				when EmployeeID = 2 then 2500
				when EmployeeID = 3 then 1500
				when EmployeeID = 4 then 3500
				when EmployeeID = 5 then 3100
				when EmployeeID = 6 then 2900
				when EmployeeID = 7 then 2200
				when EmployeeID = 8 then 2300
				when EmployeeID = 9 then 2500
				else 1000
			end)


