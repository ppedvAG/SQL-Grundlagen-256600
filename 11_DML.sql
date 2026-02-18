-- Modul 11 DML

-- Mit dem Insert Statement eine oder mehrere neue Zeilen einfügen
insert into Employees
(LastName, FirstName, Country, City)
values
('Enzenhofer', 'Dominik', 'Austria', 'Vienna')

select * from Employees

-- Mehrere Zeilen einfügen
insert into Employees
(LastName, FirstName, Country, City)
values
('Mustermann', 'Max', 'Germany', 'Berlin'),
('Patternwomen', 'Mary', 'USA', 'Seattle')

select * from Employees

-- Select Into Tabelle erstellen
-- tabelle für "neue" bestellung (ab 1998)
select * into NewOrder from Orders
where Year(OrderDate) >= 1998

select * from NewOrder

-- Update auf neuen Mitarbeiter
Update Employees
set Title = 'Trainee',
	HireDate = Getdate()
where EmployeeID > 9

-- HireDate Zeit auf 0 Setzen
Update Employees
set HireDate = Cast(HireDate as Date)
where EmployeeID > 9

-- Create Table
create table TestTable (
	TestID int identity primary key,
	TestName nvarchar(40) not null,
	TestNumber int)

-- insert in neue Tabelle
insert into TestTable
(TestName, TestNumber)
values
('Test1', 1)

select * from TestTable

insert into TestTable
(TestName, TestNumber)
values
('Test2', 2),
('Test3', null)

insert into TestTable
(TestName)
values
('Test4')


-- Mit delete Zeilen löschen
-- WICHTIG: immer mit WHERE, sonst löscht man alle Einträge
delete from TestTable where TestName like '%[3|4]'

select * from TestTable

create database TestDB

select * into TestDB.dbo.Employees from northwind.dbo.Employees