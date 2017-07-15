DECLARE
	@UserRole			VARCHAR(255),
	@ObjectValue		VARCHAR(255),
	@TableName			VARCHAR(255),
	@ReadMode			VARCHAR(255),
	@WriteMode			VARCHAR(255)


	SET @UserRole			=	'Weight Manager'
/******************************************************************************************************
		ADMIN PERMISSION ACCESS ATTRIBUTE Creation
*******************************************************************************************************/
	--	
	-- SIRD
	--

	--
	-- 
	--
	print '________________________________________________________________________'
	SET @ObjectValue		=	'SIRD'
	SET @TableName			=	'R_ATA'
	SET @ReadMode			=	'1'
	SET @WriteMode			=	'1'
	if (not exists(select * 
		from T_PERMISSION_ACCESS_ATTRIBUTE 
		where idr_user_role = (select id_role from T_USER_ROLE where name_role = @UserRole)
		 	and idr_infobase = (select id_infobase from InfoBase where object_value = @ObjectValue and table_name = @TableName)))
	begin
		-- add link
		INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode
		)
		select T_USER_ROLE.id_role, InfoBase.id_infobase, 
		@ReadMode, 
		@WriteMode 
		from T_USER_ROLE,InfoBase 
		where (T_USER_ROLE.name_role = @UserRole) AND (InfoBase.object_value = @ObjectValue)
	end
	else
	begin
		-- Update link
		UPDATE    T_PERMISSION_ACCESS_ATTRIBUTE
		SET       read_mode = @ReadMode, write_mode = @WriteMode
		WHERE     
			(idr_user_role = (SELECT id_role FROM T_USER_ROLE WHERE name_role = @UserRole)) 
			AND 
			(idr_infobase = (SELECT id_infobase FROM InfoBase WHERE object_value = @ObjectValue))
	end
