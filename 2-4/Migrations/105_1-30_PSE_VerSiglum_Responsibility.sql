--------------------------------------------
-- Add the columns in T_RESPONSIBILTY
-------------------------------------------
if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'T_RESPONSIBILITY'
						  )
	 and syscolumns.name = 'VERSIGLUM'
	)
)
BEGIN
	ALTER TABLE dbo.T_RESPONSIBILITY ADD VERSIGLUM varchar(10) NULL
END

------------------------------------------
-- Update the 4 views
------------------------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Definition_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Definition_responsibility]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/* Create the view*/
CREATE VIEW dbo.V_Definition_responsibility
AS
SELECT     id_responsibility, idr_fin, DEFRESPNATCO AS def_DefRespNatco, DESIGNFOCALPOINT AS def_DesignFocalPoint, OBS AS def_OBS, 
                      RANKFROM AS def_RankFrom, RANKTO AS def_RankTo, STDSIGLUM AS def_StdSiglum, Resp_ConfigSet AS def_ConfigSet, 
                      MSNEFFRANGE AS def_Msn, NAME AS def_name, reasonforchange AS def_reasonforchange, SVMAJ_Resp AS def_SVMAJ_Resp, 
                      DataOrigin AS def_DataOrigin, VERSIGLUM AS def_VerSiglum
FROM         dbo.T_Responsibility
WHERE     (FINRESPONSIBILITY LIKE 'Definition')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


----------------------------------------


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Installation_Design_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Installation_Design_responsibility]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/* Create the view*/
CREATE VIEW dbo.V_Installation_Design_responsibility
AS
SELECT     id_responsibility, idr_fin, DELIVERYSITE AS des_DeliverySite, OBS AS des_OBS, RANKFROM AS des_RankFrom, RANKTO AS des_RankTo, 
                      STDSIGLUM AS des_StdSiglum, Resp_ConfigSet AS des_ConfigSet, MSNEFFRANGE AS des_Msn, NAME AS des_name, 
                      reasonforchange AS des_reasonforchange, SVMAJ_Resp AS des_SVMAJ_Resp, DataOrigin AS des_DataOrigin, VERSIGLUM AS des_VerSiglum
FROM         dbo.T_Responsibility
WHERE     (FINRESPONSIBILITY LIKE 'Delivery')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



----------------------------------------------



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Installation_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Installation_responsibility]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/* Create the view*/
CREATE VIEW dbo.V_Installation_responsibility
AS
SELECT     id_responsibility, idr_fin, INSTALLATIONSITE AS ins_InstallationSite, FINRESPONSIBILITY AS ins_FinResponsibility, RANKFROM AS ins_RankFrom, 
                      RANKTO AS ins_RankTo, STDSIGLUM AS ins_StdSiglum, Resp_ConfigSet AS ins_ConfigSet, MSNEFFRANGE AS ins_Msn, 
                      MANUFACTURING AS ins_manufacturing, NAME AS ins_name, reasonforchange AS ins_reasonforchange, SVMAJ_Resp AS ins_SVMAJ_Resp, 
                      DataOrigin AS ins_DataOrigin, VERSIGLUM AS ins_VerSiglum
FROM         dbo.T_Responsibility
WHERE     (FINRESPONSIBILITY LIKE 'Installation')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


--------------------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[V_Provisioning_responsibility]') and OBJECTPROPERTY(id, N'IsView') = 1)
drop view [dbo].[V_Provisioning_responsibility]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

/* Create the view*/
CREATE VIEW dbo.V_Provisioning_responsibility
AS
SELECT     id_responsibility, idr_fin, PROVISIONINGSITE AS prov_ProvisioningSite, FINRESPONSIBILITY AS prov_FinResponsibility, 
                      RANKFROM AS prov_RankFrom, RANKTO AS prov_RankTo, STDSIGLUM AS prov_StdSiglum, Resp_ConfigSet AS prov_ConfigSet, 
                      MSNEFFRANGE AS prov_Msn, NAME AS prov_name, reasonforchange AS prov_reasonforchange, SVMAJ_Resp AS prov_SVMAJ_Resp, 
                      DataOrigin AS prov_DataOrigin, VERSIGLUM AS prov_VerSiglum
FROM         dbo.T_Responsibility
WHERE     (FINRESPONSIBILITY LIKE 'Provisioning')

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


--------------------------------------------------------------------------------
-- Add the lines in infobase and the right in permission_access_attribute.
-- the rights and properties are the same than STDSIGLUM
--------------------------------------------------------------------------------


if not exists (
	select * from infobase
	where object_value='VERSIGLUM'
	AND table_name='T_Responsibility'
)
BEGIN
	INSERT INTO 
		infobase
	 (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
		)
	SELECT 
		'VerSiglum',
		'VERSIGLUM',
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
	FROM 
		infobase
	WHERE
		object_value='STDSIGLUM'
		AND table_name='T_Responsibility'

	INSERT INTO
		T_PERMISSION_ACCESS_ATTRIBUTE 
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode,
			fast_search
		)
	SELECT 
		idr_user_role,
		@@IDENTITY,
		read_mode,
		write_mode,
		fast_search
	FROM
		infobase
		INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	WHERE
		object_value='STDSIGLUM'
		AND table_name='T_Responsibility'
	
	
END

if not exists (
	select * from infobase
	where object_value='def_VerSiglum'
	AND table_name='V_Definition_responsibility'
)
BEGIN
	INSERT INTO 
		infobase
	 (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
		)
	SELECT 
		'Def. VerSiglum',
		'def_VerSiglum',
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
	FROM 
		infobase
	WHERE
		object_value='def_StdSiglum'
		AND table_name='V_Definition_responsibility'



	INSERT INTO
		T_PERMISSION_ACCESS_ATTRIBUTE 
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode,
			fast_search
		)
	SELECT 
		idr_user_role,
		@@IDENTITY,
		read_mode,
		write_mode,
		fast_search
	FROM
		infobase
		INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	WHERE
		object_value='def_StdSiglum'
		AND table_name='V_Definition_responsibility'
END

if not exists (
	select * from infobase
	where object_value='des_VerSiglum'
	AND table_name='V_Installation_Design_responsibility'
)
BEGIN
	INSERT INTO 
		infobase
	 (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
		)
	SELECT 
		'Inst. Des. VerSiglum',
		'des_VerSiglum',
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
	FROM 
		infobase
	WHERE
		object_value='des_StdSiglum'
		AND table_name='V_Installation_Design_responsibility'



	INSERT INTO
		T_PERMISSION_ACCESS_ATTRIBUTE 
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode,
			fast_search
		)
	SELECT 
		idr_user_role,
		@@IDENTITY,
		read_mode,
		write_mode,
		fast_search
	FROM
		infobase
		INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	WHERE
		object_value='des_StdSiglum'
		AND table_name='V_Installation_Design_responsibility'
END

if not exists (
	select * from infobase
	where object_value='ins_VerSiglum'
	AND table_name='V_Installation_responsibility'
)
BEGIN
	INSERT INTO 
		infobase
	 (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
		)
	SELECT 
		'Inst. VerSiglum',
		'ins_VerSiglum',
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
	FROM 
		infobase
	WHERE
		object_value='ins_StdSiglum'
		AND table_name='V_Installation_responsibility'


	INSERT INTO
		T_PERMISSION_ACCESS_ATTRIBUTE 
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode,
			fast_search
		)
	SELECT 
		idr_user_role,
		@@IDENTITY,
		read_mode,
		write_mode,
		fast_search
	FROM
		infobase
		INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	WHERE
		object_value='ins_StdSiglum'
		AND table_name='V_Installation_responsibility'
END


if not exists (
	select * from infobase
	where object_name='prov_VerSiglum'
	AND table_name='V_Provisioning_responsibility'
)
BEGIN
	INSERT INTO 
		infobase
	 (
		object_name,
		object_value,
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
		)
	SELECT 
		'Prov. VerSiglum',
		'prov_VerSiglum',
		table_name,
		type_search,
		type_edit,
		reduced_view,
		type_val,
		link_page,
		link_val,
		object_order,
		object_infos,
		list_val,
		info_ext,
		idr_group,
		linked_page,
		repository,
		mandatory
	FROM 
		infobase
	WHERE
		object_value='prov_StdSiglum'
		AND table_name='V_Provisioning_responsibility'

	INSERT INTO
		T_PERMISSION_ACCESS_ATTRIBUTE 
		(
			idr_user_role,
			idr_infobase,
			read_mode,
			write_mode,
			fast_search
		)
	SELECT 
		idr_user_role,
		@@IDENTITY,
		read_mode,
		write_mode,
		fast_search
	FROM
		infobase
		INNER JOIN T_PERMISSION_ACCESS_ATTRIBUTE ON idr_infobase=id_infobase
	WHERE
		object_value='prov_StdSiglum'
		AND table_name='V_Provisioning_responsibility'
END

-----------------------------------------------

UPDATE
	infobase
SET	
	list_val=REPLACE(list_val,'StdSiglum','VerSiglum')
WHERE
	 object_value IN ('def_VerSiglum','des_VerSiglum','ins_VerSiglum','prov_VerSiglum')


-----------------------------------------------


UPDATE
	T_TEMPLATE
SET
	template_SQL=REPLACE(template_SQL, 'STDSIGLUM as [STDSiglum],','STDSIGLUM as [STDSiglum], VERSIGLUM as [VerSiglum],')
	
WHERE
	template_label IN ('DEFINITION_RESP','Design_RESP','Install_RESP','Provis_RESP')


UPDATE
	T_TEMPLATE
SET
	template_SQL=REPLACE(template_SQL, 'STDSIGLUM as STDSiglum,','STDSIGLUM as STDSiglum, VERSIGLUM as [VerSiglum],')
	
WHERE
	template_label IN ('DEFINITION_RESP','Design_RESP','Install_RESP','Provis_RESP')
	
---------------------------------------
-- re-order the attributes


update
	infobase
set
	object_order=5
where
	object_value like '%_DefRespNatco'
	and table_name like '%responsibi%'


update
	infobase
set
	object_order=10
where
	object_value like '%_DesignFocalPoint'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=15
where
	object_value like '%_OBS'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=20
where
	object_value like '%_RankFrom'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=25
where
	object_value like '%_RankTo'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=30
where
	object_value like '%_StdSiglum'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=35
where
	object_value like '%_VerSiglum'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=40
where
	object_value like '%_ConfigSet'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=45
where
	object_value like '%_MSN'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=50
where
	object_value like '%_name'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=55
where
	object_value like '%_reasonforchange'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=60
where
	object_value like '%_SVMAJ_Resp'
	and table_name like '%responsibi%'
update
	infobase
set
	object_order=65
where
	object_value like '%_DataOrigin'
	and table_name like '%responsibi%'

	
	