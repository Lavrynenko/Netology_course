if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sp_MAFUFCPGeneralReport]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[sp_MAFUFCPGeneralReport]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




CREATE PROCEDURE [dbo].[sp_MAFUFCPGeneralReport](@CR_CL VARCHAR(150), @MP_CL VARCHAR(150), @CR_Status VARCHAR(150), 
	@MP_Status VARCHAR(150), @CR_LeaderOrInvolved VARCHAR(150)) AS

	
	DECLARE @SELECT VARCHAR(8000)
	DECLARE @FROM1 VARCHAR(8000)
	DECLARE @FROM2 VARCHAR(8000)
	DECLARE @WHERE VARCHAR(8000)
SET @SELECT =  
			'
				SELECT     
					T_REQUEST.RequestReference AS CR, 
					T_REQUEST.eRoomStatus AS [CR Status], 
					T_MP.MPReference AS [MP], 
					T_MP.MPStatus AS [MP Status], 
					T_MP.MpTrsStatus AS [TRS Status],
					T_MP.MpTrsIssue AS [TRS Issue],
				        T_MOD.MODReference AS [MOD],
					CASE 
						WHEN T_MP.MPReference  <>'''' OR T_MP.MPReference IS NOT NULL THEN T_MP.MPTitle 
						ELSE T_REQUEST.RequestTitle
					END AS [CR/MP Title],
					T_REQUEST.OriginatorACMT AS [CR Originator ACMT],
					T_REQUEST.CROpDate AS [CR Opening Date],
					T_REQUEST.Linvold AS [CR Leader/Involved],
					T_REQUEST.UProcCR AS [Task Force Item],
					T_REQUEST.WFStatus as [Workflow status],
					CASE 
						WHEN T_MP.MPReference <>'''' OR T_MP.MPReference IS NOT NULL THEN T_MP.ChgLeaderMP
						ELSE T_REQUEST.ChgLeaderCR
					END AS [Change Leader],
					CASE 
						WHEN T_MP.MPReference <>'''' OR T_MP.MPReference IS NOT NULL THEN T_MP.MPTechLeader
						ELSE T_REQUEST.TechLeader
					END AS [Tech. Leader],
					CASE 
						WHEN T_MP.MPReference <>'''' OR T_MP.MPReference IS NOT NULL THEN T_MP.MPFirstMSN
						ELSE T_REQUEST.GIPoE
					END AS [First MSN],
					CASE 
						WHEN T_MOD.MODReference <>'''' OR T_MOD.MODReference IS NOT NULL THEN T_MOD.ValidityFromACC
						ELSE T_MP.MPApplFromIcc
					END AS [Applicability],
					T_MP.INVpEDESRef AS [Category B Validity],
					T_MP.UProcMP AS [Urgent MOD opening],
					CASE 
						----When SYS is leader
						WHEN T_MP.LinvoldMP =''Leader'' THEN T_MP.MpTrsStatus+'' / ''+T_MP.MpTrsIssue
						----When SYS is Involved
						WHEN T_MP.LinvoldMP =''Involved'' THEN T_MP.MPsubTrsStatus+'' / ''+T_MP.MPsubTrsIssue
						----Other cases
						ELSE ''''
					END AS [MYXX (Sub) TRS],
					[F&E] AS [MFXX Sub TRS],
					[NF] AS [MFNX Sub TRS],
					[WNG] AS [MWXX Sub TRS],
					[PWP] AS [MPXX Sub TRS],
					[MIT] AS [MMXX Sub TRS],
					[ELEC] AS [MEXX Sub TRS],
					[MYA] AS [MYAX],
					[MYC] AS [MYCX],
					[MYD] AS [MYDX],
					[MYE] AS [MYEX],
					[MYL] AS [MYLX],
					[MYN] AS [MYNX],	
					[MYT] AS [MYTX],
					[MYU] AS [MYUX],
					[MYV] AS [MYVX],
					T_REQUEST.ATA24Impact AS [ATA 24],
					T_REQUEST.RequestComment AS [CL Comments],
					T_REQUEST.GIGenComments AS [GL Comments],
					T_REQUEST.OSTeamComment AS [Central SYS CM Comments],
					T_REQUEST.taskForceFU AS [Task Force Follow up],
					maxMeetComment AS [CCC Decisions],
					T_REQUEST.EngineeringComment AS [CCB Decisions],
					T_MP.Comment AS [CL Comments],
					T_MP.MPGLComment AS [GL Comments],
					T_MP.MPSysCentralCMComment AS [Central SYS CM Comments],
					T_MP.MPTaskForceFollowUp AS [Task Force Follow up],
					T_MP.GeneralComment AS [CCB decisions]
				'
SET @FROM1 = ' 
			FROM         
				T_MOD 
				INNER JOIN T_LINK_MOD_MP ON T_MOD.id_mod = T_LINK_MOD_MP.idr_mod 
				RIGHT OUTER JOIN T_MP 
				INNER JOIN T_LINK_REQUEST_MP ON T_MP.id_mp = T_LINK_REQUEST_MP.idr_mp ON T_LINK_MOD_MP.idr_mp = T_MP.id_mp 
				RIGHT OUTER JOIN T_REQUEST ON T_LINK_REQUEST_MP.idr_request = T_REQUEST.id_request
				-- F&E ==> MFXX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [F&E]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''F&E''
			
				)ACMT_FE ON T_MP.id_mp=ACMT_FE.idr_mp
				-- NF ==> MFNX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [NF]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''NF''
			
				)ACMT_NF ON T_MP.id_mp=ACMT_NF.idr_mp
				-- WNG ==> MWXX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [WNG]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''WNG''
			
				)ACMT_WNG ON T_MP.id_mp=ACMT_WNG.idr_mp
				-- PWP ==> MPXX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [PWP]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''PWP''
			
				)ACMT_PWP ON T_MP.id_mp=ACMT_PWP.idr_mp
				-- MIT ==> MMXX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [MIT]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''MIT''
			
				)ACMT_MIT ON T_MP.id_mp=ACMT_MIT.idr_mp
				-- ELEC ==> MEXX
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_MP.mp_idr AS idr_mp,  
							T_INVOLVED_TEAM_MP.Status+'' / ''+T_INVOLVED_TEAM_MP.Issue AS [ELEC]
						FROM         
							T_INVOLVED_TEAM_MP 
							INNER JOIN T_MP ON T_INVOLVED_TEAM_MP.mp_idr = T_MP.id_mp
						WHERE   
							T_INVOLVED_TEAM_MP.NotDisplayed = 0
							AND T_INVOLVED_TEAM_MP.ACMTImpacted = ''ELEC''
			
				)ACMT_ELEC ON T_MP.id_mp=ACMT_ELEC.idr_mp
				-- CMIT MYA
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYA]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYA''
			
				)CMIT_MYA ON T_REQUEST.id_request=CMIT_MYA.request
				-- CMIT MYC
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYC]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYC''
			
				)CMIT_MYC ON T_REQUEST.id_request=CMIT_MYC.request
				-- CMIT MYD
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYD]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYD''
			
				)CMIT_MYD ON T_REQUEST.id_request=CMIT_MYD.request
				-- CMIT MYE
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYE]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0

							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYE''
			
				)CMIT_MYE ON T_REQUEST.id_request=CMIT_MYE.request
				-- CMIT MYL
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYL]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYL''
			
				)CMIT_MYL ON T_REQUEST.id_request=CMIT_MYL.request
				-- CMIT MYN
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYN]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYN''
			
				)CMIT_MYN ON T_REQUEST.id_request=CMIT_MYN.request
				-- CMIT MYT
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYT]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYT''
			
				)CMIT_MYT ON T_REQUEST.id_request=CMIT_MYT.request
				-- CMIT MYU
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES'' 
							END AS [MYU]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYU''
			
				)CMIT_MYU ON T_REQUEST.id_request=CMIT_MYU.request
				-- CMIT MYV
				LEFT JOIN (
						SELECT   
							T_INVOLVED_TEAM_REQ.request_idr AS request,  
							CASE 
								WHEN ACMTImpactedReq  ='''' OR ACMTImpactedReq IS NULL THEN ''''
								ELSE ''YES''
							END AS [MYV]
						FROM         
							T_INVOLVED_TEAM_REQ 
							INNER JOIN T_REQUEST ON T_INVOLVED_TEAM_REQ.request_idr = T_REQUEST.id_request
						WHERE   
							T_INVOLVED_TEAM_REQ.ReqUnimpacted = 0
							AND T_INVOLVED_TEAM_REQ.ACMTImpactedReq = ''MYV''
			
				)CMIT_MYV ON T_REQUEST.id_request=CMIT_MYV.request
			'
SET @FROM2 = '
				-- CR CCC Decissions
				LEFT JOIN (
						SELECT
							T_MEETING.idr_request AS maxMeetCommentRequest_idr,
							T_MEETING.meetcomment AS maxMeetComment
						FROM
							T_MEETING
							JOIN
							(
								SELECT
									idr_request,
									MAX(T_MEETING.meetDate) AS MAXmeetDate
								FROM
									T_MEETING
								GROUP BY
									idr_request
							) AS MEETTEMP ON MEETTEMP.idr_request = T_MEETING.idr_request AND MEETTEMP.MAXmeetDate = T_MEETING.meetDate
				)CR_CCC_Decision ON T_REQUEST.id_request=CR_CCC_Decision.maxMeetCommentRequest_idr
				-- MP CCC Decissions
				LEFT JOIN (
						SELECT
							T_MEETING.idr_mp AS maxMeetCommentMP_idr,
							T_MEETING.meetcomment AS maxMeetCommentMP
						FROM
							T_MEETING
							JOIN
							(
								SELECT
									idr_mp,
									MAX(T_MEETING.meetDate) AS MAXmeetDate
								FROM
									T_MEETING
								GROUP BY
									idr_mp
							) AS MEETTEMPMP ON MEETTEMPMP.idr_mp = T_MEETING.idr_mp AND MEETTEMPMP.MAXmeetDate = T_MEETING.meetDate
				)MP_CCC_Decision ON T_MP.id_mp=MP_CCC_Decision.maxMeetCommentMP_idr
			'
SET @WHERE = ' 
			 WHERE
				1=1
				AND ((eRoomStatus = '''+@CR_Status+''') OR (''1'' + '''+@CR_Status+''' =''1''))
				AND ((MPStatus = '''+@MP_Status+''') OR (''1'' + '''+@MP_Status+''' =''1''))
				AND ((Linvold = '''+@CR_LeaderOrInvolved+''') OR (''1'' + '''+@CR_LeaderOrInvolved+''' =''1''))
			'
			+
				CASE
					WHEN @CR_CL <> '' AND @MP_CL <>''THEN 'AND ((ChgLeaderCR = '''+@CR_CL+''') OR (ChgLeaderMP = '''+@MP_CL+'''))'
					ELSE 'AND ((ChgLeaderCR = '''+@CR_CL+''') OR (''1'' + '''+@CR_CL+''' =''1'')) 
						AND ((ChgLeaderMP = '''+@MP_CL+''') OR (''1'' + '''+@MP_CL+''' =''1''))'
				END +
				'ORDER BY T_REQUEST.RequestReference, T_MP.MPReference, T_MOD.MODReference'
	

EXECUTE(@SELECT+@FROM1+@FROM2+@WHERE)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

