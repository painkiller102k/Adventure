select * from DimEmployee
select * from DimProduct

--Selleks, et arvutada kogu m��ki toote pealt, siis peame kirjutama GROUP BY p�ringu:
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName

--Kui soovime ainult neid tooteid, kus m��k kokku on suurem kui 1000�, 
--siis kasutame filtreerimaks tooteid HAVING tingimust.
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 800

--Kui kasutame WHERE klasulit HAVING-u asemel, 
--siis saame s�ntaksivea. P�hjuseks on WHERE-i mitte t��tamine kokku arvutava funktsiooniga, 
--mis sisaldab SUM, MIN, MAX, AVG jne.

SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 666

-- See n�ide p�rib k�ik read Sales tabelis, 
--mis n�itavad summat ning eemaldavad k�ik tooted peale Blade ja Guide Pulley. ( group by ) 
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
WHERE EnglishProductName IN ('Blade', 'Guide Pulley')
GROUP BY EnglishProductName

--See n�ide p�rib k�ik read Sales tabelis,
--mis n�itavad summat ning eemaldavad k�ik tooted peale Blade ja Guide Pulley. ( having )
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING EnglishProductName IN ('Blade', 'Guide Pulley')

--