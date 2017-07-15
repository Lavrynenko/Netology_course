DECLARE @id_infobase INT
DECLARE @id_role INT
DECLARE @read_mode INT
DECLARE @write_mode INT
DECLARE @fast_search INT


----------------------------
--ATTRIBUT rfc_OSTeamComment
----------------------------
select @id_infobase = id_infobase from infobase where object_value = 'rfc_OSTeamComment'
select @id_role = id_role from t_user_role where name_role = 'MAFU Group Leader'
SET @read_mode = 1
SET @write_mode = 1
SET @fast_search = 0

if not exists(	select 
			* 
		from 
			t_permission_access_attribute 
		where 
			idr_infobase = @id_infobase
			AND idr_user_role = @id_role)
BEGIN
	INSERT
		t_permission_access_attribute (idr_user_role,idr_infobase,read_mode,write_mode,fast_search)
	VALUES
		(@id_role,@id_infobase,@read_mode,@write_mode,@fast_search)	
	PRINT 'INSERT : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END
ELSE
BEGIN
	UPDATE
		t_permission_access_attribute
	SET
		read_mode = @read_mode,
		write_mode = @write_mode,
		fast_search = @fast_search
	where 
		idr_infobase = @id_infobase
		AND idr_user_role = @id_role
	PRINT 'UPDATE : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END

----------------------------
--ATTRIBUT rfc_EVCRLTiTDateA
----------------------------
select @id_infobase = id_infobase from infobase where object_value = 'rfc_EVCRLTiTDateA'
select @id_role = id_role from t_user_role where name_role = 'MAFU Group Leader'
SET @read_mode = 1
SET @write_mode = 1
SET @fast_search = 0

if not exists(	select 
			* 
		from 
			t_permission_access_attribute 
		where 
			idr_infobase = @id_infobase
			AND idr_user_role = @id_role)
BEGIN
	INSERT
		t_permission_access_attribute (idr_user_role,idr_infobase,read_mode,write_mode,fast_search)
	VALUES
		(@id_role,@id_infobase,@read_mode,@write_mode,@fast_search)	
	PRINT 'INSERT : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END
ELSE
BEGIN
	UPDATE
		t_permission_access_attribute
	SET
		read_mode = @read_mode,
		write_mode = @write_mode,
		fast_search = @fast_search
	where 
		idr_infobase = @id_infobase
		AND idr_user_role = @id_role
	PRINT 'UPDATE : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END


----------------------------
--ATTRIBUT rfc_EVCRTRSiTDateA
----------------------------
select @id_infobase = id_infobase from infobase where object_value = 'rfc_EVCRTRSiTDateA'
select @id_role = id_role from t_user_role where name_role = 'MAFU Group Leader'
SET @read_mode = 1
SET @write_mode = 1
SET @fast_search = 0

if not exists(	select 
			* 
		from 
			t_permission_access_attribute 
		where 
			idr_infobase = @id_infobase
			AND idr_user_role = @id_role)
BEGIN
	INSERT
		t_permission_access_attribute (idr_user_role,idr_infobase,read_mode,write_mode,fast_search)
	VALUES
		(@id_role,@id_infobase,@read_mode,@write_mode,@fast_search)	
	PRINT 'INSERT : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END
ELSE
BEGIN
	UPDATE
		t_permission_access_attribute
	SET
		read_mode = @read_mode,
		write_mode = @write_mode,
		fast_search = @fast_search
	where 
		idr_infobase = @id_infobase
		AND idr_user_role = @id_role
	PRINT 'UPDATE : Write mode is activate for MAFU Group LEADER on the attribute rfc_OSTeamComment'
END


