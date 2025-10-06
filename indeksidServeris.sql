--35
--Nüüd loome indeksi, mis aitab päringut: Loome indeksi Salary veerule.
CREATE INDEX IX_DimEmployee_BaseRate
ON DimEmployee(BaseRate ASC)

--kontroll või execute
execute sp_help DimEmployee;

--kustuta või drop
DROP INDEX DimEmployee.IX_DimEmployee_BaseRate


--36
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

--37
--Kuna oleme märkinud Id primaarvõtmeks, siis UNIQUE CLUSTERED INDEX luuakse Id veergu ja Id on indeksvõti.
--Saame kontrollida seda käsklusega sp_helpindex , mis on süsteemi SP talletatud.
exec sp_helpindex dimEmployee

drop index dimemployee.pk_dimeplo_3214ec07236943a5

--Unikaalsus on indeksi omadus ja nii klastreeritud kui ma mitte-klastreeritud indeksid saavad olla unikaalsed.
--Kuidas saab luua unikaalset mitte-klastreeritud indeksit FirstName ja LastName veeru põhjal.
create unique nonclustered index uix_dimemployee_firstname_lastname
on dimemployee(firstname,lastname)

--Kui peaksid lisama unikaalse piirangu, siis unikaalne indeks luuakse tagataustal. 
--Selle tõestuseks lisame koodiga unikaalse piirangu City veerule.
ALTER TABLE dimEmployee 
ADD CONSTRAINT UQ_dimEmployee_City 
UNIQUE NONCLUSTERED (City)

--kui soovite sisestada kümme rida andmeid, millest viis sisaldavad korduvaid andmeid, siis kõik kümme rida lükatakse tagasi.
--Kui soovite tagasi lükata ainult viis rida ja sisestada viis kordumatut rida, siis kasutage selleks valikut IGNORE_DUP_KEY
CREATE UNIQUE INDEX IX_dimEmployee_City
ON dimEmployee(City)
WITH IGNORE_DUP_KEY

