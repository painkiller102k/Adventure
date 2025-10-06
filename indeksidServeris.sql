--Nüüd loome indeksi, mis aitab päringut: Loome indeksi Salary veerule.
CREATE INDEX IX_DimEmployee_BaseRate
ON DimEmployee(BaseRate ASC)

--kontroll või execute
execute sp_help DimEmployee;

--kustuta või drop
DROP INDEX DimEmployee.IX_DimEmployee_BaseRate