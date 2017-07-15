if exists (select * from t_dbactions where label='ELCODATA Check Truth Table')
begin
	delete from t_dbactions where label='ELCODATA Check Truth Table'
end

insert into 
	t_dbactions (
		label,
		command,
		template_page,
		parameters,
		report_group_idr
	)
select
	'ELCODATA Check Truth Table',
	'sp_TRUTHTABLE ''#PowerCenter#''',
	'TT_report.php',
	'Choose the Power Center :#&PowerCenter:select distinct PowerCenterType from R_FIN_DS order by PowerCenterType',
	report_group_id
	
from 
	t_report_group
where 
	report_group_label='ELCODATA'

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_TRUTHTABLE]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_TRUTHTABLE]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


-- Stored Ptrocedure
	CREATE PROCEDURE [dbo].[sp_TRUTHTABLE] @PowerCenter varchar (8000) AS
BEGIN
	SELECT
		EDDReference,
		FIN,
		MPReference,
		DS_SI_Reference,
		SSPC_VL_order,
		SSPC_VL_Designation,
		SSPC_VL_type,
		SSPC_VL_number,
		SSPC_VL_PinNumber,
		SSPC_VL_ConnectorNumber,
		SSPC_VL_VlName,
		SSPC_VL_VlIdentifier,
		SSPC_VL_UdpPort,
		SSPC_VL_SignalAddress,
		SSPC_VL_SignalPosition,
		SSPC_VL_AfdxFallBackStatus,
		SSPC_VL_TimeDelay1To0,
		SSPC_VL_TimeDelay0To1,
		COMBINAISON_STATUS_order,
		COMBINAISON_STATUS_value
	FROM
		R_FIN_CI		
		LEFT JOIN R_FIN_DS ON idr_fin = id_fin
		LEFT JOIN T_IMPACTDS on T_IMPACTDS.idr_ds_post=R_FIN_DS.id_ds
		LEFT JOIN T_MP ON T_MP.id_mp = T_IMPACTDS.idr_mp
		LEFT JOIN T_TRUTH_TABLE ON TRUTH_TABLE_R_FIN_DS_idr = id_ds
		LEFT JOIN T_COMBINAISON_STATUS ON COMBINAISON_TRUTH_TABLE_idr = TRUTH_TABLE_id
		LEFT JOIN T_SSPC_VL ON SSPC_VL_TRUTH_TABLE_idr = TRUTH_TABLE_id
	WHERE 
		PowerCenterType = @PowerCenter
		AND ds_type=4
		AND FINDS_EDD_Type='PCD'
	ORDER BY 
		EDDReference

END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO