select * from DimDepartmentGroup

--Selleks, et saada soovitud tulemus, me peaksime ühendama kaks tabelit omavahel
--Kui JOIN-d on sulle uus teema, siis vaata eelnevaid harjutusi JOIN-de kohta.
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

--Nüüd loome view, kus kasutame JOIN-i:
CREATE VIEW vWEmployeeByDepartment
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
--kontroll
select * from vWEmployeeByDepartment

-- View, mis tagastab ainult Manufacturing osakonna töötajad
CREATE VIEW vWITManufacturingDepartment_Employees
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
WHERE DimDepartmentGroup.DepartmentGroupName = 'Manufacturing'
--kontroll
SELECT * FROM vWITManufacturingDepartment_Employees

--View, kus ei ole BaseRate veergu
CREATE VIEW vWEmployeesNonConfData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
--kontroll
SELECT * FROM vWEmployeesNonConfData

--View, mis tagastab summeeritud andmed töötajate koondarvest.
CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(DepartmentGroupKey) AS TotalEmployees
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
GROUP BY DepartmentName
--kontroll
SELECT * FROM vWEmployeesCountByDepartment

-- Kui soovid vaadata view definitsiooni
sp_helptext vWName
-- Kui soovid muuta view-d
ALTER VIEW
-- Kui soovid kustutada view-d 
DROP VIEW vWName

--view uuendused nr 40

--view, mis tagastab peaaegu kõik veerud, aga va Salary veerg.
CREATE VIEW vWEmployeesDataExceptSalary
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
--kontroll
SELECT * FROM vWEmployeesDataExceptSalary

-- Järgnev päring uuendab Name veerus olevat nime Mike Mikey peale. 
UPDATE vWEmployeesDataExSalary
SET FirstName = 'Mikey' WHERE EmployeeKey = 2
--kontroll
SELECT * FROM DimEmployee


-- Loome view, mis ühendab kaks eelpool käsitletud tabelit ja annab sellise tulemuse:Samas on võimalik sisestada ja kustutada ridu baastabelis ning kasutada view-d.
DELETE FROM vWEmployeesDataExSalary WHERE EmployeeKey = 2
INSERT INTO vWEmployeesDataExSalary VALUES (2, 'Mikey', 'M', 2)

-- Loome view, mis ühendab kaks eelpool käsitletud tabelit ja annab sellise tulemuse
CREATE VIEW vWEmployeeDetailsByDept
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey
--kontroll
SELECT * FROM vWEmployeeDetailsByDept

-- Nüüd uuendame John osakonda HR pealt Corporate peale. Hetkel on kaks töötajat HR osakonnas
UPDATE vWEmployeeDetailsByDept
SET DepartmentName = 'Corporate' WHERE FirstName = 'John'
--kontroll
SELECT * FROM DimEmployee
