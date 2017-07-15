								--------------------------------------------------------------
								-- EDIT ELA FOR ATA24										--
								-- SS: ELCODATA_V1.30_synthesis_sheet_EditELAAfterMG3.doc	--
								--------------------------------------------------------------

DECLARE @id_feature INT
DECLARE @_roleata24 INT

-- Id FEATURE GROUP
DECLARE @id_feature_groupe INT
SET @id_feature_groupe = 0

SELECT @id_feature_groupe = id_feature_group 
FROM T_FEATURE_GROUP
WHERE label = 'Management'

-- Id Role
DECLARE @id_role INT
SET @id_role = 0

SELECT @id_role = id_role 
FROM T_USER_ROLE 
WHERE name_role='EPC ATA24'


IF (not exists(SELECT * 
		FROM T_feature 
		WHERE label = 'Edit ELA'
		AND linked_url = '/BUSINESS_OBJECTS/DS/ELA/update/ELA_Update_Form.php?id_ELA=#id_ELA#'
		AND display_context = ';ELA/CONSULT;'
		AND where_clause IS NOT NULL))

BEGIN	

	/* Insert Edit ELA Feature for ATA24 */
	INSERT INTO t_feature (label, 
			description, 
			idr_feature_group, 
			display_order, 
			linked_url, 
			display_context, 
			is_PopUp,
			icon,
			where_clause)
	       VALUES ('Edit ELA', 
		       'EPC ATA 24 must edit ELA after Maturity Gate 3', 
		       @id_feature_groupe, 
		       '99', 
		       '/BUSINESS_OBJECTS/DS/ELA/update/ELA_Update_Form.php?id_ELA=#id_ELA#', 
		       ';ELA/CONSULT;', 
		       '0', 
		       'puce_orange.gif',
			'SELECT * FROM R_FIN_DS where id_ds=''#id_ELA#'' and MG>=3')

	
	SELECT @id_feature=id_feature
		FROM T_feature 
		WHERE label = 'Edit ELA'
		AND linked_url = '/BUSINESS_OBJECTS/DS/ELA/update/ELA_Update_Form.php?id_ELA=#id_ELA#'
		AND display_context = ';ELA/CONSULT;'		
		AND description='EPC ATA 24 must edit ELA after Maturity Gate 3'
	
	/* Insert the link FEATURE-ROLE */
	INSERT INTO T_LINK_FEATURE_USER_ROLE (idr_feature,idr_user_role) 
	VALUES(@id_feature,@id_role)
	
	/* Link Attribute-Role */
	SELECT @_roleata24=id_role
	FROM T_USER_ROLE
	WHERE name_role='EPC ATA24'
	-- Delete the link Attribute-Role (ATA24)
	DELETE FROM 
		t_permission_access_attribute
	WHERE 
		idr_user_role=@_roleata24
		and idr_infobase in (SELECT id_infobase FROM infobase WHERE table_name='V_ELA')
	
	-- ATA 24 : Insert the same lines that exist for ATA XX
	INSERT INTO 
		t_permission_access_attribute (
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode
		)
	SELECT 
		@_roleata24,
		id_infobase,
		'0',
		'1'
	FROM 
		infobase
		INNER join t_permission_access_attribute ON id_infobase=idr_infobase
		INNER join t_user_role ON id_role=idr_user_role
	WHERE 
		table_name='V_ELA'
		and name_role ='EPC ATAXX'
		and write_mode ='1'


END
