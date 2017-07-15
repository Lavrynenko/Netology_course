UPDATE
	T_SSPC_VL
SET
	SSPC_VL_AfdxFallBackStatus=null
WHERE
	SSPC_VL_AfdxFallBackStatus = 'NULL' 

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
CREATE TABLE dbo.Tmp_T_SSPC_VL
	(
	SSPC_VL_id int NOT NULL IDENTITY (1, 1),
	SSPC_VL_order int NULL,
	SSPC_VL_Designation varchar(8000) NULL,
	SSPC_VL_type varchar(8000) NULL,
	SSPC_VL_number int NULL,
	SSPC_VL_PinNumber int NULL,
	SSPC_VL_ConnectorNumber varchar(8000) NULL,
	SSPC_VL_VlName varchar(8000) NULL,
	SSPC_VL_VlIdentifier int NULL,
	SSPC_VL_UdpPort int NULL,
	SSPC_VL_SignalAddress int NULL,
	SSPC_VL_SignalPosition int NULL,
	SSPC_VL_AfdxFallBackStatus int NULL,
	SSPC_VL_TimeDelay1To0 int NULL,
	SSPC_VL_TimeDelay0To1 int NULL,
	SSPC_VL_TRUTH_TABLE_idr int NULL,
	SSPC_VL_BooleanFalseDefinition varchar(30) NULL,
	SSPC_VL_BooleanTrueDefinition varchar(30) NULL,
	SSPC_VL_SignalName varchar(30) NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_T_SSPC_VL ON
GO
IF EXISTS(SELECT * FROM dbo.T_SSPC_VL)
	 EXEC('INSERT INTO dbo.Tmp_T_SSPC_VL (SSPC_VL_id, SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, SSPC_VL_AfdxFallBackStatus, SSPC_VL_TimeDelay1To0, SSPC_VL_TimeDelay0To1, SSPC_VL_TRUTH_TABLE_idr, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_SignalName)
		SELECT SSPC_VL_id, SSPC_VL_order, SSPC_VL_Designation, SSPC_VL_type, SSPC_VL_number, SSPC_VL_PinNumber, SSPC_VL_ConnectorNumber, SSPC_VL_VlName, SSPC_VL_VlIdentifier, SSPC_VL_UdpPort, SSPC_VL_SignalAddress, SSPC_VL_SignalPosition, CONVERT(int, SSPC_VL_AfdxFallBackStatus), SSPC_VL_TimeDelay1To0, SSPC_VL_TimeDelay0To1, SSPC_VL_TRUTH_TABLE_idr, SSPC_VL_BooleanFalseDefinition, SSPC_VL_BooleanTrueDefinition, SSPC_VL_SignalName FROM dbo.T_SSPC_VL TABLOCKX')
GO
SET IDENTITY_INSERT dbo.Tmp_T_SSPC_VL OFF
GO
DROP TABLE dbo.T_SSPC_VL
GO
EXECUTE sp_rename N'dbo.Tmp_T_SSPC_VL', N'T_SSPC_VL', 'OBJECT'
GO
ALTER TABLE dbo.T_SSPC_VL ADD CONSTRAINT
	PK_T_SSPC_VL PRIMARY KEY CLUSTERED 
	(
	SSPC_VL_id
	) WITH FILLFACTOR = 90 ON [PRIMARY]

GO
COMMIT



