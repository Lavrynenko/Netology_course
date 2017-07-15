DECLARE @Table_name varchar(255),
	@Attribute varchar(255),
	@Attribute_Name varchar(255),
	@Role varchar(255),
	@idRole INT,
	@id_infobase INT

-- Init variable
SET @Table_Name='R_FIN_DS'
SET @Attribute='SVMAJ_DS'
SET @Attribute_Name='DS Flow Origin'
SET @Role='EPC Consult'


-- Create EPC Consult
if not exists (SELECT id_role FROM T_USER_ROLE WHERE name_role=@Role)
begin
	INSERT INTO T_USER_ROLE (name_role) VALUES (@Role)
end


-- Search EPC Consult Id
SELECT @idRole = id_role
FROM T_USER_ROLE
WHERE	name_role=@Role


-- Search IdAttribute
select @id_infobase=id_infobase 
from infobase 
where object_name = @Attribute_Name 
and object_value = @Attribute 
and table_name=@Table_name

DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE WHERE idr_infobase = @id_infobase AND idr_user_role = @idRole
INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE VALUES (@idRole, @id_infobase, 1, 0)

