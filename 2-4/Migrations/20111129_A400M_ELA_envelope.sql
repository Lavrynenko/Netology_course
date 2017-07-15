-- ***********************************************************************************
-- ELA data migration in R_FIN_DS
-- ***********************************************************************************


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-998HQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998HQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-998HQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998HQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-998HQLD1-001 AND FIN CI 998HQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-998HQLD1-001 and FIN CI 998HQLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-998PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998PQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-998PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998PQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-998PQLD1-001 AND FIN CI 998PQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-998PQLD1-001 and FIN CI 998PQLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-984PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='984PQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-984PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='984PQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-984PQLD1-001 AND FIN CI 984PQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-984PQLD1-001 and FIN CI 984PQLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-986PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='986PQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-986PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='986PQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-986PQLD1-001 AND FIN CI 986PQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-986PQLD1-001 and FIN CI 986PQLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-957XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='957XZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-957XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='957XZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-957XZLD1-001 AND FIN CI 957XZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-957XZLD1-001 and FIN CI 957XZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-927XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='927XZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-927XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='927XZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-927XZLD1-001 AND FIN CI 927XZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-927XZLD1-001 and FIN CI 927XZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-989XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='989XZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-989XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='989XZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-989XZLD1-001 AND FIN CI 989XZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-989XZLD1-001 and FIN CI 989XZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-955XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='955XZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-955XZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='955XZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-955XZLD1-001 AND FIN CI 955XZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-955XZLD1-001 and FIN CI 955XZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-998MLLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998MLLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-998MLLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998MLLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-998MLLD1-001 AND FIN CI 998MLLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-998MLLD1-001 and FIN CI 998MLLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-800QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-800QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-800QALD1-001 AND FIN CI 800QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-800QALD1-001 and FIN CI 800QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-801QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-801QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-801QALD1-001 AND FIN CI 801QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-801QALD1-001 and FIN CI 801QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-805QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-805QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-805QALD1-001 AND FIN CI 805QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-805QALD1-001 and FIN CI 805QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-810QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='810QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-810QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='810QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-810QALD1-001 AND FIN CI 810QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-810QALD1-001 and FIN CI 810QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-816QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='816QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-816QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='816QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-816QALD1-001 AND FIN CI 816QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-816QALD1-001 and FIN CI 816QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-21QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='21QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-21QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='21QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-21QALD1-001 AND FIN CI 21QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-21QALD1-001 and FIN CI 21QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-19QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='19QALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-19QALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='19QALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-19QALD1-001 AND FIN CI 19QALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-19QALD1-001 and FIN CI 19QALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-17QL2LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='17QL2LD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-17QL2LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='17QL2LD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-17QL2LD1-001 AND FIN CI 17QL2LD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-17QL2LD1-001 and FIN CI 17QL2LD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-17QL1LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='17QL1LD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-17QL1LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='17QL1LD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-17QL1LD1-001 AND FIN CI 17QL1LD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-17QL1LD1-001 and FIN CI 17QL1LD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-998DMLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998DMLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-998DMLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998DMLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-998DMLD1-001 AND FIN CI 998DMLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-998DMLD1-001 and FIN CI 998DMLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-996DMLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='996DMLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-996DMLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='996DMLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-996DMLD1-001 AND FIN CI 996DMLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-996DMLD1-001 and FIN CI 996DMLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-24GF2LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='24GF2LD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-24GF2LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='24GF2LD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-24GF2LD1-001 AND FIN CI 24GF2LD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-24GF2LD1-001 and FIN CI 24GF2LD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-24GF1LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='24GF1LD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-24GF1LD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='24GF1LD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-24GF1LD1-001 AND FIN CI 24GF1LD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-24GF1LD1-001 and FIN CI 24GF1LD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-802SDLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802SDLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-802SDLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802SDLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-802SDLD1-001 AND FIN CI 802SDLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-802SDLD1-001 and FIN CI 802SDLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-802RFLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802RFLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-802RFLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802RFLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-802RFLD1-001 AND FIN CI 802RFLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-802RFLD1-001 and FIN CI 802RFLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-801RELD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801RELD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-801RELD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801RELD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-801RELD1-001 AND FIN CI 801RELD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-801RELD1-001 and FIN CI 801RELD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-802RELD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802RELD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-802RELD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802RELD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-802RELD1-001 AND FIN CI 802RELD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-802RELD1-001 and FIN CI 802RELD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-800RZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800RZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-800RZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800RZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-800RZLD1-001 AND FIN CI 800RZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-800RZLD1-001 and FIN CI 800RZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-803RZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803RZLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-803RZLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803RZLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-803RZLD1-001 AND FIN CI 803RZLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-803RZLD1-001 and FIN CI 803RZLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-6PALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='6PALD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-6PALD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='6PALD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-6PALD1-001 AND FIN CI 6PALD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-6PALD1-001 and FIN CI 6PALD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-997AJLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='997AJLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-997AJLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='997AJLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-997AJLD1-001 AND FIN CI 997AJLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-997AJLD1-001 and FIN CI 997AJLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-998AJLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998AJLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'Yes' WHERE  [EDDreference] = 'LOAD-998AJLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='998AJLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-998AJLD1-001 AND FIN CI 998AJLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-998AJLD1-001 and FIN CI 998AJLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-982PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='982PQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'No' WHERE  [EDDreference] = 'LOAD-982PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='982PQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-982PQLD1-001 AND FIN CI 982PQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-982PQLD1-001 and FIN CI 982PQLD1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = 'LOAD-985PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='985PQLD1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [ELA_Enveloppe]  =  'No' WHERE  [EDDreference] = 'LOAD-985PQLD1-001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='985PQLD1')
	PRINT ' ELA Enveloppe FOR EDD Reference LOAD-985PQLD1-001 AND FIN CI 985PQLD1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for LOAD-985PQLD1-001 and FIN CI 985PQLD1 does not exist '

