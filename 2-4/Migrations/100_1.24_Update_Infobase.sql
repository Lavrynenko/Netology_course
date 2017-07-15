UPDATE  
	Infobase
SET 
	list_val = 'SELECT ChoiceValue FROM T_CHOICELIST WHERE ChoiceList = "FINCategory"'
WHERE 
	object_value = 'FINCategory'


DELETE FROM T_CHOICELIST WHERE Choicelist='FINCategory'

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','CUSTOMER SW')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','FIN MOUNTED IN A DASSY')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','FIN POSITION')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','FIN SW SPP')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','GENERIC SOFTWARE')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LIGHTED PLATE XXXX VU')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRI')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRI SOFTWARE')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRM TYPE')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRU')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRU IN A CA')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRU IN PRIMARY')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRU SOFTWARE')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','MONUMENT')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','MULTI-LOADING SW')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','MULTIPLE QUANTITY FIN')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','PHANTOM')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','PRIMARY')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','SSPC')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','STANDARD ITEM')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','MASTER FIN')

INSERT INTO T_CHOICELIST (Choicelist,ChoiceValue) 
	VALUES('FINCategory','LRU IN MASTER FIN')

