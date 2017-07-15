/******************************************************************************************
		Alter T_MP
*******************************************************************************************/

-------- MPSysCentralCMComment 
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MP'
								  )
			 and syscolumns.name = 'MPSysCentralCMComment'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MPSysCentralCMComment] varchar(8000) NULL
	end
	else
	begin
		print 'Column MPSysCentralCMComment is alredy created'
	end

-------- MPTaskForceItem
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MP'
								  )
			 and syscolumns.name = 'MPTaskForceItem'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MPTaskForceItem] varchar(8000) NULL
	end
	else
	begin
		print 'Column MPTaskForceItem is alredy created'
	end

-------- MPTaskForceFollowUp
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MP'
								  )
			 and syscolumns.name = 'MPTaskForceFollowUp'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_MP ADD [MPTaskForceFollowUp] varchar(8000) NULL
	end
	else
	begin
		print 'Column MPTaskForceFollowUp is alredy created'
	end

/******************************************************************************************
		Alter T_REQUEST
*******************************************************************************************/
-------- A/C ICD IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_acIcdImpact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_acIcdImpact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_acIcdImpact is alredy created'
	end
	
	
-------- XML and/or FMD IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_xmlFmdImpact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_xmlFmdImpact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_xmlFmdImpact is alredy created'
	end
-------- C/B or RCCB or SSPC IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_cbRccbSspcImpact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_cbRccbSspcImpact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_cbRccbSspcImpact is alredy created'
	end
-------- SERVICE BULLETIN
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_sb'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_sb] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_sb is alredy created'
	end
-------- ATA 42 IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_Ata42Impact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_Ata42Impact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_Ata42Impact is alredy created'
	end
-------- ATQC IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_AtqcImpact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_AtqcImpact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_AtqcImpact is alredy created'
	end
-------- DSA REQUIRED
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_dsaRequired'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_dsaRequired] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_dsaRequired is alredy created'
	end
-------- DMU IMPACT
	if(
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'cr_dmuIpact'
		)
	)
	begin
		--Add the column
		ALTER TABLE T_REQUEST ADD [cr_dmuIpact] varchar(8000) NULL
	end
	else
	begin
		print 'Column cr_dmuIpact is alredy created'
	end

-------- WP Leader Code
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'WPLeaderCode'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [WPLeaderCode] varchar(8000) NULL
	end
	else
	begin
		print 'Column WPLeaderCode is already created'
	end

-------- MSN5
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'GIMSN5'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [GIMSN5] varchar(8000) NULL
	end
	else
	begin
		print 'Column GIMSN5 is already created'
	end
	
-------- MSN6
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'GIMSN6'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [GIMSN6] varchar(8000) NULL
	end
	else
	begin
		print 'Column GIMSN6 is already created'
	end

-------- MSN8
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'GIMSN8'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [GIMSN8] varchar(8000) NULL
	end
	else
	begin
		print 'Column GIMSN8 is already created'
	end

-------- MSN9
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'GIMSN9'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [GIMSN9] varchar(8000) NULL
	end
	else
	begin
		print 'Column GIMSN9 is already created'
	end

-------- MSN10
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'GIMSN10'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [GIMSN10] varchar(8000) NULL
	end
	else
	begin
		print 'Column GIMSN10 is already created'
	end

-------- JCR impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'JCRImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [JCRImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column JCRImpacted is already created'
	end

-------- SIRD & 3D Layout?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'SIRDand3DLayout'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [sirdAnd3DLayout] varchar(50) NULL
	end
	else
	begin
		print 'Column sirdAnd3DLayout is already created'
	end

-------- EIRD & 3D Model impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'EIRDand3DModelImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [EIRDand3DModelImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column EIRDand3DModelImpacted is already created'
	end

-------- SWRD & FD impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'SWRDandFDImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [SWRDandFDImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column SWRDandFDImpacted is already created'
	end

-------- ATA 24 ELA impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'ATA24ELAImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [ATA24ELAImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column ATA24ELAImpacted is already created'
	end

-------- Weight impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'WeightImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [WeightImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column WeightImpacted is already created'
	end

-------- Tests impacted? (Lab, GTR &/or FTR)
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'TestsImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [TestsImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column TestsImpacted is already created'
	end

-------- Lab tests means impacted?
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'LabTestsMeansImpacted'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [LabTestsMeansImpacted] varchar(50) NULL
	end
	else
	begin
		print 'Column LabTestsMeansImpacted is already created'
	end


-------- DistributionDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'DistributionDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [DistributionDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column DistributionDateText is already created'
	end


-------- LaunchingDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'LaunchingDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [LaunchingDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column LaunchingDateText is already created'
	end


-------- SYSCCC0ReleasedDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_REQUEST'
								  )
			 and syscolumns.name = 'SYSCCC0ReleasedDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_REQUEST ADD [SYSCCC0ReleasedDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column SYSCCC0ReleasedDateText is already created'
	end


/******************************************************************************************
		Alter T_MOD
*******************************************************************************************/

-------- MODTargetDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MOD'
								  )
			 and syscolumns.name = 'MODTargetDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_MOD ADD [MODTargetDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column MODTargetDateText is already created'
	end


-------- MODMASEASADateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MOD'
								  )
			 and syscolumns.name = 'MODMASEASADateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_MOD ADD [MODMASEASADateText] varchar(11) NULL
	end
	else
	begin
		print 'Column MODMASEASADateText is already created'
	end


/******************************************************************************************
		Alter T_MEETING
*******************************************************************************************/

-------- meetDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_MEETING'
								  )
			 and syscolumns.name = 'meetDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_MEETING ADD [meetDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column meetDateText is already created'
	end


/******************************************************************************************
		Alter T_ACTION
*******************************************************************************************/

-------- act_dateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_ACTION'
								  )
			 and syscolumns.name = 'act_dateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_ACTION ADD [act_dateText] varchar(11) NULL
	end
	else
	begin
		print 'Column act_dateText is already created'
	end

-------- act_closureDateText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_ACTION'
								  )
			 and syscolumns.name = 'act_closureDateText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_ACTION ADD [act_closureDateText] varchar(11) NULL
	end
	else
	begin
		print 'Column act_closureDateText is already created'
	end


/******************************************************************************************
		Alter T_DELTA1_FOLLOWUP
*******************************************************************************************/

-------- removalDateFText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_DELTA1_FOLLOWUP'
								  )
			 and syscolumns.name = 'removalDateFText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_DELTA1_FOLLOWUP ADD [removalDateFText] varchar(11) NULL
	end
	else
	begin
		print 'Column removalDateFText is already created'
	end


-------- removalDateAText
	if (
		NOT exists (
			select *
			from syscolumns
			where syscolumns.id = (	select sysobjects.id
									from sysobjects
									where name = 'T_DELTA1_FOLLOWUP'
								  )
			 and syscolumns.name = 'removalDateAText'
		)
	)
	begin
		-- Add the column
		ALTER TABLE T_DELTA1_FOLLOWUP ADD [removalDateAText] varchar(11) NULL
	end
	else
	begin
		print 'Column removalDateAText is already created'
	end

