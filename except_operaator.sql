use AdventureWorksDW2019
select * from DimEmployee
select * from DimCustomer

--tagastab vasakpoolsest tabelist unikaalse arvu ridu, mida parempoolses tabelis ei ole.
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer

--Order by nõuet võib kasutada ainult kord peale paremat päringut
SELECT EmployeeKey, FirstName, Gender, BaseRate
FROM DimEmployee
WHERE BaseRate >= 10
EXCEPT
SELECT CustomerKey, FirstName, Gender, YearlyIncome
FROM DimCustomer
WHERE YearlyIncome >= 20000
ORDER BY FirstName

--erinevus except ja not in operaatoril
-- nr 88


-- Sama tulemuse võib saavutada NOT IN operaatoriga:
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer)

-- Sisesta järgnev rida tabelisse TableA
INSERT INTO DimEmployee VALUES (1, 'Martin', 'Male')

-- Nüüd käivita järgnev EXCEPT päring
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName, Gender
FROM DimCustomer

-- Nüüd käivita NOT IN operaatoriga kood
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey FROM DimCustomer)

--Järgnevas päringus on meelega veergude arv erinev ( except ) 
SELECT EmployeeKey, FirstName, Gender
FROM DimEmployee
EXCEPT
SELECT CustomerKey, FirstName
FROM DimCustomer

--Järgnevas päringus alampäring tagastab mitu veergu ( not in ) 
SELECT EmployeeKey, FirstName, Gender FROM DimEmployee
WHERE EmployeeKey NOT IN (SELECT CustomerKey, FirstName FROM DimCustomer)
