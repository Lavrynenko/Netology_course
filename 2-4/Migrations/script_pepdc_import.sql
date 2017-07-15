UPDATE R_FIN_DS SET 
	EDDReference = ATACode + Circuit_Letter + [AC/DC Type] + REPLICATE('0', 6 - LEN(NewC)) + NewC + 'V000',    
	R_FIN_DS.EDDFuncDesignation = PEPDC.[EDD Proposed designation],
	R_FIN_DS.EDDComment = PEPDC.[EDD Comment],
	R_FIN_DS.TypeOfProtection = PEPDC.[Device Type],
	R_FIN_DS.ICDFD = PEPDC.[ICD Functional Designation - Spare and Growth],
	R_FIN_DS.Rating = CONVERT(FLOAT,REPLACE(PEPDC.[Rating (A)],',','.')),	
	R_FIN_DS.EDDCR = PEPDC.[EDD CR],
	R_FIN_DS.EDDRFC = PEPDC.[EDD RFC],
	R_FIN_DS.EDDSupposedEffectivity = PEPDC.[EDD Supposed Effectivity],
	-- R_FIN_DS.EDDLoad = PEPDC.[EDD Load FIN],
	-- R_FIN_DS.idrMP = PEPDC.[MP],
	R_FIN_DS.Panel = PEPDC.[Power Center],
	R_FIN_DS.PowerCenterType = PEPDC.[Power Center Type],
	R_FIN_DS.GroundServiceSupply = PEPDC.[Ground Service Supply],
	R_FIN_DS.SubBusBar = PEPDC.[Sub Busbar],
	R_FIN_DS.Busbar = PEPDC.[Busbar],	
	R_FIN_DS.AllocatedPhase = PEPDC.[Allocated Phase],
	R_FIN_DS.TypePhase = PEPDC.[Phase Type],
	R_FIN_DS.NominalPower = CONVERT(FLOAT,REPLACE(PEPDC.[Nominal Power (W or V#A)],',','.')),
	R_FIN_DS.NPP1 = CONVERT(FLOAT,REPLACE(PEPDC.[Nominal Power PhA (V#A)],',','.')),
	R_FIN_DS.NPP2 = CONVERT(FLOAT,REPLACE(PEPDC.[Nominal Power PhB (V#A)],',','.')),
	R_FIN_DS.NPP3 = CONVERT(FLOAT,REPLACE(PEPDC.[Nominal Power PhC (V#A)],',','.')),
	R_FIN_DS.PowerFactor = CONVERT(FLOAT,REPLACE(PEPDC.[Power Factor],',','.')),
	R_FIN_DS.InrushCurrent = CONVERT(FLOAT,REPLACE(PEPDC.[Inrush Current (A)],',','.')),
	R_FIN_DS.Duration = PEPDC.[Inrush Duration (ms)],
	R_FIN_DS.Classification = PEPDC.[Classification],
	R_FIN_DS.FamilyLoad = PEPDC.[Family],
	R_FIN_DS.OperationalBehaviour = PEPDC.[Operating Mode],
	R_FIN_DS.Sheddable = PEPDC.[Sheddable], 
	R_FIN_DS.TypeACDC = PEPDC.[AC/DC Type],
	R_FIN_DS.Monitored = PEPDC.[Monitored by CBMF],
	R_FIN_DS.SecuredOpen = PEPDC.[Secured Open],
	R_FIN_DS.FullProvisionStatus = PEPDC.[Full Provision Status ],
	R_FIN_DS.Side = PEPDC.[SIDE],
	R_FIN_DS.EDDOption = PEPDC.[EDD Option],
	R_FIN_DS.ReferenceConnector = PEPDC.[Power Output Connector],
	R_FIN_DS.PINAllocation = PEPDC.[Power Output Pin Allocation],
	R_FIN_DS.PCDStatCon = PEPDC.[P/CD Status Connector],
	R_FIN_DS.PCDStatPin = PEPDC.[P/CD Status Pin Allocation],
	R_FIN_DS.PCDCont1Con = PEPDC.[P/CD CTL 1 Connector],
	R_FIN_DS.PCDCont1Pin = PEPDC.[P/CD CTL 1 Pin Allocation],
	R_FIN_DS.PCDCont2Con = PEPDC.[P/CD CTL 2 Connector],
	R_FIN_DS.PCDCont2Pin = PEPDC.[P/CD CTL 2 Pin Allocation],
	R_FIN_DS.PCDCont3Con = PEPDC.[P/CD CTL 3 Connector],
	R_FIN_DS.PCDCont3Pin = PEPDC.[P/CD CTL 3 Pin Allocation],
	R_FIN_DS.SheddableOnConfiguration = PEPDC.[Sheddable On Configuration],
	R_FIN_DS.SheddableOnOverload = PEPDC.[Sheddable On Overload],
	R_FIN_DS.RCCBMNb = PEPDC.[RCCBM Number],
	R_FIN_DS.RCCBFrame = PEPDC.[RCCB Frame],    
	R_FIN_DS.ProtectionIndex = PEPDC.[Protection Index],	
	R_FIN_DS.CurrentFrame = PEPDC.[Current Frame],
	R_FIN_DS.GroupShedding = PEPDC.[ENMF Priority],
	R_FIN_DS.CtlDiscrete = PEPDC.[CTL by Discrete],
	R_FIN_DS.TripCurve = PEPDC.[Route],
	R_FIN_DS.CBTrip1Frame = ISNULL(PEPDC.[C/B Trip 1], 'N/A'),
	R_FIN_DS.CBTrip2Frame = ISNULL(PEPDC.[C/B Trip 2], 'N/A'),
	R_FIN_DS.DiscreteFrame = PEPDC.[Discrete Frame],
	R_FIN_DS.Group_ = PEPDC.[Group],
	R_FIN_DS.Priority = PEPDC.[Airline Ground Priority],    
	R_FIN_DS.FlightPriority = PEPDC.[Airline Flight Priority],    
	R_FIN_DS.SysGPriority = PEPDC.[System Ground Priority],    
	R_FIN_DS.SysFPriority = PEPDC.[System Flight Priority],   
	R_FIN_DS.GroundServMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[GroundServMax],',','.'))),  
	R_FIN_DS.TurnAround0015Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround0015Max],',','.'))),
	R_FIN_DS.TurnAround1530Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround1530Max],',','.'))),
	R_FIN_DS.TurnAround3045Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround3045Max],',','.'))),
	R_FIN_DS.TurnAround4560Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround4560Max],',','.'))),
	R_FIN_DS.TurnAround6075Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround6075Max],',','.'))),
	R_FIN_DS.TurnAround7590Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround7590Max],',','.'))),
	R_FIN_DS.TurnAround90105Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround90105Max],',','.'))),
	R_FIN_DS.TurnAround105120Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround105120Max],',','.'))),
	R_FIN_DS.TurnAround120135Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround120135Max],',','.'))),
	R_FIN_DS.TurnAround135150Max = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround135150Max],',','.'))),
	R_FIN_DS.TurnAround0015Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround0015Op],',','.'))),
	R_FIN_DS.TurnAround1530Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround1530Op],',','.'))),
	R_FIN_DS.TurnAround3045Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround3045Op],',','.'))),
	R_FIN_DS.TurnAround4560Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround4560Op],',','.'))),
	R_FIN_DS.TurnAround6075Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround6075Op],',','.'))),
	R_FIN_DS.TurnAround7590Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround7590Op],',','.'))),
	R_FIN_DS.TurnAround90105Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround90105Op],',','.'))),
	R_FIN_DS.TurnAround105120Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround105120Op],',','.'))),
	R_FIN_DS.TurnAround120135Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround120135Op],',','.'))),
	R_FIN_DS.TurnAround135150Op = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TurnAround135150Op],',','.'))),
	R_FIN_DS.PushBackMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[PushBackMax],',','.'))),
	R_FIN_DS.StartMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[StartMax],',','.'))),
	R_FIN_DS.RollMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[RollMax],',','.'))),
	R_FIN_DS.TakeOffMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TakeOffMax],',','.'))),
	R_FIN_DS.ClimbMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[ClimbMax],',','.'))),
	R_FIN_DS.CruiseMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[CruiseMax],',','.'))),
	R_FIN_DS.DescentMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[DescentMax],',','.'))),
	R_FIN_DS.LandingMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[LandingMax],',','.'))),
	R_FIN_DS.TaxiMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TaxiMax],',','.'))),
	R_FIN_DS.SpareMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[SpareMax],',','.'))),
	R_FIN_DS.EmerConfMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[EmerConfMax],',','.'))),
	R_FIN_DS.EmerConfOutMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[EmerConfOutMax],',','.'))),
	R_FIN_DS.BatConfMax = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[BatConfMax],',','.'))),
	R_FIN_DS.GroundServOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[GroundServOp],',','.'))), 
	R_FIN_DS.PushBackOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[PushBackOp],',','.'))),
	R_FIN_DS.StartOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[StartOp],',','.'))),
	R_FIN_DS.RollOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[RollOp],',','.'))),
	R_FIN_DS.TakeOffOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TakeOffOp],',','.'))),
	R_FIN_DS.ClimbOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[ClimbOp],',','.'))),
	R_FIN_DS.CruiseOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[CruiseOp],',','.'))),
	R_FIN_DS.DescentOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[DescentOp],',','.'))),
	R_FIN_DS.LandingOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[LandingOp],',','.'))),
	R_FIN_DS.TaxiOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[TaxiOp],',','.'))),
	R_FIN_DS.SpareOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[SpareOp],',','.'))),
	R_FIN_DS.EmerConfOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[EmerConfOp],',','.'))),
	R_FIN_DS.EmerConfOutOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[EmerConfOutOp],',','.'))),
	R_FIN_DS.BatConfOp = CONVERT(NUMERIC,CONVERT(FLOAT,REPLACE(PEPDC.[BatConfOp],',','.'))),
	R_FIN_DS.DIActive = '',    
	R_FIN_DS.DiscreteOutput = '',
	R_FIN_DS.ds_type = 4,
	R_FIN_DS.MG = 0
FROM
	PEPDC
	JOIN
	(
		SELECT
			nid,
			CONVERT(VARCHAR(8000), ISNULL((
				SELECT
					COUNT(*) C
				FROM
					PEPDC A
					JOIN R_FIN_CI B ON B.FIN = A.[EDD Load FIN]
					JOIN R_ATA C ON C.id_ata = B.idr_ata
				WHERE
					C.ATACode = R_ATA.ATACode
					AND A.nid <= PEPDC.nid
			), 0) + ISNULL(MAXC, -1)) NewC
		FROM
			PEPDC
			JOIN R_FIN_CI ON R_FIN_CI.FIN = PEPDC.[EDD Load FIN]
			JOIN R_ATA ON R_ATA.id_ata = R_FIN_CI.idr_ata
			LEFT JOIN
			(
				SELECT
					LEFT(EDDReference, 4) ATA,
					MAX(CONVERT(INT, SUBSTRING(EDDReference, 9, 6))) MAXC
				FROM
					R_FIN_DS
				WHERE
					LEN(EDDReference) = 18
				GROUP BY
					LEFT(EDDReference, 4)
			) MAXATA ON MAXATA.ATA = R_ATA.ATACode
	) C ON C.nid = PEPDC.nid
	JOIN R_FIN_CI ON R_FIN_CI.FIN = PEPDC.[EDD Load FIN]
	JOIN R_ATA ON R_ATA.id_ata = R_FIN_CI.idr_ata
	JOIN R_FIN_DS ON R_FIN_DS.idr_fin = R_FIN_CI.id_fin
	LEFT JOIN T_MP ON T_MP.id_mp = R_FIN_DS.idr_mp
WHERE
	ISNULL(T_MP.MPReference, '') = ISNULL(PEPDC.[EDD MP], '')

