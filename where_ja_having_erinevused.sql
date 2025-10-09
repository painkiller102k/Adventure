select * from DimEmployee
select * from DimProduct

--Selleks, et arvutada kogu müüki toote pealt, siis peame kirjutama GROUP BY päringu:
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName

--Kui soovime ainult neid tooteid, kus müük kokku on suurem kui 1000€, 
--siis kasutame filtreerimaks tooteid HAVING tingimust.
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 800

--Kui kasutame WHERE klasulit HAVING-u asemel, 
--siis saame süntaksivea. Põhjuseks on WHERE-i mitte töötamine kokku arvutava funktsiooniga, 
--mis sisaldab SUM, MIN, MAX, AVG jne.

SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING SUM(SafetyStockLevel) > 666

-- See näide pärib kõik read Sales tabelis, 
--mis näitavad summat ning eemaldavad kõik tooted peale Blade ja Guide Pulley. ( group by ) 
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
WHERE EnglishProductName IN ('Blade', 'Guide Pulley')
GROUP BY EnglishProductName

--See näide pärib kõik read Sales tabelis,
--mis näitavad summat ning eemaldavad kõik tooted peale Blade ja Guide Pulley. ( having )
SELECT EnglishProductName, SUM(SafetyStockLevel) AS TotalSales 
FROM DimProduct
GROUP BY EnglishProductName
HAVING EnglishProductName IN ('Blade', 'Guide Pulley')

--