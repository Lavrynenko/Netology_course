/*passage M2 Bruno Sanguinede*/ 

declare 
  @userid integer


set @userid = (select user_id from t_user where user_logon='ST17877')

-- Copy Update here
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000000'
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000001'
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000002'
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000003'
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='2714CRAC000000'
UPDATE R_fin_ds set valm0='Validated',valm1='Validated',mg='2' WHERE substring(R_FIN_DS.EDDReference,1,14)='3326LWDC000001'

-- Copy update hsitory here
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000000'
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000001'
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000002'
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='3061DMAC000003'
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='2714CRAC000000'
INSERT INTO T_History (logon,history_idr_user,ActionDate,ActionType,ActionData,ObjectReference,ActionDesc,ActionObject,RefId) SELECT 'EPC ADMIN',@userid,GETDATE(),'Upgrading MG Level','From MG 0 to MG 2',EddReference,'','DS',R_FIN_DS.id_ds FROM R_FIN_DS WHERE substring(R_FIN_DS.EDDReference,1,14)='3326LWDC000001'


