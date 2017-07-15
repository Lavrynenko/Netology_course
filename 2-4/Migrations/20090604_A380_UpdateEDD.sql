/**************************************************************************
**  Please update the following data and do not forget to recalculate the checksum of the EDD:  **
**								 **
**  FIN        317MH1							 **
**  EDD      4423MHAC000001						 **
**  Field      Full Provision Status						 **
**  Value     Not Installed 						 **
***************************************************************************/


Update R_FIN_DS Set FullProvisionStatus='Not Installed'  Where substring(EDDReference,1,14)='4423MHAC000001'

update r_fin_ds 
set eddchecksum=dbo.ELCOCHECK((select id_ds from r_fin_ds where substring(eddreference,1,14)='4423MHAC000001')) 
where substring(eddreference,1,14)='4423MHAC000001'