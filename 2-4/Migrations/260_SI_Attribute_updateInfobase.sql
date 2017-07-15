------------------------------------------------------------------------------------
---------------------------------------- SI ----------------------------------------
------------------------------------------------------------------------------------


-- SI State


UPDATE infobase 
	SET 
		type_search = 'listv',
		type_edit = 'listv',
		type_val = 'text',
		list_val = 'Aborted;Cancelled;Draft;To be Cancelled;Validated;WIP'
			where object_value = 'LifeCycleState' AND table_name = 'T_SI'
			

