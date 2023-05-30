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
  DATA(lo_visibility_dispenser)       = NEW lcl_visibility_dispenser( ).
  DATA(lo_element_remover)            = NEW lcl_element_remover( ).
  DATA(lo_marker)                     = NEW lcl_marker( ).
  DATA(lo_direct_input_technique_ini) = NEW lcl_direct_input_technique_ini( ).
  DATA(lo_action_handler)             = NEW lcl_action_handler( io_direct_input_technique_ini = lo_direct_input_technique_ini ).
  DATA(lo_screen_adjuster)            = NEW lcl_screen_adjuster( io_element_remover      = lo_element_remover
                                                                 io_visibility_dispenser = lo_visibility_dispenser
                                                                 io_marker               = lo_marker ).
  lo_visibility_dispenser->make_blocks_invisible_init( ).

AT SELECTION-SCREEN OUTPUT.
  lo_screen_adjuster->adjust_screen( ).

AT SELECTION-SCREEN.
  lo_marker->set_the_marker( ). "SY-UCOMM is saved in the class' field.
  lo_action_handler->decide_action( ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_f_path.
  DATA(lo_f4_help_provider) = NEW lcl_f4_help_provider( ).
  lo_f4_help_provider->provide_f4_help( ).