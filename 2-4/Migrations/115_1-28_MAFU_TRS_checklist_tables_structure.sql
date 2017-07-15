----------------------------
-- T_CHECKLIST_DEFINITION --
----------------------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CHECKLIST_DEFINITION]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[T_CHECKLIST_DEFINITION]
GO

CREATE TABLE [dbo].[T_CHECKLIST_DEFINITION] (
	[id_definition_checklist] [int] IDENTITY (1, 1) NOT NULL ,
	[checklist_element_name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[checklist_element_label] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[checklist_element_level] [int] NULL ,
	[checklist_element_father_idr] [int] NULL ,
	[checklist_element_order] [int] NULL 
) ON [PRIMARY]
GO


-----------------
-- T_CHECKLIST --
-----------------

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_CHECKLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table [dbo].[T_CHECKLIST]
GO

CREATE TABLE [dbo].[T_CHECKLIST] (
	[id_checklist] [int] IDENTITY (1, 1) NOT NULL ,
	[idr_mp] [int] NOT NULL ,
	[MPTitle] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPReason] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPExpectedApplicability] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPDescriptionOfTheRequest] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPDesignReply] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPNecessaryToObtainMaintainTC] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPImplementationConditions] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPInterchangeabilityAffected] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MPDesignInvolved] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S0CommentReason] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S1Models] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S1EngineeringDeadline] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S1ToBeEmbBefRestrCancel] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S1GeneralDescription] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S1LinkedModifications] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S2RegulInvolAndJustif] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S2ImpactOnEquipment] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S2InterchangeabilityCode] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S2ImpactOnApprovedDoc] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S3Sketches] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4AdditionalATA] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4VerificationValidationMeans] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4ImpactsOnWeight] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4ImpactsOnElectricalLoads] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4ImpactedDocumentation] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4ImpactedStandardSpec] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S4DetailedDescription] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S5ProductStructureImpacts] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S5OtherImpacts] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S6DesignInvolvDesignResp] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[S6Activities] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

