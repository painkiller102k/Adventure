select * from DimEmployee

--esimene index
create clustered index ix_dimemployee_name
on dimemployee(FirstName)
--Selle tulemusel SQL server ei luba luua rohkem, 
--kui ühte klastreeritud indeksit tabeli kohta. Järgnev skript annab veateate: 
--'Cannot create more than one clustered index on table 'tblEmployee'. Drop the existing clustered index PK__tblEmplo__3214EC0706CD04F7 before creating another.' 

--Nüüd loome klastreeritud indeksi kahe veeruga. Selleks peame enne kustutama praeguse klastreeritud indeksi Id veerus:
drop index dimemployee.PK_dimEmplo__3214EC070A9D95DB

--Nüüd käivita järgnev kood uue klastreeritud ühendindeksi loomiseks Gender ja Salary veeru põhjal:
create clustered index ix_dimempoyee_gender_salary
on dimemployee(Gender desc,salariedflag asc)

--Järgnev kood loob SQL-s mitte-klastreeritud indeksi Name veeru järgi tblEmployee tabelis:
create nonclustered index ix_dimemployee_firstname
on dimemployee(firstname)