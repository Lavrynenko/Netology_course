------------------------------------------------------------------------------------
---------------------------------------- R_FIN_DS ---------------------------------
------------------------------------------------------------------------------------


-------- Add COlumn  ICDTreatmentNumberTxt
IF(
	NOT EXISTS (
		SELECT *
		FROM syscolumns
		WHERE syscolumns.id = (	SELECT sysobjects.id
								FROM sysobjects
								WHERE name = 'R_FIN_DS'
							  )
		 AND syscolumns.name = 'ICDTreatmentNumberTxt'
	)
)
	BEGIN
		--Add the column
		ALTER TABLE R_FIN_DS ADD [ICDTreatmentNumberTxt] varchar(50) NULL
	END
ELSE
	BEGIN
		PRINT 'Column ICDTreatmentNumberTxt is already exist in R_FIN_DS'
	END


------------------------------------------------------------------------------------
-- ICDTreatmentNumberTxt
------------------------------------------------------------------------------------

IF(NOT EXISTS(SELECT * FROM infobase WHERE object_value = 'ICDTreatmentNumberTxt' AND table_name = 'R_FIN_DS'))
	BEGIN
		INSERT INTO infobase 
		(
			object_name, 
			object_value, 
			table_name, 
			type_search, 
			type_edit, 
			reduced_view, 
			type_val, 
			link_page, 
			link_val, 
			object_order, 
			object_infos, 
			list_val, 
			info_ext, 
			idr_group, 
			linked_page, 
			repository, 
			mandatory,
			changeChoicelist
		)
		SELECT
			'ICD Treatment reference',
			'ICDTreatmentNumberTxt',
			'R_FIN_DS',
			'text',
			'text',
			0,
			'text',
			NULL,
			NULL, 
			(select object_order from infobase WHERE object_value = 'ICDTreatmentNumber' AND table_name = 'R_FIN_DS' ),
			'ICD Treatment reference',
			NULL,
			NULL,
			(
				SELECT T_ATTR_GROUP.id_attr_group 
				FROM T_ATTR_GROUP
				 INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group
				 INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
				WHERE (T_ATTR_GROUP.label = 'PCD Command') AND (T_OBJECT.table_primary_key = 'R_FIN_DS')
			),
			NULL,
			NULL,
			0,
			0
	END
ELSE
	BEGIN
		PRINT 'ICDTreatmentNumberTxt is already created in Infobase.'
	END



