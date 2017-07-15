DECLARE @user_role VARCHAR(8000)
DECLARE @table_name VARCHAR(8000)
DECLARE @object_value VARCHAR(8000)
DECLARE @read_mode VARCHAR(8000)
DECLARE @write_mode VARCHAR(8000)
DECLARE @fast_search_mode VARCHAR(8000)

--select * from t_user_role

/*
Suppression des droits sur l'attribut FIN Configuration Reported pour FLS Specialist
*/

SET @user_role = 'FLS Specialist'
SET @table_name = 'R_FIN_CI'
SET @object_value = 'BITEConfReport'
SET @read_mode = '1'
SET @write_mode = '0'
SET @fast_search_mode = '0'

IF (not exists(	SELECT 
				idr_infobase 
			FROM 
				T_PERMISSION_ACCESS_ATTRIBUTE  
			WHERE 
				idr_user_role in (SELECT id_role FROM t_user_role WHERE name_role=@user_role ) 
				AND idr_infobase in (SELECT id_infobase FROM infobase WHERE table_name=@table_name 
				AND object_value=@object_value  and idr_group is not null))) 	
BEGIN 
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE(
			idr_user_role, 
			idr_infobase, 
			read_mode, 
			write_mode, 
			fast_search) 
	SELECT 
		(SELECT id_role FROM t_user_role WHERE name_role=@user_role),
		(SELECT id_infobase FROM infobase WHERE table_name=@table_name AND object_value=@object_value), 
		@read_mode,
		@write_mode,
		@fast_search_mode 
	PRINT 'The right' +  + ' for role ' + @user_role  + ' is inserted'
END
ELSE
BEGIN
	UPDATE
		T_PERMISSION_ACCESS_ATTRIBUTE 
	SET
		read_mode = @read_mode,
		write_mode = @write_mode,
		fast_search = @fast_search_mode 
	WHERE
		idr_user_role = (SELECT id_role FROM t_user_role WHERE name_role=@user_role)
		AND idr_infobase = (SELECT id_infobase FROM infobase WHERE table_name=@table_name AND object_value=@object_value)
	PRINT 'The right' +  + ' for role ' + @user_role  + 'is updated'
END


/*
Suppression des droits sur l'attribut FIN Configuration Reported pour FLS Specialist
*/

SET @user_role = 'FLS Administrator'
SET @table_name = 'R_FIN_CI'
SET @object_value = 'BITEConfReport'
SET @read_mode = '1'
SET @write_mode = '0'
SET @fast_search_mode = '0'

IF (not exists(	SELECT 
				idr_infobase 
			FROM 
				T_PERMISSION_ACCESS_ATTRIBUTE  
			WHERE 
				idr_user_role in (SELECT id_role FROM t_user_role WHERE name_role=@user_role ) 
				AND idr_infobase in (SELECT id_infobase FROM infobase WHERE table_name=@table_name 
				AND object_value=@object_value  and idr_group is not null))) 	
BEGIN 
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE(
			idr_user_role, 
			idr_infobase, 
			read_mode, 
			write_mode, 
			fast_search) 
	SELECT 
		(SELECT id_role FROM t_user_role WHERE name_role=@user_role),
		(SELECT id_infobase FROM infobase WHERE table_name=@table_name AND object_value=@object_value), 
		@read_mode,
		@write_mode,
		@fast_search_mode 
	PRINT 'The right' +  + ' for role ' + @user_role  + ' is inserted'
END
ELSE
BEGIN
	UPDATE
		T_PERMISSION_ACCESS_ATTRIBUTE 
	SET
		read_mode = @read_mode,
		write_mode = @write_mode,
		fast_search = @fast_search_mode 
	WHERE
		idr_user_role = (SELECT id_role FROM t_user_role WHERE name_role=@user_role)
		AND idr_infobase = (SELECT id_infobase FROM infobase WHERE table_name=@table_name AND object_value=@object_value)
	PRINT 'The right' +  + ' for role ' + @user_role  + 'is updated'
END
