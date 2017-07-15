
-- Update feature Edit Search

update 
	t_feature
set 
	linked_url='TOOL_OBJECTS/SEARCH/EDIT/SEARCH_Edit_Form.php?profil_label=LAST_SEARCH&current_page=#current_page#&renamed_order_attr=#renamed_order_attr#&sort_direction=#sort_direction#'
where
	label ='Edit Search'
AND display_context LIKE '%;SEARCH/RESULT;%'