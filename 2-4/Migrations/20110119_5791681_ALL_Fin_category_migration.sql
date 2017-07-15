DECLARE @ChoiceList VARCHAR (50)

-- updates for FLSCategory
SET @ChoiceList = 'FLS Category'

DELETE FROM T_CHOICELIST WHERE ChoiceList = @ChoiceList

INSERT INTO T_CHOICELIST (ChoiceList, ChoiceValue, ChoiceOrder)
	SELECT @ChoiceList, 'FIN SW SPP', null
	UNION SELECT @ChoiceList, 'SW CERTIF UPLOADED BY AIRBUS', null
	UNION SELECT @ChoiceList, 'SW CERTIF UPLOADED BY EXTERN', null
	UNION SELECT @ChoiceList, 'SW APPROVED UPLOADED BY AIRBUS', null
	UNION SELECT @ChoiceList, 'SW CUSTOMER EMPTY', null
	UNION SELECT @ChoiceList, 'SW CUSTOMER A380', null
	UNION SELECT @ChoiceList, 'SW APP UPLOADED BY AIRBUS CERT', null