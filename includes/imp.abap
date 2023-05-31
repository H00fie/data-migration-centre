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
      IF screen-group1 = 'ID2' OR
         screen-group1 = 'ID3' OR
         screen-group1 = 'ID4' OR
         screen-group1 = 'ID5' OR
         screen-group1 = 'ID6' OR
         screen-group1 = 'ID7'.
        screen-invisible = '1'.
        screen-input = '0'.
        MODIFY SCREEN.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.                    "make_blocks_invisible_init

  METHOD make_block_visible.
    CASE i_marker. "Cannot operate on function calls. SY-UCOMM is cleared when the control leaves the AT SELECTION-SCREEN event.
      WHEN 'FC1'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID5' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC2'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID5' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC4'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID5' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC6'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC7'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC8'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID6' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC9'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID5' OR
             screen-group1 = 'ID7'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
      WHEN 'FC11'.
        LOOP AT SCREEN.
          IF screen-group1 = 'ID1' OR
             screen-group1 = 'ID2' OR
             screen-group1 = 'ID3' OR
             screen-group1 = 'ID4' OR
             screen-group1 = 'ID5' OR
             screen-group1 = 'ID6'.
            screen-invisible = '1'.
            screen-input = '0'.
            MODIFY SCREEN.
          ELSE.
            screen-invisible = '0'.
            screen-input = '1'.
            MODIFY SCREEN.
          ENDIF.
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.                    "make_block_visible
ENDCLASS.                    "lcl_visibility_dispenser IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_action_handler IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_action_handler IMPLEMENTATION.
  METHOD constructor.
    me->lo_direct_input_technique_ini = io_direct_input_technique_ini.
  ENDMETHOD.                    "constructor

  METHOD decide_action.
    CASE sy-ucomm.
      WHEN 'FC2'.
        set_file_type( i_file_type = 'Text' ).
      WHEN 'FC3'.
        set_file_type( i_file_type = 'Excel' ).
      WHEN 'FC4'.
        set_separator_type( i_separator_type = 'Comma' ).
      WHEN 'FC5'.
        set_separator_type( i_separator_type = 'Tab' ).
      WHEN 'FC6'.
        set_file_structure( i_file_structure = 'KNA1' ).
      WHEN 'FC7'.
        set_file_structure( i_file_structure = 'VBAK' ).
      WHEN 'FC8'.
        set_file_structure( i_file_structure = 'VBAP' ).
      WHEN 'FC9'.
        set_file_location( i_file_location = 'Locally' ).
      WHEN 'FC10'.
        set_file_location( i_file_location = 'Application server' ).
      WHEN 'FC13'.
        lo_direct_input_technique_ini->initialize_the_migration( ).
    ENDCASE.
  ENDMETHOD.                    "decide_action

  METHOD set_file_type.
    lv_file_type = i_file_type.
  ENDMETHOD.                    "set_file_type

  METHOD set_separator_type.
    lv_separator_type = i_separator_type.
  ENDMETHOD.                    "set_separator_type

  METHOD set_file_structure.
    lv_file_structure = i_file_structure.
  ENDMETHOD.                    "set_file_structure

  METHOD set_file_location.
    lv_file_location = i_file_location.
  ENDMETHOD.                    "set_file_location
ENDCLASS.                    "lcl_action_handler IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_screen_adjuster IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_screen_adjuster IMPLEMENTATION.
  METHOD constructor.
    me->lo_element_remover = io_element_remover.
    me->lo_visibility_dispenser = io_visibility_dispenser.
    me->lo_marker = io_marker.
  ENDMETHOD.                    "constructor

  METHOD adjust_screen.
    lo_element_remover->hide_onli( ).
    lo_visibility_dispenser->make_block_visible( i_marker = lo_marker->deploy_the_marker( ) ).
  ENDMETHOD.                    "adjust_screen
ENDCLASS.                    "lcl_screen_adjuster IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_marker IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_marker IMPLEMENTATION.
  METHOD set_the_marker.
    lv_marker = sy-ucomm.
  ENDMETHOD.                    "set_the_marker

  METHOD deploy_the_marker.
    r_marker = lv_marker.
  ENDMETHOD.                    "deploy_the_marker
ENDCLASS.                    "lcl_marker IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_direct_input_technique_ini IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_direct_input_technique_ini IMPLEMENTATION.
  METHOD initialize_the_migration.
    upload_file( ).
    move_data_to_tab_with_sep_flds( ).
  ENDMETHOD.                    "initialize_the_migration

  METHOD upload_file.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                      = p_f_path
      TABLES
        data_tab                      = lt_temp1.
  ENDMETHOD.                    "upload_file

  METHOD move_data_to_tab_with_sep_flds.
    LOOP AT lt_temp1 INTO lwa_temp1.
      CLEAR lwa_temp2.
      SPLIT lwa_temp1-string AT ',' INTO lwa_temp2-kunnr "Later on I can feed this method the separator variable from the action handler instead of hardcoding a comma.
                                         lwa_temp2-land1
                                         lwa_temp2-regio
                                         lwa_temp2-ort01
                                         lwa_temp2-stras.
      APPEND lwa_temp2 TO lt_temp2.
    ENDLOOP.
  ENDMETHOD.                    "move_data_to_tab_with_sep_flds

  METHOD move_data_to_tab_like_target.
    LOOP AT lt_temp2 INTO lwa_temp2.
      CLEAR lwa_temp3.
      lwa_temp3-kunnr = lwa_temp2-kunnr.
      lwa_temp3-land1 = lwa_temp2-land1.
      lwa_temp3-regio = lwa_temp2-regio.
      lwa_temp3-ort01 = lwa_temp2-ort01.
      lwa_temp3-stras = lwa_temp2-stras.
      APPEND lwa_temp3 TO lt_temp3.
    ENDLOOP.
  ENDMETHOD.                    "move_data_to_tab_like_target
  
  METHOD move_data_to_database_table.
    MODIFY kna1 FROM TABLE lt_temp3.
  ENDMETHOD.                    "move_data_to_database_table
ENDCLASS.                    "lcl_direct_input_technique_ini IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_f4_help_provider IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_f4_help_provider IMPLEMENTATION.
  METHOD provide_f4_help.
    DATA: lv_path TYPE ibipparms-path.
    CALL FUNCTION 'F4_FILENAME'
     IMPORTING
       FILE_NAME           = lv_path.
    IF lv_path IS NOT INITIAL.
      p_f_path = lv_path.
    ENDIF.
  ENDMETHOD.                    "provide_f4_help
ENDCLASS.                    "lcl_f4_help_provider IMPLEMENTATION