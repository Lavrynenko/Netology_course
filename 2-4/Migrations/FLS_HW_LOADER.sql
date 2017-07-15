-- Hardware
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tmp_fls_hw]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo]. [tmp_fls_hw]
GO
CREATE TABLE tmp_fls_hw (
	[Host HW FIN] varchar(8000),
	[H/W Group] varchar(8000)
)
-- select * from tmp_fls_hw

-- Read csv file
BULK INSERT tmp_fls_hw FROM '\\172.19.2.157\SHARE\FLS3\HW.csv' WITH (FIELDTERMINATOR =';', ROWTERMINATOR ='\n')

-- Update HW FIN
UPDATE R_FIN_CI SET
	R_FIN_CI.fincihwgroup = REPLACE([H/W Group], 'N/A', '')
FROM
	R_FIN_CI
	JOIN tmp_fls_hw ON tmp_fls_hw.[Host HW FIN] = R_FIN_CI.fin
--WHERE
--	tmp_fls_hw.[Host HW FIN] != 'Host HW FIN'
		
DROP TABLE tmp_fls_hw