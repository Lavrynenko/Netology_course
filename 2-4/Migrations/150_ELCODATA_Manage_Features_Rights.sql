------------------------------------------------------------------------
-- MANAGE RIGHTS ACCESS TO FEATURES
--
-- @program		ALL
-- @version		2.0
-- @module		ELCODATA

-- List of features Rights updated:

--	'Add values into choice list'      

---------------------------------------------------------------------------------------------------------------------
-- Delete rights on feature "Add values into choice list" for "SADM Administrator" --  "MAFU Administrator"
---------------------------------------------------------------------------------------------------------------------

DELETE  FROM T_LINK_FEATURE_USER_ROLE 
	WHERE IDR_FEATURE IN (SELECT id_feature FROM T_FEATURE WHERE label = 'Add values into choice list')
		AND IDR_USER_ROLE IN (SELECT id_role FROM T_USER_ROLE WHERE name_role ='SADM Administrator')

DELETE  FROM T_LINK_FEATURE_USER_ROLE 
	WHERE IDR_FEATURE IN (SELECT id_feature FROM T_FEATURE WHERE label = 'Add values into choice list')
		AND IDR_USER_ROLE IN (SELECT id_role FROM T_USER_ROLE WHERE name_role ='MAFU Administrator')