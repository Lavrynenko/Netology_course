/* Update on MP TABLE */

-- attribute name : CL Comment
-- attribute value : Comment
update t_mp set comment = replace(cast(comment as varchar(8000)),char(160),'')

-- attribute name : MP CCB Decisions
-- attribute value : GeneralComment
update t_mp set GeneralComment = replace(cast(GeneralComment as varchar(8000)),char(160),'')

-- attribute name : GL Comment 
-- attribute value : MPGLComment
update t_mp set MPGLComment = replace(cast(MPGLComment as varchar(8000)),char(160),'')

-- attribute name : SYS Central CM Comment 
-- attribute value : MPSysCentralCMComment
update t_mp set MPSysCentralCMComment = replace(cast(MPSysCentralCMComment as varchar(8000)),char(160),'')

-- attribute name : Task Force Follow up 
-- attribute value : MPTaskForceFollowUp
update t_mp set MPTaskForceFollowUp = replace(cast(MPTaskForceFollowUp as varchar(8000)),char(160),'')


/* Update on CR table */

-- attribute name : CL Comment
-- attribute value : cr_RequestComment
update v_cr set cr_RequestComment = replace(cast(cr_RequestComment as varchar(8000)),char(160),'')

-- attribute name : GL Comment
-- attribute value : cr_GIGenComments
update v_cr set cr_GIGenComments = replace(cast(cr_GIGenComments as varchar(8000)),char(160),'')

-- attribute name : SYS Central CM Comment
-- attribute value : cr_OSTeamComment
update v_cr set cr_OSTeamComment = replace(cast(cr_OSTeamComment as varchar(8000)),char(160),'')

-- attribute name : Task Force Follow up
-- attribute value : cr_taskForceFU
update v_cr set cr_taskForceFU = replace(cast(cr_taskForceFU as varchar(8000)),char(160),'')

-- attribute name : CR CCB Decisions
-- attribute value : cr_EngineeringComment
update v_cr set cr_EngineeringComment = replace(cast(cr_EngineeringComment as varchar(8000)),char(160),'')




