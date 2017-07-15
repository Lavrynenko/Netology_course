if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_InsertSVFIN]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_InsertSVFIN]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



CREATE PROCEDURE [dbo].[sp_InsertSVFIN](@FIN VARCHAR(8000)) AS
/* !!!! WARNING !!!! 
This stored procedure is used for A380 and A400M 
Please change the name of the linked server AND the program letter */
BEGIN
EXEC('
	INSERT INTO R_FIN_CI
		(
			idr_ata,
			FIN,
			FunctionnalDesignation,
			fin_ci_sv,
			finci_status
		)
	SELECT
		id_ata,
		RIGHT(SV.FIN, LEN(SV.FIN) - 1) FIN,
		functionaldesignation,
		FINSV,
		state
	FROM
		OPENQUERY(R_SV_A400M, ''
			select
			replace(atadsm.wtpartnumber,'''' '''','''''''') ATA
			, functionaldesignation
			,cim.wtpartnumber FINSV
			,replace(cim.wtpartnumber,'''' '''','''''''') FIN
			,finci.statestate state
			from
			 finci finci
			,acepartmaster cim
			,aceusagelink atads2cim
			--
			,atads atads
			,aceitemmaster atadsm
			where 0=0
			and atads.statestate = ''''PUBLISHED''''
			and atadsm.ida2a2 = atads.ida3masterreference 
			--
			-- take last version of atads
			and length(substr(atads.valuea2b2versioninfo,1,instr(atads.valuea2b2versioninfo,''''.'''',1,1)-1))
			    ||substr(atads.valuea2b2versioninfo,1,instr(atads.valuea2b2versioninfo,''''.'''',1,1)-1)
			    ||length(substr(atads.valuea2b2versioninfo,instr(atads.valuea2b2versioninfo,''''.'''',1,1)+1))
			    ||substr(atads.valuea2b2versioninfo,instr(atads.valuea2b2versioninfo,''''.'''',1,1)+1) 
			   =(select max(length(substr(atads2.valuea2b2versioninfo,1,instr(atads2.valuea2b2versioninfo,''''.'''',1,1)-1))
			                 ||substr(atads2.valuea2b2versioninfo,1,instr(atads2.valuea2b2versioninfo,''''.'''',1,1)-1)
			                 ||length(substr(atads2.valuea2b2versioninfo,instr(atads2.valuea2b2versioninfo,''''.'''',1,1)+1))
			                 ||substr(atads2.valuea2b2versioninfo,instr(atads2.valuea2b2versioninfo,''''.'''',1,1)+1))
			      from atads atads2
			      where atads.ida3masterreference = atads2.ida3masterreference)
			--
			and atads.ida2a2 = atads2cim.ida3a5
			and atads2cim.ida3b5 = cim.ida2a2
			and cim.ida2a2 = finci.ida3masterreference
			and finci.latestiterationinfo = 1
			and finci.statestate not in (''''DELETED'''',''''INVALID'''')
			and replace(cim.wtpartnumber,'''' '''','''''''') = ''''M''''||''''' + @FIN + '''''
			order by
			cim.wtpartnumber
			,atadsm.wtpartnumber 
			,atads.VALUEA2B2VERSIONINFO desc
		'') SV
		JOIN R_ATA ON ''L'' + R_ATA.ATACODE = SV.ATA
		LEFT JOIN R_FIN_CI ON ''L'' + R_FIN_CI.FIN = SV.FIN
	WHERE
		R_FIN_CI.FIN IS NULL
')
END
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

