if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'SYS'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('SYS', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'FUS'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('FUS', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'CAB'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('CAB', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'LGS'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('LGS', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'PWP'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('PWP', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'WNG'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('WNG', 'coe', 0)
end

if(not exists(select * from T_COE_CMIT WHERE coe_cmit_label = 'RFE'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused) VALUES ('RFE', 'coe', 0)
end