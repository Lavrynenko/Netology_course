/****** Object:  Table [dbo].[T_LINK_MOTHER_DAUGHTER]    Script Date: 01/28/2011 16:58:25 ******/

UPDATE [T_LINK_MOTHER_DAUGHTER] 
set used=1
where OBJECT_id_mother = 9
AND OBJECT_id_daughter = 13;
