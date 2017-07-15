-- Software
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tmp_fls_sw]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo]. [tmp_fls_sw]
GO
CREATE TABLE tmp_fls_sw (
	SWFINCI varchar(8000),
	ReloadingCondition varchar(8000),
	HWFINCI varchar(8000),
	Rank varchar(8000),
	SWGroup varchar(8000),
	PNmofiableByALAfterTOT varchar(8000),
	GroundAssociatedTool varchar(8000),
	ConfFileMultiSource varchar(8000),
	SWType varchar(8000),
	CertifLevel varchar(8000),
	UploadingMean varchar(8000),
	FINRep varchar(8000),
	FLSClassif varchar(8000),
	MultiInstallation varchar(8000)--,
	--SystemName varchar(8000)
)
-- Read csv file
BULK INSERT tmp_fls_sw FROM '\\172.19.2.157\SHARE\FLS3\SW.csv' WITH (FIELDTERMINATOR =';', ROWTERMINATOR ='\n')

-- Update SW FIN
UPDATE R_FIN_CI SET
	R_FIN_CI.FinCiReloadingConditionTag = tmp_fls_sw.ReloadingCondition,
	R_FIN_CI.FinCiRank = CAST(tmp_fls_sw.Rank AS int),
	R_FIN_CI.FinCiSWGroup = tmp_fls_sw.SWGroup,
	R_FIN_CI.FinCiPNRmodified = REPLACE(tmp_fls_sw.PNmofiableByALAfterTOT, 'N/A', ''),
	R_FIN_CI.FinCiGroundToolAssociated = tmp_fls_sw.GroundAssociatedTool,
	R_FIN_CI.FinCiConfFileMultiSource = REPLACE(tmp_fls_sw.ConfFileMultiSource, 'N/A', ''),
	R_FIN_CI.FinCiSWType = tmp_fls_sw.SWType,
	R_FIN_CI.FinCiCertificationLevel = tmp_fls_sw.CertifLevel,
	R_FIN_CI.FinCiUploadingMean = tmp_fls_sw.UploadingMean,
	R_FIN_CI.FinCiFLSClassification = tmp_fls_sw.FLSClassif,
	R_FIN_CI.FinCiMultiInstallation = REPLACE(tmp_fls_sw.MultiInstallation, ';', '')--,
	--R_FIN_CI.FinCiSystemName = tmp_fls_sw.SystemName
FROM
	R_FIN_CI
	JOIN tmp_fls_sw ON tmp_fls_sw.SWFINCI = R_FIN_CI.fin
WHERE
	tmp_fls_sw.SWFINCI != 'SWFINCI'

DROP TABLE tmp_fls_sw
