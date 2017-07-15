------------------------------------------------------------------------------------------------
-------------------------------FIN CI HW DATA LOADER UPDATE-------------------------------------
------------------------------------------------------------------------------------------------


DECLARE @FIN1 varchar(10), @FIN2 varchar(10), @FIN3 varchar(10), @FIN4 varchar(10)

SET @FIN1 = ''
SET @FIN2 = ''
SET @FIN3 = ''
SET @FIN4 = ''

select @FIN1=id_fin from R_FIN_CI where FIN = '102HWSW1'
select @FIN2=id_fin from R_FIN_CI where FIN = '1TF1'

IF(@FIN1 != '' AND @FIN2 !='' ) 
BEGIN

UPDATE r_fin_link
	SET id_fin_link = @FIN2
		where idr_fin_link = @FIN1 AND link_type = 'DATA LOADER'
	PRINT 'DATA LOADER has been updated 102HWSW1 => 1TF1'
		
	
END

select @FIN3=id_fin from R_FIN_CI where FIN = '202HWSW1'
select @FIN4=id_fin from R_FIN_CI where FIN = '1TF2'


IF(@FIN3 != '' AND @FIN4 !='' ) 
BEGIN

UPDATE r_fin_link
	SET id_fin_link = @FIN4 
		where idr_fin_link = @FIN3 AND link_type = 'DATA LOADER'

	PRINT 'DATA LOADER has been updated 202HWSW1 => 1TF2'
END
