								--------------------------------------------------------------
								-- AFDX INT										--
								-- SS: ELCODATA_V1.30_synthesis_sheet_AFDXAttribute.doc	--
								--------------------------------------------------------------


/** AfdxFallBackStatus VARCHAR  **/

ALTER TABLE T_SSPC_VL ALTER COLUMN SSPC_VL_AfdxFallBackStatus VARCHAR(8000) NULL


/** Add a new AfdxFallBackStatus INT **/

if(
  NOT exists (
	select *
	from syscolumns
	where syscolumns.id = (	select sysobjects.id
							from sysobjects
							where name = 'T_SSPC_VL'
						  )
	 and syscolumns.name = 'SSPC_VL_AfdxFallBackStatusInt'
	)
)
BEGIN
	ALTER TABLE dbo.T_SSPC_VL ADD SSPC_VL_AfdxFallBackStatusInt Int NULL
	
END