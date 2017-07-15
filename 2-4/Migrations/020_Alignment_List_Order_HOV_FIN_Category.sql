update InfoBase set list_val = 'SELECT ChoiceValue FROM t_choicelist WHERE ChoiceList = ''Fincategory''  ORDER BY ChoiceValue' 
where object_value = 'ins_HoVFINCategory'