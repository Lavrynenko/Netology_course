DECLARE @Table_name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255),
	@Role varchar(255),
	@idRole varchar(255),
	@id_infobase varchar(255)
	
-----------------------
--- Create the role ---
-----------------------

SET @Role='EPC ATAXX'
if not exists (SELECT id_role FROM T_USER_ROLE WHERE name_role=@Role)
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES (@Role)
end



----------------
-- INSERT Rights --
----------------
					--------------------------------- EPC Consult ------------------------------------
IF (not exists(SELECT idr_infobase 
				FROM T_PERMISSION_ACCESS_ATTRIBUTE  
				WHERE idr_user_role in (SELECT id_role FROM t_user_role WHERE name_role='EPC ATAXX') 
				AND idr_infobase in (SELECT id_infobase FROM infobase WHERE table_name='R_FIN_DS' AND object_name='P/CD Startup Delay' and idr_group is not null))) 	
BEGIN 
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE(idr_user_role, idr_infobase, read_mode, write_mode, fast_search) 
				SELECT (SELECT id_role FROM t_user_role WHERE name_role='EPC ATAXX'),(SELECT id_infobase FROM infobase WHERE table_name='R_FIN_DS' AND object_name='P/CD Startup Delay' and idr_group is not null), '1','1','0' 
END