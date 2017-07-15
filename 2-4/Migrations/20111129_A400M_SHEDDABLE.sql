-- ***********************************************************************************
-- Sheddable data migration in R_FIN_DS
-- ***********************************************************************************


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2553MYAC000022V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800MY1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2553MYAC000022V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='800MY1')
	PRINT ' Sheddable for EDD Reference 2553MYAC000022V004 AND FIN CI 800MY1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2553MYAC000022V004 and FIN CI 800MY1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2553MYAC000024V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801MY1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2553MYAC000024V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801MY1')
	PRINT ' Sheddable for EDD Reference 2553MYAC000024V004 AND FIN CI 801MY1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2553MYAC000024V004 and FIN CI 801MY1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3445NFAC000000V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801NF') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3445NFAC000000V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801NF')
	PRINT ' Sheddable for EDD Reference 3445NFAC000000V007 AND FIN CI 801NF has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3445NFAC000000V007 and FIN CI 801NF does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3445NFAC000001V010' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801NF') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3445NFAC000001V010' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='801NF')
	PRINT ' Sheddable for EDD Reference 3445NFAC000001V010 AND FIN CI 801NF has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3445NFAC000001V010 and FIN CI 801NF does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2553MYAC000020V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802MY1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2553MYAC000020V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='802MY1')
	PRINT ' Sheddable for EDD Reference 2553MYAC000020V004 AND FIN CI 802MY1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2553MYAC000020V004 and FIN CI 802MY1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3342LBAC000001V001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803LB') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3342LBAC000001V001' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803LB')
	PRINT ' Sheddable for EDD Reference 3342LBAC000001V001 AND FIN CI 803LB has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3342LBAC000001V001 and FIN CI 803LB does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3342LBAC000005V006' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803LB') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3342LBAC000005V006' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803LB')
	PRINT ' Sheddable for EDD Reference 3342LBAC000005V006 AND FIN CI 803LB has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3342LBAC000005V006 and FIN CI 803LB does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2553MYAC000027V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803MY1') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2553MYAC000027V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='803MY1')
	PRINT ' Sheddable for EDD Reference 2553MYAC000027V004 AND FIN CI 803MY1 has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2553MYAC000027V004 and FIN CI 803MY1 does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3441SEAC000000V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805SE') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3441SEAC000000V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805SE')
	PRINT ' Sheddable for EDD Reference 3441SEAC000000V008 AND FIN CI 805SE has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3441SEAC000000V008 and FIN CI 805SE does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3441SEAC000001V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805SE') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3441SEAC000001V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='805SE')
	PRINT ' Sheddable for EDD Reference 3441SEAC000001V004 AND FIN CI 805SE has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3441SEAC000001V004 and FIN CI 805SE does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000010V013' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000010V013' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000010V013 AND FIN CI 813AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000010V013 and FIN CI 813AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000026V009' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000026V009' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000026V009 AND FIN CI 813AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000026V009 and FIN CI 813AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000048V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000048V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='813AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000048V004 AND FIN CI 813AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000048V004 and FIN CI 813AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3414FAAC000024V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='816FA') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3414FAAC000024V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='816FA')
	PRINT ' Sheddable for EDD Reference 3414FAAC000024V008 AND FIN CI 816FA has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3414FAAC000024V008 and FIN CI 816FA does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000018V011' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000018V011' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000018V011 AND FIN CI 824AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000018V011 and FIN CI 824AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000027V009' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000027V009' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000027V009 AND FIN CI 824AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000027V009 and FIN CI 824AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '4821AJAC000049V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '4821AJAC000049V004' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824AJ')
	PRINT ' Sheddable for EDD Reference 4821AJAC000049V004 AND FIN CI 824AJ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 4821AJAC000049V004 and FIN CI 824AJ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '3414FAAC000015V003' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824FA') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '3414FAAC000015V003' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='824FA')
	PRINT ' Sheddable for EDD Reference 3414FAAC000015V003 AND FIN CI 824FA has been updated '
	END
ELSE
	PRINT ' EDD Reference for 3414FAAC000015V003 and FIN CI 824FA does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2472XZAC000077V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='854XZ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2472XZAC000077V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='854XZ')
	PRINT ' Sheddable for EDD Reference 2472XZAC000077V007 AND FIN CI 854XZ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2472XZAC000077V007 and FIN CI 854XZ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2472XZAC000082V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='856XZ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2472XZAC000082V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='856XZ')
	PRINT ' Sheddable for EDD Reference 2472XZAC000082V007 AND FIN CI 856XZ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2472XZAC000082V007 and FIN CI 856XZ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2472XZAC000083V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='856XZ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2472XZAC000083V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='856XZ')
	PRINT ' Sheddable for EDD Reference 2472XZAC000083V008 AND FIN CI 856XZ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2472XZAC000083V008 and FIN CI 856XZ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2472XZAC000084V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='858XZ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2472XZAC000084V007' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='858XZ')
	PRINT ' Sheddable for EDD Reference 2472XZAC000084V007 AND FIN CI 858XZ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2472XZAC000084V007 and FIN CI 858XZ does not exist '


IF EXISTS (SELECT * FROM R_FIN_DS WHERE [EDDreference] = '2472XZAC000085V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='858XZ') ) 
	BEGIN
	UPDATE R_FIN_DS SET [Sheddable]  =  'No' WHERE  [EDDreference] = '2472XZAC000085V008' AND idr_fin  = (SELECT top 1 id_fin FROM R_FIN_CI WHERE FIN ='858XZ')
	PRINT ' Sheddable for EDD Reference 2472XZAC000085V008 AND FIN CI 858XZ has been updated '
	END
ELSE
	PRINT ' EDD Reference for 2472XZAC000085V008 and FIN CI 858XZ does not exist '

