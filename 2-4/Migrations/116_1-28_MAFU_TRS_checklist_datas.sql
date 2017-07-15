-- Clear the table T_CHECKLIST_DEFINITION
DELETE FROM T_CHECKLIST_DEFINITION

--------
-- MP --
--------

-- Level 0 : MP

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
VALUES (NULL, 'MP', 0, 0, 10)


-- Level 20 : Question groups

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'TITLE', 20, id_definition_checklist, 20
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'REASON', 20, id_definition_checklist, 40
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'EXPECTED APPLICABILITY', 20, id_definition_checklist, 60
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'DESCRIPTION OF THE REQUEST', 20, id_definition_checklist, 80
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'DESIGN REPLY', 20, id_definition_checklist, 100
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'NECESSARY TO OBTAIN / MAINTAIN TYPE CERTIFICATION', 20, id_definition_checklist, 120
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPLEMENTATION CONDITIONS', 20, id_definition_checklist, 140
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'INTERCHANGEABILITY AFFECTED', 20, id_definition_checklist, 160
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'DESIGN INVOLVED', 20, id_definition_checklist, 180
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MP'


-- Level 30 : Questions

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPTitle', 'ATA - sub-ATA - imperative verb - short precise relevant title (consistent with TRS)', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TITLE'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPReason', 'Does it correspond to the change proposed ? CR / RFC / RFW ? ', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'REASON'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPExpectedApplicability', 'Standard / RFC / Industrial choice. Consistent with TRS?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'EXPECTED APPLICABILITY'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPDescriptionOfTheRequest', '- Explain the need for the mod (why?), what has to be corrected / improved, what has been requested (e.g. for RFC).<br>- Indicate location of change (if appropriate)', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'DESCRIPTION OF THE REQUEST'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPDesignReply', 'Short and precise - what is embodied by the mod.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'DESIGN REPLY'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPNecessaryToObtainMaintainTC', '- Has the Change''s impact on TYPE CERTIF been analysed?<br>- Correct classification & consistent with TRS?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'NECESSARY TO OBTAIN / MAINTAIN TYPE CERTIFICATION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPImplementationConditions', 'Series Solution / SB Solution / Series and SB solution / Temporary solution - consistent with TRS?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPLEMENTATION CONDITIONS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPInterchangeabilityAffected', 'Consistent with TRS Sheet 2, 4 and 5 ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'INTERCHANGEABILITY AFFECTED'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'MPDesignInvolved', 'Consistent with IS and sheet 4 of TRS', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'DESIGN INVOLVED'


-----------------
-- Type of TRS --
-----------------

-- Level 0 : TRS

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
VALUES (NULL, 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>', 0, 0,  200)


-- Level 10 : 'Sheet 0' to 'Sheet 6'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 0', 10, id_definition_checklist, 210
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 1', 10, id_definition_checklist, 240
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 2', 10, id_definition_checklist, 350
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 3', 10, id_definition_checklist, 440
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 4', 10, id_definition_checklist, 470
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 5', 10, id_definition_checklist, 620
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Sheet 6', 10, id_definition_checklist, 670
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TRS <font size="3" color="black">Type of TRS: PFS, FFS, Full TRS, Concept TRS for Short Loop</font>'


-- Level 20 : Question groups

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'COMMENT / REASON', 20, id_definition_checklist, 220
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 0'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'MODELS', 20, id_definition_checklist, 250
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 1'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'ENGINEERING DEADLINE', 20, id_definition_checklist, 270
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 1'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'TO BE EMBODIED BEFORE / RESTRICTIONS CANCELLED', 20, id_definition_checklist, 290
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 1'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'GENERAL DESCRIPTION', 20, id_definition_checklist, 310
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 1'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'LINKED MODIFICATIONS', 20, id_definition_checklist, 330
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 1'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'REGULATIONS INVOLVED AND JUSTIFICATION', 20, id_definition_checklist, 360
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 2'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACT ON EQUIPMENT', 20, id_definition_checklist, 380
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 2'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'INTERCHANGEABILITY CODE', 20, id_definition_checklist, 400
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 2'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACT ON APPROVED DOCUMENTATION', 20, id_definition_checklist, 420
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 2'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'SKETCHES', 20, id_definition_checklist, 450
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 3'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'Additional ATA', 20, id_definition_checklist, 480
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'VERIFICATION / VALIDATION MEANS', 20, id_definition_checklist, 500
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACTS ON WEIGHT', 20, id_definition_checklist, 520
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACTS ON ELECTRICAL LOADS', 20, id_definition_checklist, 540
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACTED DOCUMENTATION', 20, id_definition_checklist, 560
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'IMPACTED STANDARD SPECIFICATION', 20, id_definition_checklist, 580
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'DETAILED DESCRIPTION', 20, id_definition_checklist, 600
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 4'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'PRODUCT STRUCTURE IMPACTS', 20, id_definition_checklist, 630
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 5'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'OTHER IMPACTS', 20, id_definition_checklist, 650
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 5'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'DESIGN INVOLVEMENT / DESIGN RESPONSIBLE', 20, id_definition_checklist, 680
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 6'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT NULL, 'ACTIVITIES', 20, id_definition_checklist, 700
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Sheet 6'


-- Level 30 : Questions

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S0CommentReason', 'TRS type then precise reason for issue and indicate sheets modified.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'COMMENT / REASON'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S1Models', 'Is it coherent with A/C type?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'MODELS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S1EngineeringDeadline', 'Consistent with mod content?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'ENGINEERING DEADLINE'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S1ToBeEmbBefRestrCancel', 'Is it clearly defined ? / to be used after type certif only.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'TO BE EMBODIED BEFORE / RESTRICTIONS CANCELLED'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S1GeneralDescription', '- Reasons and context are they clearly defined ?<br>- Is the description detailed enough ?<br>- Avoid mentioning customer specific information in order to re-use the description for future SCN''s.<br>- Effect on maintenance and operational procedures.<br>- Pin-programming to be actived or deactived.<br>- Interchangeability impacts explained ?<br>- Interdependence aspects checked and clear ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'GENERAL DESCRIPTION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S1LinkedModifications', 'Relationships of any Modification, which is directly linked to the proposed change:<br>Is it correctly identified ?<br>Are mixability conditions clear ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'LINKED MODIFICATIONS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S2RegulInvolAndJustif', '- Are the regulations and justification correctly listed ?<br>- If Basic Change, provide Certification plan.<br>- If improvement CR or RFC, identify regulations involved and provide the MoC<br>- Coherence with field  &quot;CLASSIFICATION &quot; in sheet 1.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'REGULATIONS INVOLVED AND JUSTIFICATION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S2ImpactOnEquipment', '- All FINs and FIN REP identified ? <br>- Is the pre Mod correctly identified ? (coherence with System View)<br>- BFE / SFE identified?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACT ON EQUIPMENT'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S2InterchangeabilityCode', 'Is it correct? Conditions identified, if any.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'INTERCHANGEABILITY CODE'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S2ImpactOnApprovedDoc', 'Impacts identified and consistent with mod category?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACT ON APPROVED DOCUMENTATION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S3Sketches', 'Are the sketches clearly presented / labelled ?<br>Sketches of good quality and readable ?<br>Has the modificaton leader gathered all the sketches ?<br>Location / zoning of the change on the A/C ?<br>Pre MOD and Post MOD on the same sheet as far as possible.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'SKETCHES'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4AdditionalATA', 'All ATA/subATA impacted by this mod listed?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'Additional ATA'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4VerificationValidationMeans', '- Have the tests to qualify the change correctly been identified ? Specify in comment field the test bench used and the test reference number (if applicable). Type of Flight Test.<br>- Coherence with detailed description', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'VERIFICATION / VALIDATION MEANS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4ImpactsOnWeight', 'Have all weight impacts been compiled (from all involved) ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACTS ON WEIGHT'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4ImpactsOnElectricalLoads', '- Electrical loads impacts identified ?<br>- Has the impact on the Electrical Power Supply (EPS) been detailed on sheet 4 ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACTS ON ELECTRICAL LOADS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4ImpactedDocumentation', 'All impacts identified? (IPC / FCOM / TSM….. all other non-approved manuals)', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACTED DOCUMENTATION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4ImpactedStandardSpec', '- Has the impact on standard Specification been analysed ?<br>- Has the need for an MSCN been considered ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'IMPACTED STANDARD SPECIFICATION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S4DetailedDescription', '- Does the change generate specific design ?<br>- Is the description sufficiently detailed ?<br>- Does it contains enough technical information ?<br>- Has the work sharing correctly been done? Per FIC? Per ATA chapter?<br>- Zoning / Mod breakdown<br>- Have the following impacts been checked: AFDX / IMA, ISCD, CHIFS, ATA24 mod custo (EDDs), SPP, HPP, FWS, CDS, OPC, Ventilation, ICP, Lighted Plate', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'DETAILED DESCRIPTION'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S5ProductStructureImpacts', 'Impacts on Product Structure full and complete?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'PRODUCT STRUCTURE IMPACTS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S5OtherImpacts', 'All impacts identified?  Including PD refs in comment field.', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'OTHER IMPACTS'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S6DesignInvolvDesignResp', 'Is it coherent with the detailed description, MP, and IS? Correctly named?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'DESIGN INVOLVEMENT / DESIGN RESPONSIBLE'

INSERT INTO T_CHECKLIST_DEFINITION (checklist_element_name, checklist_element_label, checklist_element_level, checklist_element_father_idr, checklist_element_order) 
SELECT 'S6Activities', 'Is it coherent with the detailed description ?', 30, id_definition_checklist, checklist_element_order+10
FROM T_CHECKLIST_DEFINITION WHERE checklist_element_label = 'ACTIVITIES'

