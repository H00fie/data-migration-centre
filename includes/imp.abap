*&---------------------------------------------------------------------*
*&  Include           DATA_MIGRATION_CENTRE_IMP
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_element_remover IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_element_remover IMPLEMENTATION.
  METHOD hide_onli.
    DATA: lt_tab TYPE TABLE OF sy-ucomm.
    APPEND 'ONLI' TO lt_tab.
    CALL FUNCTION 'RS_SET_SELSCREEN_STATUS'
      EXPORTING
        p_status        = sy-pfkey
      TABLES
        p_exclude       = lt_tab.
  ENDMETHOD.                    "hide_onli
ENDCLASS.                    "lcl_element_remover IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_visibility_dispenser DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_visibility_dispenser IMPLEMENTATION.
  METHOD: make_blocks_invisible_init.
    LOOP AT SCREEN.
      IF screen-group1 = 'ID2'.
        screen-invisible = '1'.
        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.                    "make_blocks_invisible_init
ENDCLASS.                    "lcl_visibility_dispenser IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_action_handler IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_action_handler IMPLEMENTATION.
  METHOD decide_action.
    CASE sy-ucomm.
      WHEN 'FC1'.
*Hide the welcoming message and display the window with the option to choose the type of the file containing the legacy data.
    ENDCASE.
  ENDMETHOD.                    "decide_action
ENDCLASS.                    "lcl_action_handler IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_screen_adjuster IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_screen_adjuster IMPLEMENTATION.
  METHOD constructor.
    me->lo_element_remover = io_element_remover.
  ENDMETHOD.                    "constructor
  METHOD adjust_screen.
    lo_element_remover->hide_onli( ).
  ENDMETHOD.                    "adjust_screen
ENDCLASS.                    "lcl_screen_adjuster