-- Update choicelist for CR
Update Infobase SET list_val = 'LEADER;INVOLVED;NOT INVOLVED;POTENTIALLY INVOLVED;UNDER TECHNICAL STUDY' WHERE object_value = 'cr_Linvold' AND table_name = 'V_CR'

-- Update choicelist for RFC
Update Infobase SET list_val = 'LEADER;INVOLVED;NOT INVOLVED;POTENTIALLY INVOLVED;UNDER TECHNICAL STUDY' WHERE object_value = 'rfc_Linvold' AND table_name = 'V_RFC'

-- Update choicelist for MP
Update Infobase SET list_val = 'LEADER;INVOLVED;NOT INVOLVED;POTENTIALLY INVOLVED;UNDER TECHNICAL STUDY' WHERE object_value = 'LinvoldMP' AND table_name = 'T_MP'

-- Data migration for CR:
Update V_CR SET cr_Linvold = 'POTENTIALLY INVOLVED' WHERE cr_Linvold = 'POTENTIALLY IMPACTED'