----------------------------------------------------------------------------
-- Update PDDS
--
-- @program		All
-- @version		
-- @module		
--
----------------------------------------------------------------------------
-- List of PDDS updated : CEL27922455-050001 


Update T_PDDS Set pdds_idr_mp=(select  id_mp from t_mp where MPReference='T78318')
Where idr_pdci=(select  top 1  id_pdci from T_PDCI where pdci_reference = 'CEL27922455' order by id_pdci desc ) and pdds_reference = '050001' 
and pdds_idr_mp=(select  id_mp from t_mp where MPReference='T78488');