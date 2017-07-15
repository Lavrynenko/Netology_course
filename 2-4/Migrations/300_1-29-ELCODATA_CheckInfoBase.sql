											--------------------
											-- CHECK INFOBASE --
											--------------------

---------------------------------------------
-- A380 ==> A350                           --											
---------------------------------------------
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Spare',
		'Spare',
		'R_FIN_DS',
		'listv',
		'listv',
		'0',
		'text',
		NULL,
		NULL,
		'16',
		'Spare',
		'Yes;No',
		NULL,
		NULL,
		NULL,
		NULL,		
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Supplier coordination responsibility',
		'SupplierCoordResp',
		'R_FIN_DS',
		'listv',
		'listv',
		'0',
		'text',
		NULL,
		NULL,
		'100',
		NULL,
		'Workshop (logistique atelier) / "Assistance Technique";PCAQ;PCDQ;PCUK;BNMC',
		NULL,
		NULL,
		NULL,
		NULL,		
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Access door',
		'AccessDoor',
		'R_FIN_CI',
		'area',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'50',
		NULL,
		NULL,
		'1',
		NULL,
		NULL,
		NULL,
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('BITE system',
		'BITESystem',
		'R_FIN_CI',
		'area',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'50',
		NULL,
		NULL,
		'1',
		NULL,
		NULL,
		NULL,
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Quantity of load',
		'QuantityOfLoad',
		'R_FIN_DS',
		'area',
		'text',
		'0',
		'int',
		NULL,
		NULL,
		'15',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Def Resp Nat Co',
		'DEFRESPNATCO',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Delivery Site',
		'DELIVERYSITE',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Provisioning Site',
		'PROVISIONINGSITE',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Design Focal Point',
		'DESIGNFOCALPOINT',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Responsibility',
		'FINRESPONSIBILITY',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Installation site',
		'INSTALLATIONSITE',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Rank from',
		'RANKFROM',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Rank to',
		'RANKTO',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('STDSiglum',
		'STDSIGLUM',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('MSN',
		'MSNEFFRANGE',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('OBS',
		'OBS',
		'T_Responsibility',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'150',
		NULL,
		'',
		NULL,
		'176',
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Supplier (fscm)',
		'Supplier',
		'R_EQUIPMENT',
		'listv',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		'SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = ''Supplier (fscm)''',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('FTI Type',
		'FTIType',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Vendor Model Number',
		'VendorModelNumber',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Frontier Interface',
		'FrontierInterface',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		'8',
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Technical Validation',
		'TechnicalValidation',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('FTI Number',
		'FTINumber',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Pn (W or VA)',
		'PnWVA',
		'R_EQUIPMENT',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Power Factor',
		'PowerFactor',
		'R_EQUIPMENT',
		'float',
		'float',
		'0',
		'float',
		NULL,
		NULL,
		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('exception',
		'crEA_exception',
		'V_CR_EXPECTED_APPLICABILITY',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'1',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'0'
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('Standard',
		'EquipStandard',
		'R_equipment',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'4',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)
INSERT INTO infobase (
		object_name,object_value,table_name,type_search,type_edit,reduced_view,type_val,link_page,
		link_val,object_order,object_infos,list_val,info_ext,idr_group,linked_page,repository,mandatory) 
	VALUES ('For Ground Use Only',
		'EquipGroupUseOnly',
		'R_equipment',
		'text',
		'text',
		'0',
		'text',
		NULL,
		NULL,
		'14',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	)


---------------------------------------------
-- A380 ==> A400M                          --											
---------------------------------------------
--- No delta 
	