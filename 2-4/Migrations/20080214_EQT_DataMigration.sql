UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'PSEQ'
FROM
	R_EQUIPMENT
	JOIN (SELECT CMS FROM tmpsv_PN) AS PN ON PN.CMS = R_EQUIPMENT.CMS

UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'PSEQ'
FROM
	R_EQUIPMENT
	JOIN (SELECT BNAME FROM tmpsv_STANDARDPART) AS STANDARD_PART ON STANDARD_PART.BNAME = R_EQUIPMENT.CMS

UPDATE R_EQUIPMENT SET
	SVMAJ_EQT = 'CIRCE'
FROM
	R_EQUIPMENT
	JOIN TMP_CIRCEDEFINITION ON TMP_CIRCEDEFINITION.Col007 = R_EQUIPMENT.CMS

UPDATE R_Equipment SET
	R_Equipment.eqt_Category = 'Equipment',
	R_Equipment.PN = tmpsv_PN.PARTNUMBER,
	R_Equipment.idr_supplier = R_Supplier.id_supplier,
	R_Equipment.EquipmentDesignation = tmpsv_PN.EQUIPMENTDESIGNATION,
	R_Equipment.EquipmentType = DS.TYPEEQ,
	R_Equipment.EquipmentLoadable = DS.LOADINGTYPE,
	R_Equipment.DAL = tmpsv_PN.DAL,
	R_Equipment.eqpt_status = tmpsv_PN.STATESTATE,
	R_Equipment.AC_ICD_folderVersion = AC_ICDfolderVersion,
	R_Equipment.VendorDesignation = tmpsv_PN.VENDORDESIGNATION,
	R_EQUIPMENT.EqptStdVendorDesign = tmpsv_PN.STANDARD,
	R_Equipment.ModelRequired = tmpsv_PN.MODELREQUIRED,
	R_Equipment.DDP = tmpsv_PN.DDPREF,
	R_Equipment.DDPDocumentationIssue = tmpsv_PN.DDPISSUE,
	R_Equipment.PTS = tmpsv_PN.PTSREF,
	R_Equipment.PNCreationDate = tmpsv_PN.CREATESTAMPA2,
	R_Equipment.PNUpdateDate = tmpsv_PN.MODIFYSTAMPA2,
	R_Equipment.EqtVersion = tmpsv_PN.VALUEA2B2VERSIONINFO,
	R_Equipment.Supplier = tmpsv_PN.FSCM,
	R_Equipment.SupplierTechnologicalDesignation = tmpsv_PN.EQUIPMENTDESIGNATION,
	R_Equipment.Standard = tmpsv_PN.STANDARD,
	R_Equipment.FTIType = tmpsv_PN.FTITYPE,
	R_Equipment.VendorModelNumber = tmpsv_PN.VENDORMODELNUMBER,
	R_Equipment.FrontierInterface = tmpsv_PN.FRONTIERINTERFACE,
	R_Equipment.TechnicalValidation = tmpsv_PN.TECHNICALVALIDATION,
	R_Equipment.FTINumber = tmpsv_PN.FTINUMBER,
	R_Equipment.PnWVA = tmpsv_PN.PN,
	R_Equipment.ForGroundUseOnly = tmpsv_PN.VALIDFORGROUNDTESTS,
	R_Equipment.PINCode = tmpsv_PN.INDEXPINCODE,
	R_Equipment.HydraulicInterface = tmpsv_PN.HYDRAULICINTERFACE,
	R_Equipment.ElectricalInterface = tmpsv_PN.ELECINTERFACE,
	R_Equipment.AdfxInterface = tmpsv_PN.ADFXINTERFACE,
	R_Equipment.ARINC429Interface = tmpsv_PN.ARINC429INTERFACE,
	R_Equipment.CanInterface = tmpsv_PN.CAN,
	R_Equipment.PowerSupplyInterface = tmpsv_PN.POWSUPPINTERFACE,
	R_Equipment.SpecifiedThermalDissipation = tmpsv_PN.SPECIFIEDTHERMALDISSIPATION,
	R_Equipment.SpecifiedThermalDissipationUnit = tmpsv_PN.SPECIFIEDTHERMALDISSIPATIONU,
	R_Equipment.SpecifiedComsumption = tmpsv_PN.SPECIFIEDCONSUMPTION,
	R_Equipment.SpecifiedComsumptionUnit = tmpsv_PN.SPECIFIEDCONSUMPTIONUNIT,
	R_Equipment.SpecifiedAirPressDrop = tmpsv_PN.SPECIFIEDAIRPRESSDROP,
	R_Equipment.SpecifiedAirPressDropUnit = tmpsv_PN.SPECIFIEDAIRPRESSDROPUNIT,
	R_Equipment.PTSDocumentationIssue = tmpsv_PN.PTSISSUE,
	R_Equipment.EDESDocumentationReference = tmpsv_PN.EDESREF,
	R_Equipment.EDESDocumentationIssue = tmpsv_PN.EDESISSUE,
	R_Equipment.ActualThermalDissipation = tmpsv_PN.ACTUALTHERMALDISSIPATION,
	R_Equipment.ActualThermalDissipationUnit = tmpsv_PN.ACTUALTHERMALDISSIPATIONUNIT,
	R_Equipment.LifeOperatingHours = tmpsv_PN.LIFEOPERHOURS,
	R_Equipment.LifeOperatingHoursUnit = tmpsv_PN.LIFEOPERHOURSUNIT,
	R_Equipment.StorageLifeLimitation = tmpsv_PN.STORAGELIFELIMIT,
	R_Equipment.StorageLifeLimitationUnit = tmpsv_PN.STORAGELIFELIMITUNIT,
	R_Equipment.ActualComsumption = tmpsv_PN.ACTUALCONSUMPTION,
	R_Equipment.ActualComsumptionUnit = tmpsv_PN.ACTUALCONSUMPTIONUNIT,
	R_Equipment.EstimatedWeight = tmpsv_PN.ESTIMATEDWEIGHTGRAMMES,
	R_Equipment.RFIRFPPTSGuaranteedWeight = tmpsv_PN.GUARANTEEDWEIGHTGRAMMES,
	R_Equipment.AcceptanceSheetWeighedWeight = tmpsv_PN.WEIGHTWEIGHTGRAMMES,
	R_Equipment.WeighedWeightDate = tmpsv_PN.WEIGHTWEIGHTDATE,
	R_Equipment.WeighedWeightLocation = tmpsv_PN.WEIGHTWEIGHTPLACE,
	R_Equipment.CalculatedWeight = tmpsv_PN.CALCULATEDWEIGHT,
	R_Equipment.AcceptableTargetWeight = tmpsv_PN.ACCEPTABLETARGETWEIGHT,
	R_Equipment.PackageOverallLenght = tmpsv_PN.PACKAGEOVERALLLENGTH,
	R_Equipment.LenghtUnit = tmpsv_PN.LENGTHUNIT,
	R_Equipment.PackageOverallWidth = tmpsv_PN.PACKAGEOVERALLWIDTH,
	R_Equipment.WidthUnit = tmpsv_PN.WIDTHUNIT,
	R_Equipment.PackageOverallHeight = tmpsv_PN.PACKAGEOVERALLHEIGHT,
	R_Equipment.HeightUnit = tmpsv_PN.HEIGHTUNIT,
	R_Equipment.StdTechDescriptionKeyword = tmpsv_PN.STDTECHDESCRIPTIONKEYWORD,
	R_Equipment.StdTechDescription = tmpsv_PN.STDTECHDESCRIPTION,
	R_Equipment.StdValidation = tmpsv_PN.STDVALIDATION,
	R_Equipment.QualityAssurValidation = tmpsv_PN.QUALITYASSURVALIDATION,
	R_Equipment.Serialisation = tmpsv_PN.SERIALISATION,
	R_Equipment.CertificationClass = tmpsv_PN.PWIN,
	R_Equipment.PowerFactor = tmpsv_PN.POWERFACTOR,
	R_Equipment.EthernetInterface = tmpsv_PN.ETHERNET,
	R_Equipment.DDPIssue = tmpsv_PN.DDPIssue,
	R_Equipment.ANSI_Code = SUBSTRING(tmpsv_ANSICODE.UNIQUEID, 2, LEN(tmpsv_ANSICODE.UNIQUEID) - 1),
	R_Equipment.LimitationDescription = tmpsv_PN.LIMITATIONDESCRIPTION,
	R_Equipment.LifeLimit = tmpsv_PN.LIFELIMIT,
	R_Equipment.LifeLimitUnit = tmpsv_PN.LIFELIMITUNIT,
	R_Equipment.LifeWarningLimit = tmpsv_PN.LIFEWARNINGLIMIT,
	R_Equipment.InspectionLimit = tmpsv_PN.INSPECTIONLIMIT,
	R_Equipment.InspectionWarningLimit = tmpsv_PN.INSPECTIONWARNINGLIMIT,
	R_Equipment.Characterisation = tmpsv_PN.CHARACTERISATION,
	R_Equipment.EquipRealEq = tmpsv_PN.REALEQ,
	R_Equipment.EquipMilitary = tmpsv_PN.MILITARY,
	R_Equipment.EquipFTIType = tmpsv_PN.FTITYPE,
	R_Equipment.EquipVendorModNb = tmpsv_PN.VENDORMODELNUMBER,
	R_Equipment.EquipFrontierInterface = tmpsv_PN.FRONTIERINTERFACE,
	R_Equipment.EquipTechnVal = tmpsv_PN.TECHNICALVALIDATION,
	R_Equipment.EquipFTINb = tmpsv_PN.FTINUMBER,
	R_Equipment.EquipTypeReleaseCertif = tmpsv_PN.CONFORMITYTYPE
FROM
	tmpsv_PN
	JOIN R_Equipment ON tmpsv_PN.CMS = R_Equipment.CMS
	LEFT JOIN R_Supplier ON tmpsv_PN.FSCM = R_Supplier.SupFSCM
	LEFT JOIN (SELECT IDPN, TYPEEQ, LOADINGTYPE, ANSICODE FROM tmpsv_DS WHERE STATESTATE IN ('HELD', 'RELEASED', 'WIP')) AS DS ON tmpsv_PN.BIDA2A2 = DS.IDPN
	LEFT JOIN tmpsv_ANSICODE ON DS.ANSICODE = tmpsv_ANSICODE.IDA2A2
WHERE
	R_Equipment.SVMAJ_Eqt = 'PSEQ'

UPDATE
	R_FIN_DS
SET
	R_FIN_DS.idr_equip = R_Equipment.id_equip
FROM
	tmpsv_DS
	JOIN R_FIN_DS ON R_FIN_DS.fin_ds_sv = tmpsv_DS.BWTPARTNUMBER
	JOIN tmpsv_STANDARDPART ON tmpsv_DS.IDSTDPT = tmpsv_STANDARDPART.IDA2A2
	JOIN R_Equipment ON tmpsv_STANDARDPART.BNAME = R_Equipment.CMS
WHERE
	R_FIN_DS.SVMAJ_DS = 'PSEQ'
	AND R_Equipment.SVMAJ_Eqt = 'PSEQ'
