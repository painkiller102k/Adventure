--Create Table #PersonDetails(Id int, Name nvarchar(20))


--Kui ajutine tabel on loodud SP sees, 
--siis see kustutakse peale SP l�puleviimist automaatselt �ra. 
--Allpool olevas SP-s luuakse ajutine tabel #PersonsDetails ja edastab andmeid ja l�hub ajutise tabeli automaatselt peale k�su l�pule j�udmist.
CREATE PROCEDURE spCreateLocalTempTable
AS 
BEGIN
CREATE TABLE #DimEmployee(EmployeeKey INT, FirstName NVARCHAR(20))
INSERT INTO #DimEmployee VALUES(1,'Mike')
INSERT INTO #DimEmployee VALUES(2,'John')
INSERT INTO #DimEmployee VALUES(3,'Todd')
SELECT * FROM #DimEmployee
end
--kontroll
exec spCreateLocalTempTable