UPDATE
	infobase
SET 
	object_name=object_name+' (OLD)'
WHERE
	object_value IN ('PCDCont1Con','PCDCont1Pin','PCDStatCon','PCDStatPin')