-- ******************************************************************************
-- Name : 105_1-28_MAFU_Update_Groups.sql
-- Date : 08/09/2008
-- Spec : MAFU_V1.XX_synthesis_sheet_Mafu_A350_attributes.doc
-- Update attribute groups labels and display orders
-- ******************************************************************************

DECLARE 
	@table_name VARCHAR(255), 
	@old_group_label VARCHAR(255), 
	@new_group_label VARCHAR(255)

------------
---- CR ----
------------

-- group PD -> IMPACTS
SET @table_name = 'V_CR'
SET @old_group_label = 'PD'
SET @new_group_label = 'IMPACTS'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'EVALUATION') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'IMPACTS') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 99 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'HISTORY') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


-------------
---- RFC ----
-------------

-- group PD -> IMPACTS
SET @table_name = 'V_RFC'
SET @old_group_label = 'PD'
SET @new_group_label = 'IMPACTS'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'EVALUATION') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'IMPACTS') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 99 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'HISTORY') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


------------
---- MP ----
------------

SET @table_name = 'T_MP'

---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'INVESTIGATION') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'IMPLEMENTATION') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 99 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'HISTORY') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


-------------
---- MOD ----
-------------

SET @table_name = 'T_MOD'

---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'DELIVERABLE TD') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Certification') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 15 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Certification German Part') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 20 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MOD CLOSURE STAGE 3') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


--------------------------------
---- INVOLVED TEAMS REQUEST ----
--------------------------------

-- group CoE/CMIT involved into Request -> PDT/COE involved (Request)
SET @table_name = 'T_INVOLVED_TEAM_REQ'
SET @old_group_label = 'CoE/CMIT involved into Request'
SET @new_group_label = 'PDT/COE involved (Request)'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


-- group TRS of RFC -> Sub-TRS of RFC
SET @table_name = 'T_INVOLVED_TEAM_REQ'
SET @old_group_label = 'TRS of RFC'
SET @new_group_label = 'Sub-TRS of RFC'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'PDT/COE involved (Request)') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Sub-TRS of RFC') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


---------------------------
---- INVOLVED TEAMS MP ----
---------------------------

-- group CoE/CMIT involved into MP -> PDT/COE involved (MP)
SET @table_name = 'T_INVOLVED_TEAM_MP'
SET @old_group_label = 'CoE/CMIT involved into MP'
SET @new_group_label = 'PDT/COE involved (MP)'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


-- group Deliverable TRS -> Sub-TRS of MP
SET @table_name = 'T_INVOLVED_TEAM_MP'
SET @old_group_label = 'Deliverable TRS'
SET @new_group_label = 'Sub-TRS of MP'

IF NOT EXISTS (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = @new_group_label) 
			AND (T_OBJECT.table_primary_key = @table_name)
) 
BEGIN 
	UPDATE 
		T_ATTR_GROUP 
	SET 
		label = @new_group_label 
	WHERE 
		id_attr_group = (
			SELECT 
				T_ATTR_GROUP.id_attr_group 
			FROM 
				T_ATTR_GROUP 
				INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
				INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
			WHERE 
				(T_ATTR_GROUP.label = @old_group_label) 
				AND (T_OBJECT.table_primary_key = @table_name)
		)
END


---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'PDT/COE involved (MP)') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Sub-TRS of MP') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Mod Closure Stage 0 by Team') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 15 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'Mod Closure Stage 3 by Team') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


-----------------
---- DELTA 1 ----
-----------------

SET @table_name = 'T_DELTA1_FOLLOWUP'

---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'IMPACTED FINs') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'ANALYSIS') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


-----------------------------
---- MOD CLOSURE STAGE 0 ----
-----------------------------

SET @table_name = 'V_MOD_CLOSURE_STAGE0'

---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'SYSTEMS PART') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'INVOLVED PART') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)


-----------------------------
---- MOD CLOSURE STAGE 3 ----
-----------------------------

SET @table_name = 'V_MOD_CLOSURE_STAGE3'

---- Reorder groups ----

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'MAIN') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'SYSTEMS PART') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)

UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			T_ATTR_GROUP.id_attr_group 
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object 
		WHERE 
			(T_ATTR_GROUP.label = 'INVOLVED PART') 
			AND (T_OBJECT.table_primary_key = @table_name)
	)
