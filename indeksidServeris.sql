--N��d loome indeksi, mis aitab p�ringut: Loome indeksi Salary veerule.
CREATE INDEX IX_DimEmployee_BaseRate
ON DimEmployee(BaseRate ASC)

--kontroll v�i execute
execute sp_help DimEmployee;

--kustuta v�i drop
DROP INDEX DimEmployee.IX_DimEmployee_BaseRate