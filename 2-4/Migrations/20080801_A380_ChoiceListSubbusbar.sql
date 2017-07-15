
if not exists (select * from T_CHOICELIST WHERE ChoiceList = 'SubBusBar' and ChoiceValue='435PP')
begin
	INSERT INTO
		
		T_CHOICELIST (ChoiceValue,ChoiceList)
	VALUES
		('435PP','SubBusBar')
end
				


