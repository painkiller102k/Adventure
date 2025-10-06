select * from DimEmployee

--esimene index
create clustered index ix_dimemployee_name
on dimemployee(FirstName)
--Selle tulemusel SQL server ei luba luua rohkem, 
--kui �hte klastreeritud indeksit tabeli kohta. J�rgnev skript annab veateate: 
--'Cannot create more than one clustered index on table 'tblEmployee'. Drop the existing clustered index PK__tblEmplo__3214EC0706CD04F7 before creating another.' 

--N��d loome klastreeritud indeksi kahe veeruga. Selleks peame enne kustutama praeguse klastreeritud indeksi Id veerus:
drop index dimemployee.PK_dimEmplo__3214EC070A9D95DB

--N��d k�ivita j�rgnev kood uue klastreeritud �hendindeksi loomiseks Gender ja Salary veeru p�hjal:
create clustered index ix_dimempoyee_gender_salary
on dimemployee(Gender desc,salariedflag asc)

--J�rgnev kood loob SQL-s mitte-klastreeritud indeksi Name veeru j�rgi tblEmployee tabelis:
create nonclustered index ix_dimemployee_firstname
on dimemployee(firstname)