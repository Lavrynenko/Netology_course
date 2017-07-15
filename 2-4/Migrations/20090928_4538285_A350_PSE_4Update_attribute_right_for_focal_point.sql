
DECLARE @id_USER INT
DECLARE @id_Attribute INT
DECLARE @Attribute VARCHAR(2000)
DECLARE @OBJECT VARCHAR(2000)

SET @id_USER = ''



--  Create User 
IF ( NOT ( EXISTS (
	SELECT
		* 
	FROM
		T_USER_ROLE 
	WHERE 
		name_role = 'FLS Focal Point'
)))

BEGIN

	INSERT INTO	T_USER_ROLE
	(name_role) VALUES ('FLS Focal Point')

END


SELECT 
	@id_USER = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'FLS Focal Point'



----------------------------------------
--ADD ATTRIBUTE "Hardware group" FOR THE OBJECT "Associated FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCIHWGroup'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Software group" FOR THE OBJECT "Associated FIN CI"
----------------------------------------


--SETUP QUERY
SET @Attribute = 'FinCiSWGroup'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END

----------------------------------------
--ADD ATTRIBUTE "SW type" FOR THE OBJECT "Associated FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiSWType'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Multi installation? (Y/N)" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiMultiInstallation'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Ground tool associated" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiGroundToolAssociated'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END




----------------------------------------
--ADD ATTRIBUTE "PNR can be modified by A/L after ToT?" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiPNRmodified'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END



----------------------------------------
--ADD ATTRIBUTE "System name" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiSystemName'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END




----------------------------------------
--ADD ATTRIBUTE "FLS classification" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiFLSClassification'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END





----------------------------------------
--ADD ATTRIBUTE "Certification level" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiCertificationLevel'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END



----------------------------------------
--ADD ATTRIBUTE "Conf file multi source?" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiConfFileMultiSource'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END




----------------------------------------
--ADD ATTRIBUTE "Uploading chronology rank" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCIRank'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END



----------------------------------------
--ADD ATTRIBUTE "Reloading condition tag" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiReloadingConditionTag'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Uploading mean" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiUploadingMean'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "SW type" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiSWType'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Software group" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCiSWGroup'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


----------------------------------------
--ADD ATTRIBUTE "Hardware group" FOR THE OBJECT "FIN CI"
----------------------------------------

--SETUP QUERY
SET @Attribute = 'FinCIHWGroup'
SET @OBJECT = 'R_FIN_CI'


--SELECT ATTRIBUTE
SELECT
	@id_Attribute = id_infobase
FROM
	infobase
WHERE
	object_value = @Attribute
	AND table_name = @OBJECT

IF (EXISTS (
	SELECT
		*
	FROM
		T_PERMISSION_ACCESS_ATTRIBUTE
	WHERE
		idr_user_role =  @id_USER
		AND idr_infobase = @id_Attribute
		))

BEGIN 

	--UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET read_mode = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--INSERT ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,read_mode)
	VALUES (@id_USER,@id_Attribute,1)

END


DELETE FROM 
	T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE
	idr_infobase IN (SELECT id_infobase FROM infobase WHERE table_name='ASSOCIATED_FIN_CI' and object_value='fin_to')
	and idr_user_role IN (SELECT id_role from t_user_role where name_role='FLS Focal Point')

INSERT INTO
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_infobase,
		idr_user_role,
		read_mode
	)
SELECT
	id_infobase,
	id_role,
	'1'
FROM
	infobase,
	T_user_role
WHERE
	table_name='ASSOCIATED_FIN_CI' 
	and object_value='fin_to'
	and name_role='FLS Focal Point'
	
	
	DELETE FROM 
	T_PERMISSION_ACCESS_ATTRIBUTE 
WHERE
	idr_infobase IN (SELECT id_infobase FROM infobase WHERE table_name='ASSOCIATED_FIN_CI' and object_value='link_type')
	and idr_user_role IN (SELECT id_role from t_user_role where name_role='FLS Focal Point')

INSERT INTO
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_infobase,
		idr_user_role,
		read_mode
	)
SELECT
	id_infobase,
	id_role,
	'1'
FROM
	infobase,
	T_user_role
WHERE
	table_name='ASSOCIATED_FIN_CI' 
	and object_value='link_type'
	and name_role='FLS Focal Point'
