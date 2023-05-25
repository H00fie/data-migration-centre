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
  DATA(lo_action_handler)       = NEW lcl_action_handler( ).
  DATA(lo_element_remover)      = NEW lcl_element_remover( ).
  DATA(lo_screen_adjuster)      = NEW lcl_screen_adjuster( io_element_remover = lo_element_remover ).
  lo_visibility_dispenser->make_blocks_invisible_init( ).

AT SELECTION-SCREEN OUTPUT.
  lo_screen_adjuster->adjust_screen( ).

AT SELECTION-SCREEN.
  lo_action_handler->decide_action( ).