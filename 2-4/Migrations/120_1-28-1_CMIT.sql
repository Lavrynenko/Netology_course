DELETE FROM T_COE_CMIT

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'OAD'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('OAD', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'OAD'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'SYS'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('SYS', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'SYS'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'WNG'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('WNG', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'WNG'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'FWD'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('FWD', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'FWD'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'AFT'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('AFT', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'AFT'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'NOF'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('NOF', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'NOF'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'DOR'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('DOR', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DOR'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'CEF'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('CEF', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'CEF'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'CCC'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('CCC', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'CCC'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'RFE'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('RFE', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'RFE'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'FAL'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('FAL', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'FAL'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'FTI'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('FTI', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'FTI'
end