-- ***********************************************************************************
-- PDDS Wing Update
-- ***********************************************************************************




IF NOT EXISTS (SELECT * FROM T_PDDS WHERE id_pdds = '28231') 
	PRINT '28231' + ' PDDS does not exist'
ELSE
	BEGIN		
		UPDATE T_PDDS SET pdds_w_wing = '0' WHERE id_pdds = '28231'
		PRINT 'pdds_w_wing for PDDS '  + '28231' + ' has been updated '
	END	

