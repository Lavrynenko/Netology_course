--A400M : change list for Fin category

delete from t_choicelist where ChoiceList = 'FINCategory'
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','CUSTOMER SW')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','DATA TABLE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','FIN MOUNTED IN A DASSY')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','FIN POSITION')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','FIN SW SPP')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','GENERIC SOFTWARE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LIGHTED PLATE XXXX VU')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LOAD GROUP')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRI')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRM TYPE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRU')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRU IN A CA')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRU IN MASTER FIN')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRU IN PRIMARY')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','LRU SOFTWARE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','MASTER FIN')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','MONUMENT')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','MULTIPLE QUANTITY FIN')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','PHANTOM')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','PRIMARY')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','SSPC')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FINCategory','STANDARD ITEM')


-- Change list for FLS fin category
delete from t_choicelist where ChoiceList = 'FLS Category'
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','CUSTOMER SW')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','FIN MOUNTED IN A DASSY')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','FIN POSITION')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','FIN SW SPP')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','GENERIC SOFTWARE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRM TYPE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRU')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRU IN A CA')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRU IN MASTER FIN')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRU IN PRIMARY')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','LRU SOFTWARE')
insert into t_choicelist (choicelist,choiceValue) VALUES ('FLS Category','PRIMARY')

