if(exists(SELECT *
FROM T_CHOICELIST
WHERE ChoiceList = 'MODMCC'
 AND ChoiceValue = 'DUCOS Céline'))
begin
	UPDATE T_CHOICELIST SET ChoiceValue = 'DUCOS Celine' WHERE ChoiceList = 'MODMCC' AND ChoiceValue = 'DUCOS Céline'
end
