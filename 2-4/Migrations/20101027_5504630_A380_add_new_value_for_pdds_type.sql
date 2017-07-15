-- incident 5504630 : add value for pdds type

--UPDATE INFOBASE
IF( EXISTS(SELECT id_infobase FROM infobase WHERE object_value ='pdds_type' AND table_name ='T_PDDS'))
BEGIN
	--Update the attribute
	UPDATE infobase SET list_val ='PD;EPD;WD;PPD;PPD_800F;PPD_I/F;FD', type_search='listv', type_edit='listv', type_val='text'   WHERE object_value='pdds_type' AND table_name='T_PDDS'
END


