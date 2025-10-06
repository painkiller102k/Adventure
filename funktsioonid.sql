select * from DimEmployee

--Tabelisisev‰‰rtusega funktsioon e Inline Table Valued function (ILTVF) koodin‰ide:
create function fn_iltvf_employees()
returns Table
as
return (select employeekey,firstname,
cast(birthdate as date) as DOB
from dbo.DimEmployee);
--kontroll
select * from fn_iltvf_employees();