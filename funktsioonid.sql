select * from DimEmployee

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
select Id,Name,cast(DateOfBirth as date)
from tblEmployees
return
end
--kontroll
Select * from fn_MSTVF_GetEmployees()
