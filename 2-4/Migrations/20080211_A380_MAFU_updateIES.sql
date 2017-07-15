-- Corresponding Fleet for 1st MSN to embody with/without OSW
if(not exists(select * from T_CHOICELIST where ChoiceList = 'VersionRank' AND ChoiceValue = 'SIA02-001'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	VALUES ('VersionRank', 'SIA02-001')
end

if(not exists(select * from T_CHOICELIST where ChoiceList = 'VersionRank' AND ChoiceValue = 'AFR01-006'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	VALUES ('VersionRank', 'AFR01-006')
end

if(not exists(select * from T_CHOICELIST where ChoiceList = 'VersionRank' AND ChoiceValue = 'KFR01-001'))
begin
	INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue)
	VALUES ('VersionRank', 'KFR01-001')
end