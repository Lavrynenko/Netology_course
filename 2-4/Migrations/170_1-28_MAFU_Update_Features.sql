-- ******************************************************************************
-- Name : 170_1-28_MAFU_Update_Features.sql
-- Date : 09/10/2008
-- Spec : MAFU_V1.XX_synthesis_sheet_Mafu_A350_Features.doc
-- Update features display orders
-- ******************************************************************************

DECLARE 
	@display_context VARCHAR(255), 
	@label VARCHAR(255), 
	@display_order INT


-------------
---- RFC ----
-------------

SET @display_context = ';RFC/CONSULT;'

-- Edit TRS of RFC inv. teams
SET @label = 'Edit TRS of RFC inv. teams'
SET @display_order = 10

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Add Meeting
SET @label = 'Add Meeting'
SET @display_order = 20

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Link MP
SET @label = 'Link MP'
SET @display_order = 30

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Edit
SET @label = 'Edit'
SET @display_order = 40

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Add Action
SET @label = 'Add Action'
SET @display_order = 50

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Link ATA
SET @label = 'Link ATA'
SET @display_order = 60

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Unlink ATA
SET @label = 'Unlink ATA'
SET @display_order = 70

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Add this RFC to Tick Box
SET @label = 'Add this RFC to Tick Box'
SET @display_order = 80

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Unlink MP
SET @label = 'Unlink MP'
SET @display_order = 90

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context


-- Delete
SET @label = 'Delete'
SET @display_order = 100

UPDATE T_FEATURE SET display_order = @display_order WHERE label = @label AND display_context = @display_context

