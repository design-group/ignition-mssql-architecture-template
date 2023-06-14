IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DEFAULT_DB')
BEGIN
	CREATE DATABASE DEFAULT_DB;
END;
GO
USE DEFAULT_DB;
GO
-- To create a new schema, use the following commands:
-- CREATE SCHEMA [schema_name];
-- GO
-- To create a new table, use the following commands:
-- CREATE TABLE [schema_name].[table_name] (
--     [column_name] [data_type] [NOT NULL],
--     [column_name] [data_type] [NOT NULL],
--     ...
-- );
-- GO
CREATE LOGIN Ignition WITH PASSWORD = 'P@ssword1!';
USE DEFAULT_DB;
CREATE USER Ignition FOR LOGIN Ignition;
ALTER ROLE db_owner ADD MEMBER Ignition;
GO