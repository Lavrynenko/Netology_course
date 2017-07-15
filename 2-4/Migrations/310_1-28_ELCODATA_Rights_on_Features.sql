DECLARE @idFeature VARCHAR(255)
DECLARE @idRole VARCHAR(255)

-------------------------------------------------------------------
-- Add rights on feature "Delete EDD" for EPC Super Admin ---------
-------------------------------------------------------------------

SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Delete EDD' 
	AND display_context LIKE '%;DS/CONSULT;%'



-- EPC ADMIN
SET @idRole = ''
SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'EPC Super Admin'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature AND idr_user_role = @idRole

INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

-----------------------------------------------------------------
-- only EPC ATA224 can access to Edit MSN Power Center         --
-----------------------------------------------------------------

SET @idFeature = ''

SELECT 
	@idFeature = id_feature 
FROM 
	T_FEATURE 
WHERE 
	label = 'Edit MSN Power Center' 
	AND display_context LIKE '%;MSNPOWERCENTER/CONSULT;%'


-- EPC Ata24
SET @idRole = ''

SELECT 
	@idRole = id_role 
FROM 
	T_USER_ROLE 
WHERE 
	name_role = 'EPC Ata24'

DELETE FROM T_LINK_FEATURE_USER_ROLE WHERE idr_feature = @idFeature
 
INSERT INTO T_LINK_FEATURE_USER_ROLE VALUES (@idFeature, @idRole)

