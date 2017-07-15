/******************************************************************************************
		Create Tables T_IPT_LEADER and T_WP_LEADER_CODE
*******************************************************************************************/

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_IPT_LEADER]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_IPT_LEADER]
GO

CREATE TABLE [dbo].[T_IPT_LEADER] (
	[id_ipt_leader] [int] IDENTITY (1, 1)  NOT NULL ,
	[ipt_leader_name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[T_WP_LEADER_CODE]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[T_WP_LEADER_CODE]
GO

CREATE TABLE [dbo].[T_WP_LEADER_CODE] (
	[id_wp_leader_code] [int] IDENTITY (1, 1) NOT NULL ,
	[code] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[idr_ipt_leader] [int] NULL 
) ON [PRIMARY]
GO
