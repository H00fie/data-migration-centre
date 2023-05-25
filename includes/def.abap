*&---------------------------------------------------------------------*
*&  Include           DATA_MIGRATION_CENTRE_DEF
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_element_remover DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_element_remover DEFINITION.
  PUBLIC SECTION.
    METHODS: hide_onli.
ENDCLASS.                    "lcl_element_remover DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_visibility_dispenser DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_visibility_dispenser DEFINITION.
  PUBLIC SECTION.
    METHODS: make_blocks_invisible_init,
             make_block_visible.
ENDCLASS.                    "lcl_visibility_dispenser DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_action_handler DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_action_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: decide_action.
ENDCLASS.                    "lcl_action_handler DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_screen_adjuster DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_screen_adjuster DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING io_element_remover      TYPE REF TO lcl_element_remover
                                   io_visibility_dispenser TYPE REF TO lcl_visibility_dispenser,
             adjust_screen.
  PRIVATE SECTION.
    DATA: lo_element_remover      TYPE REF TO lcl_element_remover,
          lo_visibility_dispenser TYPE REF TO lcl_visibility_dispenser.
ENDCLASS.                    "lcl_screen_adjuster DEFINITION