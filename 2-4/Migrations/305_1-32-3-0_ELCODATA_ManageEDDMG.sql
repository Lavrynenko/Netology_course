------------------------------------------------------------------------
-- MANAGE ATTRIBUTES MG
-- 
-- @program		A350
-- @version		1.32
-- @module		ELCODATA
--
------------------------------------------------------------------------


------------------------------------------------------------------------
-- Add MG to "GFI resettable"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'GFI_resettable'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('GFI resettable','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "Secured Open" on EDD P/CD
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'SecuredOpen'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','SEPDC','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','EPDC','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','EPDC','RCCB','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','EPDC','C/B','3','0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','PEPDC','RCCB','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','PEPDC','C/B','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','CBP','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Secured Open','CBP','C/B','3','0')

------------------------------------------------------------------------
-- Add MG to "PIN Allocation – Power Output Connector Neutral" on EDD P/CD
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'pinAlloc_PO_CN'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('PIN Allocation – Power Output Connector Neutral','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC Connector Reference - Power Output"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcConnRef_PO'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC Connector Reference - Power Output','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC PIN Allocation - DC Power Output"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcPinAlloc_DC_PO'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - DC Power Output','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC PIN Allocation - AC Power Output PhA"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcPinAlloc_AC_PO_PhA'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhA','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC PIN Allocation - AC Power Output PhB"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcPinAlloc_AC_PO_PhB'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhB','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC PIN Allocation - AC Power Output PhC"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcPinAlloc_AC_PO_PhC'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - AC Power Output PhC','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "VC PIN Allocation - Power Output Connector Neutral"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'VcPinAlloc_PO_CN'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('VC PIN Allocation - Power Output Connector Neutral','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "SSPM Column"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'SSPM_column'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('SSPM Column','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "Overheating shedding priority"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = (	SELECT object_name FROM InfoBase
								WHERE object_value = 'overheatingSheddingPriority'
								AND table_name = 'R_FIN_DS')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('Overheating shedding priority','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "CIDS Load group 1"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = 'CIDS Load group 1'
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 1','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "CIDS Load group 2"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = 'CIDS Load group 2'
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 2','CBP','C/B',NULL,'0')
	
------------------------------------------------------------------------
-- Add MG to "CIDS Load group 3"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = 'CIDS Load group 3'
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('CIDS Load group 3','CBP','C/B',NULL,'0')

------------------------------------------------------------------------
-- Add MG to "LPM Load Group"
------------------------------------------------------------------------
DELETE FROM T_MG
	WHERE Object_name = 'LPM Load Group'
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','SPDB','SSPC','3','0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','SEPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','EPDC','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','EPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','EPDC','C/B',NULL,'0')						
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','PEPDC','RCCB',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','PEPDC','C/B',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','CBP','SSPC',NULL,'0')
INSERT INTO T_MG (Object_name, PCType, DeviceType, ML, SpecificControl)
	VALUES ('LPM Load Group','CBP','C/B',NULL,'0')
	
