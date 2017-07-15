DELETE FROM 
	T_PERMISSION_ACCESS_ATTRIBUTE
WHERE 
	idr_user_role IN (SELECT 
				id_role
			 FROM 
				T_USER_ROLE
			 WHERE 
				name_role LIKE 'EPC%'
  )
  	AND idr_infobase = (SELECT 
				id_infobase
			    FROM 
				InfoBase
			    WHERE 
				object_value = 'PowerCenterType'
				AND table_name='r_fin_ds'
  )



INSERT INTO 
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode
	)
SELECT 
	id_role,
	id_infobase,
	1,
	0
FROM
	infobase,
	t_user_role
WHERE
	name_role = 'EPC Consult'
	AND object_value = 'PowerCenterType'
	AND table_name='r_fin_ds'

INSERT INTO 
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode
	)
SELECT 
	id_role,
	id_infobase,
	1,
	1
FROM
	infobase,
	t_user_role
WHERE
	name_role = 'EPC ATAXX'
	AND object_value = 'PowerCenterType'
	AND table_name='r_fin_ds'


INSERT INTO 
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode
	)
SELECT 
	id_role,
	id_infobase,
	1,
	1
FROM
	infobase,
	t_user_role
WHERE
	name_role = 'EPC ATA24'
	AND object_value = 'PowerCenterType'
	AND table_name='r_fin_ds'




DELETE FROM 
	T_PERMISSION_ACCESS_ATTRIBUTE
WHERE 
	idr_user_role IN (SELECT 
				id_role
			 FROM 
				T_USER_ROLE
			 WHERE 
				name_role LIKE 'EPC%'
  )
  	AND idr_infobase = (SELECT 
				id_infobase
			    FROM 
				InfoBase
			    WHERE 
				object_value = 'AllocatedPhase'
				AND table_name='r_fin_ds'
  )



INSERT INTO 
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode
	)
SELECT 
	id_role,
	id_infobase,
	1,
	0
FROM
	infobase,
	t_user_role
WHERE
	name_role = 'EPC Consult'
	AND object_value = 'AllocatedPhase'
	AND table_name='r_fin_ds'

INSERT INTO 
	T_PERMISSION_ACCESS_ATTRIBUTE (
		idr_user_role,
		idr_infobase,
		read_mode,
		write_mode
	)
SELECT 
	id_role,
	id_infobase,
	1,
	1
FROM
	infobase,
	t_user_role
WHERE
	name_role = 'EPC ATA24'
	AND object_value = 'AllocatedPhase'
	AND table_name='r_fin_ds'


