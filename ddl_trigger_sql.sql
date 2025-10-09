-- S�ntaks loomaks DDL trigereid
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
-- Trigger Body
END

-- J�rgnev trigger k�ivitab vastuseks CREATE_TABLE DDL s�ndmuse: sp_rename
CREATE TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
PRINT 'New table created'
END
-- Kui sa j�rgnevat koodi k�ivitad, siis trigger l�heb automaatselt k�ima ja prindib v�lja s�numi: uus tabel on loodud.
CREATE TABLE test (id INT)

-- Kui soovid, et see trigger k�ivitatakse mitu korda nagu muuda ja kustuta tabel, siis eralda s�ndmused ning kasuta koma.
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
PRINT 'A table just been created, modified or deleted'
END

-- N��d vaatame n�idet, kuidas �ra hoida kasutajatel loomaks, muutmaks v�i kustatamiseks tabelit. 
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'You cannot create, modify, alter or drop a table'
END

-- Kui lubada triggerit
DISABLE TRIGGER FirstTrigger ON DATABASE
-- Kuidas kustutada triggerit
DROP TRIGGER FirstTrigger ON DATABASE

-- J�rgnev trigger k�ivitub, kui peaksid kasutama sp_rename k�sklust s�steemi stored procedurite muutmisel.
CREATE TRIGGER RenameTable 
ON Database
FOR RENAME
AS
BEGIN
ROLLBACK
PRINT 'You just renamed something'
END

-- J�rgnev kood muudab TestTable nime NewTestTable nimeks
sp_rename 'TestTable', 'NewTestTable' 
-- J�rgnev kood muudab Id veergu NewTestTabel tabelis NewId peale
sp_rename 'NewTestTable.Id' , 'NewId', 'column'