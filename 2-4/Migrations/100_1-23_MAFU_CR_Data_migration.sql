-- Requirement 12.
declare @sentenceToDelete varchar(8000)
set @sentenceToDelete = 'Requested target date MOD'

update V_CR
set cr_RequestComment = right(cr_RequestComment, len(cr_RequestComment) - len(@sentenceToDelete))
where charindex(@sentenceToDelete, cr_RequestComment) = 1


set @sentenceToDelete = ' :'

update V_CR
set cr_RequestComment = right(cr_RequestComment, len(cr_RequestComment) - len(@sentenceToDelete))
where charindex(@sentenceToDelete, cr_RequestComment) = 1

set @sentenceToDelete = ':'

update V_CR
set cr_RequestComment = right(cr_RequestComment, len(cr_RequestComment) - len(@sentenceToDelete))
where charindex(@sentenceToDelete, cr_RequestComment) = 1
