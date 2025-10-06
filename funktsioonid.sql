use AdventureWorksDW2019
select * from DimEmployee

--32 fail funktsioonid
--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:
create function fn_iltvf_employees()
returns Table
as
return (select employeekey,firstname,
cast(birthdate as date) as DOB
from dbo.DimEmployee);
--kontroll
select * from fn_iltvf_employees();

--Mitme avaldisega tabeliväärtusega funktsioonid e multi-statement table valued function (MSTVF):
create function fn_mstvf_getemployees()
returns @Table table (id int,Name nvarchar(20), DOB date)
as
begin
insert into @Table
select EmployeeKey,FirstName,cast(BirthDate as date)
from DimEmployee
return
end
--kontroll
Select * from fn_MSTVF_GetEmployees()


update fn_iltvf_employees() set FirstName='Sam1' where EmployeeKey=1

--33 fail funktsioonid
--Skaleeritav funktsioon ilma krüpteerimata:
CREATE FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20)
AS
BEGIN
RETURN (SELECT FirstName FROM DimEmployee WHERE EmployeeKey = @Id)
END
--kontroll
SELECT dbo.fn_GetEmployeeNameById(1);

