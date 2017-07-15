----------------------------------------------------------------
-- FIN Configuration Reported (BITEConfReport)
----------------------------------------------------------------
-- Software by dataloading

	declare
		@idr_group int,
		@object_order int
		
	set @idr_group = (select top 1 idr_group from T_attr_group,infobase where T_attr_group.label = 'main' and infobase.table_name = 'R_FIN_CI' and T_attr_group.id_attr_group = infobase.idr_group)
	set @object_order = (select object_order from infobase where table_name = 'R_FIN_CI'  and object_value like 'TypeOfEquipment') + 1 

	select @idr_group
	select @object_order


	if(not exists(select * from infobase where object_value = 'BITEConfReport' and table_name = 'R_FIN_CI'))
	begin
		print 'BITEConfReport is not existing in Infobase.'
	end
	else
	begin
		UPDATE infobase set idr_group = @idr_group, object_order=@object_order  WHERE object_value = 'BITEConfReport' and table_name = 'R_FIN_CI'
	end
	
