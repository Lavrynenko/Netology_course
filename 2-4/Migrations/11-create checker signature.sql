
-- update of feature (linked to CC role, must be checked role)
IF (SELECT count(*) FROM T_EDIP_FEATURE WHERE FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalWD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20WDDS') = 0
BEGIN
update T_EDIP_FEATURE
set FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalWD_form&amp;role=CHK&amp;title=Batch%20Request%20Approval%20WDDS'
where FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalWD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20WDDS'
END 

IF (SELECT count(*) FROM T_EDIP_FEATURE WHERE FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalPD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20PDDS') = 0
BEGIN 
update T_EDIP_FEATURE
set FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalPD_form&amp;role=CHK&amp;title=Batch%20Request%20Approval%20PDDS'
where FeatureLinkedPage = '?action=listAndAction_form&amp;data=ata&amp;todo=batch_request_approvalPD_form&amp;role=CC&amp;title=Batch%20Request%20Approval%20PDDS'
END 



declare 
	@att int

-- manage checker signature for WDDS
-- Add column 

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='WDDSSignCheckerName') = 0
BEGIN
ALTER TABLE t_wdds
ADD 
WDDSSignCheckerName varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Name' as [AttributeLabel]
	,'WDDSSignCheckerName' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+5 from t_edip_attribute where tablename = 't_wdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'WDDSSignCCName'
END

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='WDDSSignCheckerVote') = 0
BEGIN
ALTER TABLE t_wdds
ADD 
WDDSSignCheckerVote varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote' as [AttributeLabel]
	,'WDDSSignCheckerVote' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+1 from t_edip_attribute where tablename = 't_wdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'WDDSSignCCVote'
END

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='WDDSSignCheckerVoteDate') = 0
BEGIN
ALTER TABLE t_wdds
ADD 
WDDSSignCheckerVoteDate varchar(10) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote Date' as [AttributeLabel]
	,'WDDSSignCheckerVoteDate' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+1 from t_edip_attribute where tablename = 't_wdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'WDDSSignCCVoteDate'
END


IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='WDDSSignCheckerVoteComm') = 0
BEGIN
ALTER TABLE t_wdds
ADD 
WDDSSignCheckerVoteComm varchar(8000) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote Commentary' as [AttributeLabel]
	,'WDDSSignCheckerVoteComm' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+1 from t_edip_attribute where tablename = 't_wdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'WDDSSignCCVoteComm'
END


-- update rights for attributes
-- for WDDSSignCheckerName
select @att = attribute_id from T_EDIP_ATTRIBUTE where attributename = 'WDDSSignCheckerName' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END


-- for WDDSSignCheckerVote
select @att = attribute_id from T_EDIP_ATTRIBUTE where attributename = 'WDDSSignCheckerVote' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END

-- for WDDSSignCheckerVoteDate
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'WDDSSignCheckerVoteDate' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END

-- for WDDSSignCheckerVoteComm
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'WDDSSignCheckerVoteComm' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END




-- manage checker signature for PDDS
-- Add column 
IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='PDDSSignCheckerName') = 0
BEGIN
ALTER TABLE t_pdds
ADD 
PDDSSignCheckerName varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Name' as [AttributeLabel]
	,'PDDSSignCheckerName' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+5 from t_edip_attribute where tablename = 't_pdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'PDDSSignCCName'
END

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='PDDSSignCheckerVote') = 0
BEGIN
ALTER TABLE t_pdds
ADD 
PDDSSignCheckerVote varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote' as [AttributeLabel]
	,'PDDSSignCheckerVote' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+5 from t_edip_attribute where tablename = 't_pdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'PDDSSignCCName'
END

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='PDDSSignCheckerVoteDate') = 0
BEGIN
ALTER TABLE t_pdds
ADD 
PDDSSignCheckerVoteDate varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote Date' as [AttributeLabel]
	,'PDDSSignCheckerVoteDate' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+5 from t_edip_attribute where tablename = 't_pdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'PDDSSignCCName'
END

IF (SELECT count(*) FROM T_EDIP_ATTRIBUTE WHERE AttributeName='PDDSSignCheckerVoteComm') = 0
BEGIN
ALTER TABLE t_pdds
ADD 
PDDSSignCheckerVoteComm varchar(50) null

-- create attribute in edip
insert into [T_EDIP_ATTRIBUTE]
SELECT 
	[ATTRIBUTE_ATTRIBUTE_GROUP_idr],
	'Checker Vote Commentary' as [AttributeLabel]
	,'PDDSSignCheckerVoteComm' as [AttributeName]
	,[TableName],[SearchType],[EditType],[ReducedView],[AttributeType],[AttributeTypeFormat]
	,(select max(attributeorder)+5 from t_edip_attribute where tablename = 't_pdds' and attributeorder < 900) as [AttributeOrder]
	,[AttributeDescription],[ValuesList],[ExternalInterface],[AttributeLinkedPage],[RepositoryLocation],[FastSearch],
	[FieldSize],[MaxLength],[ReadOnly],[Mandatory],[AttributeCommentField],[QCStatusPonderation],[XPath]
FROM [T_EDIP_ATTRIBUTE] 
where attributename = 'PDDSSignCCName'
END


-- update rights for attributes	
-- for PDDSSignCheckerName
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'PDDSSignCheckerName' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END


-- for PDDSSignCheckerVote
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'PDDSSignCheckerVote' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END


-- for PDDSSignCheckerVoteDate
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'PDDSSignCheckerVoteDate' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END


-- for PDDSSignCheckerVoteComm
select @att = attribute_id from T_EDIP_ATTRIBUTE 	where attributename = 'PDDSSignCheckerVoteComm' 

IF (SELECT count(*) FROM T_EDIP_LINK_ATTRIBUTE__CONTEXT WHERE ATTRIBUTE__CONTEXT_ATTRIBUTE_idr=@att) = 0
BEGIN
insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'Admin'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_DO'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_FTI'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Viewer_Labo'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
1 as AttributeContextReadMode, 0 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Central_Administrator'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Checker'

insert into T_EDIP_LINK_ATTRIBUTE__CONTEXT 
select @att as ATTRIBUTE__CONTEXT_ATTRIBUTE_idr, context_id as ATTRIBUTE__CONTEXT_CONTEXT_idr, 
0 as AttributeContextReadMode, 1 as AttributeContextWriteMode from t_edip_context
where contextname = 'A400M_Approver'
END

