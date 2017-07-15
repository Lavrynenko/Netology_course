--	Add the attribut in the table
if(
	NOT exists (
		select *
		from syscolumns
		where syscolumns.id = (	select sysobjects.id
								from sysobjects
								where name = 'R_FIN_DS'
							  )
		 and syscolumns.name = 'FINDS_NominalPowerMax'
	)
)
BEGIN
	ALTER TABLE R_FIN_DS ADD FINDS_NominalPowerMax VARCHAR(12) NULL
END



--INSERT INFOBASE
if( not exists(SELECT id_infobase 
		FROM infobase 
		WHERE object_value ='FINDS_NominalPowerMax'
		AND table_name ='R_FIN_DS'))
BEGIN
	--Insert the attribut
	INSERT INTO infobase (object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
			link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory
			) 
	SELECT 
		'Nominal Power Max',
		'FINDS_NominalPowerMax',
		'R_FIN_DS',
		'text',
		'text',
		'0',
		'float',
		null,
		null,
		80,
		null,		
		null,
		null,
		id_attr_group,
		null,
		null,
		null
	FROM 
		t_attr_group
	where 
		label ='Electrical Information'

END