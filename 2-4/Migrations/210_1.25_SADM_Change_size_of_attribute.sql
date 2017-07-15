DECLARE
	@ObjectValue		VARCHAR(255),
	@VarChar			VARCHAR(255),
	@TableName		VARCHAR(255)
	
-- SIRDossier  Title
SET @ObjectValue		=	'SIRDTitle'
SET @VarChar			=	500
SET @TableName			=	'T_SIRD'	

if(exists ( 	select 
			* 
		from 
			syscolumns 
		where	
			syscolumns.id = (select 
							sysobjects.id 
						from 
							sysobjects 
						where 
							name = @TableName)
			and	syscolumns.name = @ObjectValue)) 
	BEGIN
		exec ('ALTER TABLE ' + @TableName + ' ALTER COLUMN ' + @ObjectValue + ' varchar(' + @VarChar + ')')
		print 'ALTER TABLE        --->   Attribute ' + @ObjectValue + ' modified '
	END
	ELSE 
	BEGIN
		print 'NOT ALTER TABLE    --->   Attribute ' + @ObjectValue + ' does not exist in table ' + @TableName 
	END
	

-- SWRDossier  Title
SET @ObjectValue		=	'SWRDTitle'
SET @VarChar			=	500
SET @TableName			=	'T_SWRD'	

if(exists ( 	select 
			* 
		from 
			syscolumns 
		where	
			syscolumns.id = (select 
							sysobjects.id 
						from 
							sysobjects 
						where 
							name = @TableName)
			and	syscolumns.name = @ObjectValue)) 
	BEGIN
		exec ('ALTER TABLE ' + @TableName + ' ALTER COLUMN ' + @ObjectValue + ' varchar(' + @VarChar + ')')
		print 'ALTER TABLE        --->   Attribute ' + @ObjectValue + ' modified '
	END
	ELSE 
	BEGIN
		print 'NOT ALTER TABLE    --->   Attribute ' + @ObjectValue + ' does not exist in table ' + @TableName 
	END
	

-- Electrical circuit letter
SET @ObjectValue		=	'SWRDElectricalCircuitLetter'
SET @VarChar			=	200
SET @TableName			=	'T_SWRD'	

if(exists ( 	select 
			* 
		from 
			syscolumns 
		where	
			syscolumns.id = (select 
							sysobjects.id 
						from 
							sysobjects 
						where 
							name = @TableName)
			and	syscolumns.name = @ObjectValue)) 
	BEGIN
		exec ('ALTER TABLE ' + @TableName + ' ALTER COLUMN ' + @ObjectValue + ' varchar(' + @VarChar + ')')
		print 'ALTER TABLE        --->   Attribute ' + @ObjectValue + ' modified '
	END
	ELSE 
	BEGIN
		print 'NOT ALTER TABLE    --->   Attribute ' + @ObjectValue + ' does not exist in table ' + @TableName 
	END