--------------------------------------
-----------Moving datas---------------
--------------------------------------
/*Update internal/external location datas from APEDD
The PSE_Excel Report need field Weight_location from R_FIN_CI*/

UPDATE R_FIN_CI SET 
	Weight_location = InstallationLocation
FROM
	DBWDB570..FIN_CI RFIN_LOC
	JOIN R_FIN_CI ON R_FIN_CI.FIN = RFIN_LOC.FinCI