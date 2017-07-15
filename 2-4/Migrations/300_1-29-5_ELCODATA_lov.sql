			
/**		
*** Add FIN CI Categories in List of Values for Search in PSE
*** Program : All programs
***************************************/
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','EQUIPMENT MOUNTED IN A DASSY',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','GENERIC SW',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','FIN LRM TYPE',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','LRU IN A SUBCONTRACTED CA',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','LRU LOADABLE SOFTWARE',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','LRU SOFTWARE IN A SUBCONTRACTED CA',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','AIRLINES SPARE ASSEMBLY',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','RCCB',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','LOAD GROUP',NULL)
INSERT INTO T_CHOICELIST (ChoiceList,ChoiceValue,ChoiceOrder) VALUES ('FINCategory','DATA TABLE',NULL)


/**		
*** Add N/A into DAL: update and add N/A in existing LoV All programs 
*** Program : All program
***************************************/
UPDATE infobase
SET list_val='A;B;C;D;E;N/A'
where object_value='DAL' 
AND table_name='R_Equipment'