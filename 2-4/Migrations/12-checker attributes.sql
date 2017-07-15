
-- to give rights on attributes for new role checker and new sign checked


declare
	@id int

select @id = context_id from t_edip_context where contextname = 'A400M_Checker'

-- RAZ checke rights to not have 2 times the same right
delete from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id

-- get compiler rights
IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_CONTEXT_idr=@id) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, @id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from T_EDIP_LINK_ATTRIBUTE__CONTEXT
where ATTRIBUTE__CONTEXT_CONTEXT_idr in
(
	select context_id from t_edip_context
	where contextname = 'A400M_Compiler'
)

-- get approver rights
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, @id as ATTRIBUTE__CONTEXT_CONTEXT_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT
where ATTRIBUTE__CONTEXT_CONTEXT_idr = (select context_id from t_edip_context where contextname = 'A400M_Approver') 
and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT 
	where ATTRIBUTE__CONTEXT_CONTEXT_idr = (select context_id from t_edip_context where contextname = 'A400M_Checker')
)

END



-- Add write rights on PD and WD checker sign, and others attributes, for checker role
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT (ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
 from t_edip_attribute
where 
AttributeName in  (
	'WDDSSignCCName', 'WDDSSignCCVote', 'WDDSSignCCVoteDate', 'WDDSSignCCVoteComm',
	'PDDSSignCCName', 'PDDSSignCCVote', 'PDDSSignCCVoteDate', 'PDDSSignCCVoteComm',
	'WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
	'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm',
	'WDDSSimulateDate','WDDSSimulateError','WDDSSimulateStatus','WddsPs_File','WddsResFile',
	'WddsCabFile','WddsCtrlerrFile','WddsDifFile','WddsLisFile','PDDSSimulateDate','PDDSSimulateError',
	'PDDSSimulateStatus','PddsPs_File','PddsResFile','PddsCabFile','PddsCtrlerrFile',
	'PddsDifFile','PddsLisFile','WDDSSafetyReleabilityChecker'
)  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		(
			'WDDSSignCCName', 'WDDSSignCCVote', 'WDDSSignCCVoteDate', 'WDDSSignCCVoteComm',
			'PDDSSignCCName', 'PDDSSignCCVote', 'PDDSSignCCVoteDate', 'PDDSSignCCVoteComm',
			'WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
			'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm',
			'WDDSSimulateDate','WDDSSimulateError','WDDSSimulateStatus','WddsPs_File','WddsResFile',
			'WddsCabFile','WddsCtrlerrFile','WddsDifFile','WddsLisFile','PDDSSimulateDate','PDDSSimulateError',
			'PDDSSimulateStatus','PddsPs_File','PddsResFile','PddsCabFile','PddsCtrlerrFile',
			'PddsDifFile','PddsLisFile','WDDSSafetyReleabilityChecker'
		)  
	)
)


-- Remove some rights for checker role (comes from compiler or approver so must be deleted because not necessary)
delete from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
(
	select ATTRIBUTE_id from t_edip_attribute
	where AttributeName in  
	(
		'pdds_circuitResp',
		'pdds_codeSection',
		'pdds_datelastmodify',
		'pdds_designer',
		'pdds_designOfficeCode',
		'pdds_effectivity',
		'pdds_madeFromIssue',
		'pdds_madeFromSolution',
		'pdds_mainMod',
		'pdds_MPActive',
		'pdds_natco',
		'pdds_title',
		'pdds_type',
		'pdds_version_effectivity',
		'pdds_systemResp',
		'PDDSCancelled',
		'PDDSCreationDate',
		'PDDSFDOrigin',
		'PDDSReleaseDate',
		'PDDSReleaserName',
		'PDDSRespValidation',
		'Wdds_designOfficeCode',
		'Wdds_madeFromIssue',
		'Wdds_madeFromSolution',
		'Wdds_mainMod',
		'WDDS_Title',
		'WDDSCancelled',
		'WDDSCircuitResp',
		'WddsDateLastModify',
		'WddsDesigner',
		'WddsEffectivity',
		'WddsMPActive',
		'WddsNatco',
		'WDDSOriginPDDS',
		'WDDSReleaseDate',
		'WDDSReleaserName',
		'WDDSSystemResp',
		'WddsType',
		'WddsVersionEffectivity'
	)  
)



-- Add write rights on PD and WD Checker sign for compiler role
select @id = context_id from t_edip_context where contextname = 'A400M_Compiler'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
( 'WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
 'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
		'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm')  
	)
)






-- Add write rights on PD and WD Checker sign for approver role
select @id = context_id from t_edip_context where contextname = 'A400M_Approver'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
 'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSignCheckerName','WDDSSignCheckerVote','WDDSSignCheckerVoteDate','WDDSSignCheckerVoteComm',
		'PDDSSignCheckerName','PDDSSignCheckerVote','PDDSSignCheckerVoteDate','PDDSSignCheckerVoteComm')  
	)
)

	






-- Add write rights on WD CC sign for SR role
select @id = context_id from t_edip_context where contextname = 'A400M_System_Responsible'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSignCCName', 'WDDSSignCCVote', 'WDDSSignCCVoteDate', 'WDDSSignCCVoteComm')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSignCCName', 'WDDSSignCCVote', 'WDDSSignCCVoteDate', 'WDDSSignCCVoteComm')  
	)
)








-- Add write rights on WD SR sign for SR role
select @id = context_id from t_edip_context where contextname = 'A400M_System_Responsible'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSignSRName','WDDSSignSRVote','WDDSSignSRVoteDate','WDDSSignSRVoteComm')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSignSRName','WDDSSignSRVote','WDDSSignSRVoteDate','WDDSSignSRVoteComm')  
	)
)






-- Add write rights on WD SR sign for prg_Viewer_DO role
select @id = context_id from t_edip_context where contextname = 'A400M_Viewer_DO'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
	)
)





-- Add write rights on WD SR sign for prg_Viewer_FTI role
select @id = context_id from t_edip_context where contextname = 'A400M_Viewer_FTI'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
	)
)







-- Add write rights on WD SR sign for prg_Viewer_Labo role
select @id = context_id from t_edip_context where contextname = 'A400M_Viewer_Labo'	

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
(ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, AttributeContextReadMode, AttributeContextWriteMode, ATTRIBUTE__CONTEXT_CONTEXT_idr)
select 
	ATTRIBUTE_id as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, 
	0 as AttributeContextReadMode, 1 as AttributeContextWriteMode, 
	@id as ATTRIBUTE__CONTEXT_CONTEXT_idr
from t_edip_attribute
where 
AttributeName in  
('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
and ATTRIBUTE_id not in 
(
	select ATTRIBUTE__CONTEXT_ATTRIBUTE_idr from T_EDIP_LINK_ATTRIBUTE__CONTEXT where ATTRIBUTE__CONTEXT_CONTEXT_idr = @id
	and ATTRIBUTE__CONTEXT_ATTRIBUTE_idr in 
	(
		select ATTRIBUTE_id from t_edip_attribute
		where AttributeName in  
		('WDDSSystemResponsible','WDDSSafetyReleabilityChecker')  
	)
)


