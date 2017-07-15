-- ******************************************************************************
-- Name : 305_1-27_ELCODATA_FINDS_groups_update_display_order.sql
-- Date : 14/08/2008
-- Spec : 
-- Update display orders of FIN DS groups
-- ******************************************************************************

-- MAIN
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 1 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'MAIN'
	)

-- PROVISIONING DATA
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 5 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'PROVISIONING DATA'
	)

-- INSTALLATION DATA
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 10 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'INSTALLATION DATA'
	)

-- SPECIFIED DATA
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 15 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'SPECIFIED DATA'
	)

-- Protection Commutation Device
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 20 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Protection Commutation Device'
	)

-- Information About SEPDC SSPC status
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 25 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information About SEPDC SSPC status'
	)

-- Information about EEPDC
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 30 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about EEPDC'
	)

-- DEVELOPMENT
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 35 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'DEVELOPMENT'
	)

-- Configuration Management
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 40 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Configuration Management'
	)

-- Electrical distribution
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 45 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Electrical distribution'
	)

-- Load
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 50 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Load'
	)

-- PROCUREMENT
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 55 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'PROCUREMENT'
	)

-- ELECTRICAL
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 60 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'ELECTRICAL'
	)

-- PCD Status Monitoring
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 65 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'PCD Status Monitoring'
	)


-- Information about PCD Command
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 70 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about PCD Command'
	)

-- ELMF
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 75 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'ELMF'
	)

-- Information About SEPDC SSPC command
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 80 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information About SEPDC SSPC command'
	)

-- SSPC
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 85 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'SSPC'
	)

-- PCD Common Wiring interfaces definition
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 90 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'PCD Common Wiring interfaces definition'
	)

-- RCCB
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 95 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'RCCB'
	)

-- CB
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 100 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'CB'
	)

-- WEIGHT DATA
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 105 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'WEIGHT DATA'
	)

-- Information about PEPDC
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 110 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about PEPDC'
	)

-- Specific FIN SI
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 115 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Specific FIN SI'
	)

-- HISTORY
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 120 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'HISTORY'
	)

-- EDD Maturity Status
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 125 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'EDD Maturity Status'
	)

-- ELA Enveloppe
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 130 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'ELA Enveloppe'
	)

-- General Information about PCD
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 135 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'General Information about PCD'
	)

-- General Information about supplied equipment
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 140 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'General Information about supplied equipment'
	)

-- Information about PCDs monitoring and shedding
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 145 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about PCDs monitoring and shedding'
	)

-- EPCs Wiring Output
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 150 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'EPCs Wiring Output'
	)

-- Information about SSPC
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 155 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about SSPC'
	)

-- Information about RCCB
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 160 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about RCCB'
	)

-- Information about CB
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 165 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about CB'
	)

-- Information about EEPDC RCCB
UPDATE 
	T_ATTR_GROUP 
SET 
	display_order = 170 
WHERE 
	id_attr_group = (
		SELECT 
			id_attr_group
		FROM 
			T_ATTR_GROUP 
			INNER JOIN T_LINK_ATTRGROUP_OBJECT ON T_ATTR_GROUP.id_attr_group = T_LINK_ATTRGROUP_OBJECT.idr_attr_group 
			INNER JOIN T_OBJECT ON T_LINK_ATTRGROUP_OBJECT.idr_object = T_OBJECT.id_object
		WHERE 
			T_OBJECT.table_primary_key = 'R_FIN_DS' 
			AND T_ATTR_GROUP.label = 'Information about EEPDC RCCB'
	)
