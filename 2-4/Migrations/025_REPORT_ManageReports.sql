--------------------------------------------------------------------------------
-- MANAGE REPORTS (ADD, UPDATE, DELETE)
--
-- @program		A400M
-- @version		2.0
-- @module		ELCODATA
--
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Delete several reports
--      - MAFU ACMT SYS FCP KPIS REPORT - CR RECEIVED
--      - MAFU ACMT SYS FCP KPIS REPORT - MP&MOD REGISTER
--      - MAFU CR WITH WRONG LINKED ATA IN ICC OR EROOM
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- T_DBACTIONS Delete
--------------------------------------------------------------------------------

-- Delete report 'MAFU ACMT SYS FCP KPIS REPORT - CR RECEIVED'
DELETE FROM T_DBActions WHERE label='MAFU ACMT SYS FCP KPIS REPORT - CR RECEIVED'

-- Delete report 'MAFU ACMT SYS FCP KPIS REPORT - MP&MOD REGISTER'
DELETE FROM T_DBActions WHERE label='MAFU ACMT SYS FCP KPIS REPORT - MP&MOD REGISTER'

-- Delete report 'MAFU CR WITH WRONG LINKED ATA IN ICC OR EROOM'
DELETE FROM T_DBActions WHERE label='MAFU CR WITH WRONG LINKED ATA IN ICC OR EROOM'

