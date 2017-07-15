DECLARE @version varchar(10)
DECLARE @program varchar(10)

SET @version = '1.33.3'
SET @program = 'A400M'

IF((SELECT count(*) FROM application_setup where application_program = @program and application_version+'.'+application_patch like @version+'%') = 1)
BEGIN
	DECLARE @fin_cat varchar(100)
	SET @fin_cat='$(FIN_CAT)'

	if((select count(*) from t_choicelist where choicelist ='FINCategory' and choicevalue = @fin_cat) = 1)
	BEGIN
		IF((SELECT count(*) FROM t_choicelist where choicelist ='FLS Category' and choicevalue = @fin_cat) = 1)
		BEGIN
			PRINT('This FLS Fin Category already exists in PSE, add double is not possible ')
		END
		ELSE
		BEGIN
			INSERT INTO t_choicelist (Choicelist, Choicevalue) VALUES ('FLS Category',@fin_cat)
		END
	END
	ELSE
	BEGIN
		PRINT('It is not possible to add this FLS fin category if Fin category does not exist in PSE, please contact support Level 3')
	END
END
ELSE
BEGIN
	print 'This script can be run only  on the '+@program+' program and for PSE '+@version
	print 'Please contact support level 3 of PSE'
END

