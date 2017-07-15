UPDATE
	T_COE_CMIT
SET
	coe_cmit_label = 'DD OAD'
WHERE
	coe_cmit_label = 'OAD'
UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DD OAD'

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'DD PY'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('DD PY', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DD PY'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'DD RTR C'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('DD RTR C', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DD RTR C'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'DD RTR Y'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('DD RTR Y', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DD RTR Y'
end

if(not exists(select * from T_COE_CMIT where coe_cmit_label = 'DD SP_AI'))
begin
	INSERT INTO T_COE_CMIT (coe_cmit_label, coe_cmit_type, coe_cmit_notused)
	VALUES ('DD SP_AI', 'coe', 0)
end
else
begin
	UPDATE T_COE_CMIT SET coe_cmit_type = 'coe' WHERE coe_cmit_label = 'DD SP_AI'
end
