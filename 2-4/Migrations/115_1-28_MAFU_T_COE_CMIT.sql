if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'OAD'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('OAD', 'cmit', 0)
end