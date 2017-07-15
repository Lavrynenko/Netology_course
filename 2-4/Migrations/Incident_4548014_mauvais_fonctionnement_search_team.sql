IF(EXISTS(
	SELECT 
		id_infobase 
	FROM
		infobase
	WHERE
		object_value = 'team'
		AND table_name = 'V_PSS_MODEL'
	))
BEGIN
	UPDATE infobase SET type_val = 'text' WHERE object_value = 'team' AND table_name = 'V_PSS_MODEL'
	PRINT 'The attribute "TEAM" was updated'
END
ELSE
BEGIN
	PRINT 'The attribute "TEAM" does not exist'
END