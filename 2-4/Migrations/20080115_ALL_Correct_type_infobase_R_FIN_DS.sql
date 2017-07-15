-- Correct the type declaration in infobase 
UPDATE 
	infobase
SET
	type_val='text'
WHERE
	object_value='Rating'
	AND table_name='R_FIN_DS'