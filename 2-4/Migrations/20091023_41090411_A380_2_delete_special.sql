DELETE FROM
	R_FIN_DS
WHERE
	fin_ds_sv like '%L 228RH28     -001%'
	and idr_fin is not null
	
		
DELETE FROM
	R_FIN_DS
WHERE
	fin_ds_sv like '%L 311DW       -001%'
	
	

UPDATE
	R_FIN_DS
SET
	idr_fin=id_fin
FROM 
	R_FIN_CI
WHERE
	fin_ds_sv like '%L 402DU       -002%'
	AND FIN='402DU'


DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  19MJ      1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  19MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  19MJ      1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  19MJ     1 ')

DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-003' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-004' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-005' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-006' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-010' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-009' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-012' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-008' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-011' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-007' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-013' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-014' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  20MJ      1-015' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  20MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  21MJ      1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  21MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  21MJ      1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  21MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  22MJ      1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  22MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  22MJ      1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  22MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  23MJ      1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  23MJ     1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  23MJ      1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  23MJ     1 ')

DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ31    1-004' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ31   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ31    1-005' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ31   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ33    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ33   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ34    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ34   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ35    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ35   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ37    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ37   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ38    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ38   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ39    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ39   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ41    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ41   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ41    1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ41   1 ')

DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  74MJ22    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  74MJ22   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  74MJ22    1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  74MJ22   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  74MJ22    1-003' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  74MJ22   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ21    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ21   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ21    1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ21   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ21    1-003' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ21   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ22    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ22   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ22    1-002' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ22   1 ')
DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  75MJ22    1-003' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  75MJ22   1 ')

DELETE FROM R_FIN_DS WHERE fin_ds_sv='L  56MJ32    1-001' AND idr_fin IN (SELECT id_fin FROM R_FIN_CI WHERE fin_ci_sv='L  56MJ32   1 ')





	


