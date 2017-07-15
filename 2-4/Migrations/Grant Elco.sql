-- Ini parameter
DECLARE @PSE_Database VARCHAR(8000)


-- Change this value depending on the environment
SET @PSE_Database = (select name from master..sysdatabases where dbid = DB_ID())

-- Create the login only if it does not already exists (re-entrance)
IF ((SELECT count(Name) FROM master.dbo.syslogins WHERE loginname = 'ELCO' and isntname = 0) = 0)
	-- Add the login
	exec sp_addlogin 'ELCO', 'ELCO'
GO

-- Create the user
IF ((select count(Name) from sysusers  WHERE [name]='ELCO' and isntname = 0) = 0)
	-- Add the login
	EXEC sp_adduser 'ELCO', 'ELCO'
GO

EXEC sp_addrolemember 'db_datareader', 'ELCO'

EXEC sp_change_users_login 'Update_One', 'ELCO', 'ELCO'

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_3_1_5]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_3_1_5 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_3_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_3_2 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_3_2_1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_3_2_1 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_4_1]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_4_1 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_4_2]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_4_2 TO ELCO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_ELCOFI_4_4]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	GRANT EXEC ON sp_ELCOFI_4_4 TO ELCO