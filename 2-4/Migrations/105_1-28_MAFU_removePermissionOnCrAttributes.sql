-- Delete permission on attributes
-- MSN1
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_GIMSN1'
														AND InfoBase.table_name = 'V_CR')

-- MSN2
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_GIMSN2'
														AND InfoBase.table_name = 'V_CR')

-- MSN3
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_GIMSN3'
														AND InfoBase.table_name = 'V_CR')

-- MSN4
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_GIMSN4'
														AND InfoBase.table_name = 'V_CR')

-- MSN7
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_GIMSN7'
														AND InfoBase.table_name = 'V_CR')

-- Workflow status
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_WFStatus'
														AND InfoBase.table_name = 'V_CR')

-- Implementation in FAL
DELETE FROM T_PERMISSION_ACCESS_ATTRIBUTE
WHERE
	T_PERMISSION_ACCESS_ATTRIBUTE.idr_infobase = (	SELECT id_infobase
													FROM Infobase
													WHERE
														InfoBase.object_value = 'cr_ImplementationInFAL'
														AND InfoBase.table_name = 'V_CR')
