*&---------------------------------------------------------------------*
*& Report DATA_MIGRATION_CENTRE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT DATA_MIGRATION_CENTRE.

INCLUDE DATA_MIGRATION_CENTRE_SEL.
INCLUDE DATA_MIGRATION_CENTRE_DEF.
INCLUDE DATA_MIGRATION_CENTRE_IMP.

INITIALIZATION.
  DATA(lo_visibility_dispenser) = NEW lcl_visibility_dispenser( ).
  DATA(lo_action_handler) = NEW lcl_action_handler( ).
  lo_visibility_dispenser->make_blocks_invisible_init( ).

AT SELECTION-SCREEN.
  lo_action_handler->decide_action( ).