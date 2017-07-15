-- Program A380
-- Update choice list for attribute prs_PRSIndustrialLeader
if(not exists(SELECT * FROM infobase WHERE object_value like 'prs_PRSIndustrialLeader' AND table_name like 'V_PRS' AND list_val like '%Erwan Courtel%'))
begin
	UPDATE infobase SET list_val = list_val + ';Erwan Courtel' WHERE object_value like 'prs_PRSIndustrialLeader' AND table_name like 'V_PRS'
end

-- Insert choice list for attribute prs_PRSPcxqResponsible
if(not exists (SELECT * FROM T_CHOICELIST WHERE (ChoiceList LIKE 'LogisticResponsible') AND (ChoiceValue LIKE '%Pigeard%')))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue) VALUES ('LogisticResponsible', 'Pigeard Patrick')
end

-- Insert choice list for attribute MODMCC
if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'DUCOS Céline'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'DUCOS Céline'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'TREBOSC Jean'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'TREBOSC Jean'
end

if(not exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'VIARD Laurent'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	SELECT 'MODMCC',  'VIARD Laurent'
end