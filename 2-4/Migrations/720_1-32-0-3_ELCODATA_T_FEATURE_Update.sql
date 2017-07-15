-- Update T_FEATURE:
-- - change field "histomp_ActionDateDs" into "histods_ActionDateDs" for table HISTORY_DS

UPDATE InfoBase SET object_value = 'histods_ActionDateDs' 
WHERE object_value = 'histomp_ActionDateDs' AND table_name = 'HISTORY_DS';