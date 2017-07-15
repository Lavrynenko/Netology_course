-----------------------------------
-- SET RIGHTS	/	Common User  --
-----------------------------------

DECLARE @id_USER INT
DECLARE @id_Attribute INT
DECLARE @OBJECT VARCHAR(2000)
DECLARE @Attribute VARCHAR(2000)


--COMMON USER
SELECT 
	@id_USER = id_role
FROM
	T_USER_ROLE
WHERE
	name_role = 'Common User'


-----------------------------------
-- AIRCRAFT	/	MSN				 --
-----------------------------------


--SETUP QUERY
SET @Attribute = 'MSN'
SET @OBJECT = 'T_MSN'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- ATA	/	ATA  				 --
-----------------------------------


--SETUP QUERY
SET @Attribute = 'ATACode'
SET @OBJECT = 'R_ATA'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- V_CR	/	CR Reference  		 --
-----------------------------------


--SETUP QUERY
SET @Attribute = 'cr_RequestReference'
SET @OBJECT = 'V_CR'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- R_Equipment	/	PN           --
-----------------------------------


--SETUP QUERY
SET @Attribute = 'PN'
SET @OBJECT = 'R_Equipment'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- R_Equipment	/	CMS(Number)  --
-----------------------------------


--SETUP QUERY
SET @Attribute = 'CMS'
SET @OBJECT = 'R_Equipment'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- V_PSS_MODEL	/	Counter Reference  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'COUNTERREF'
SET @OBJECT = 'V_PSS_MODEL'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END



-----------------------------------
-- R_FIN_CI	/	CI Flow Origin  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'SVMAJ_CI'
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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- R_FIN_CI	/	Functional Designation  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'FunctionnalDesignation'
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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- R_FIN_CI	/	FIN Name  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'FIN'
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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- R_FIN_CI	/	Fin category  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'FINCategory'
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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- R_FIN_DS	/	EDD Reference  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'EDDReference'
SET @OBJECT = 'R_FIN_DS'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END



-----------------------------------
-- R_FIN_DS	/	DS Name  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'Name'
SET @OBJECT = 'R_FIN_DS'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- R_FIN_DS	/	DS Flow Origin  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'SVMAJ_DS'
SET @OBJECT = 'R_FIN_DS'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- T_MOD	/	MOD Reference  --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'MODReference'
SET @OBJECT = 'T_MOD'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- T_MP	/	MP				 --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'MP'
SET @OBJECT = 'T_MP'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- T_POWERCENTER	/	Power Center				 --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'PowerCenter'
SET @OBJECT = 'T_POWERCENTER'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- V_RFC	/	RFC Reference				 --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'rfc_RequestReference'
SET @OBJECT = 'V_RFC'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END

-----------------------------------
-- T_SI	/	Reference SI				 --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'Reference'
SET @OBJECT = 'T_SI'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END


-----------------------------------
-- T_MP	/	MPReference				 --
-----------------------------------

--SETUP QUERY
SET @Attribute = 'MPReference'
SET @OBJECT = 'T_MP'


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

	--IF EXISTS : UPDATE ROLE
	UPDATE T_PERMISSION_ACCESS_ATTRIBUTE
	SET fast_search = 1
	WHERE
		idr_user_role = @id_USER
		AND idr_infobase = @id_Attribute

END

ELSE

BEGIN

	--ELSE : ADD ROLE
	INSERT INTO T_PERMISSION_ACCESS_ATTRIBUTE
		(idr_user_role,idr_infobase,fast_search)
	VALUES (@id_USER,@id_Attribute,1)

END