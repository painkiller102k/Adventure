select * from DimDepartmentGroup

--Selleks, et saada soovitud tulemus, me peaksime �hendama kaks tabelit omavahel
--Kui JOIN-d on sulle uus teema, siis vaata eelnevaid harjutusi JOIN-de kohta.
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup 
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupName

--N��d loome view, kus kasutame JOIN-i:
CREATE VIEW vWEmployeeByDepartment
AS
SELECT EmployeeKey, FirstName, BaseRate, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

