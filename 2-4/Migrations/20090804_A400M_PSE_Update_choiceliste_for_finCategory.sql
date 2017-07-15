DECLARE @ChoiceList varchar(255),
	@choicevalue_old varchar(255),
	@choicevalue_new varchar(255)

--------------------------------------------------------------------
-- UPDATE T_CHOICELIST for ATTRIBUTE FINCategory (incident: 4426594)
--------------------------------------------------------------------	
SET @ChoiceList='FINCategory'
SET @choicevalue_old='LRU SOFTWARE IN A SUBCONTRACTED CA'
SET @choicevalue_new='LRU SW IN A SUBCONTRACTED CA'

update T_CHOICELIST
set choicevalue = @choicevalue_new
where ChoiceList = @ChoiceList
and choicevalue like @choicevalue_old