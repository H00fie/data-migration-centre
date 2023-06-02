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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID5' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID4' OR screen-group1 = 'ID5' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID5' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID6' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID5' OR
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
          IF screen-group1 = 'ID1' OR screen-group1 = 'ID2' OR screen-group1 = 'ID3' OR screen-group1 = 'ID4' OR screen-group1 = 'ID5' OR
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
        set_file_structure( i_file_structure = 'VBRK' ).
      WHEN 'FC8'.
        set_file_structure( i_file_structure = 'VBRP' ).
      WHEN 'FC9'.
        set_file_location( i_file_location = 'Locally' ).
      WHEN 'FC10'.
        set_file_location( i_file_location = 'Application server' ).
      WHEN 'FC11'.
        set_migration_technique( i_migration_technique = 'Direct Input Method' ).
      WHEN 'FC12'.
        set_migration_technique( i_migration_technique = 'Call Transaction Technique' ).
      WHEN 'FC13'.
        lo_direct_input_technique_ini->initialize_the_migration( i_separator_type = lv_separator_type
                                                                 i_file_structure = lv_file_structure ).
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

  METHOD set_migration_technique.
    lv_migration_technique = i_migration_technique.
  ENDMETHOD.                    "set_migration_technique
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
    move_data_to_tab_with_sep_flds( i_separator_type = i_separator_type
                                    i_file_structure = i_file_structure ).
    move_data_to_tab_like_target( i_file_structure = i_file_structure ).
    move_data_to_database_table( i_file_structure = i_file_structure ).
  ENDMETHOD.                    "initialize_the_migration

  METHOD upload_file.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename                      = p_f_path
      TABLES
        data_tab                      = lt_initial.
  ENDMETHOD.                    "upload_file

  METHOD move_data_to_tab_with_sep_flds.
    CASE i_file_structure.
      WHEN 'KNA1'.
        populate_initial_kna1_tab( i_separator_type = i_separator_type ).
      WHEN 'VBRK'.
        populate_initial_vbrk_tab( i_separator_type = i_separator_type ).
      WHEN 'VBRP'.
        populate_initial_vbrp_tab( i_separator_type = i_separator_type ).
    ENDCASE.
  ENDMETHOD.                    "move_data_to_tab_with_sep_flds

  METHOD populate_initial_kna1_tab.
    LOOP AT lt_initial INTO lwa_initial.
      CLEAR lwa_initial_kna1.
      SPLIT lwa_initial-string AT i_separator_type INTO lwa_initial_kna1-kunnr
                                                        lwa_initial_kna1-land1
                                                        lwa_initial_kna1-regio
                                                        lwa_initial_kna1-ort01
                                                        lwa_initial_kna1-stras.
      APPEND lwa_initial_kna1 TO lt_initial_kna1.
    ENDLOOP.
  ENDMETHOD.                    "populate_initial_kna1_tab

  METHOD populate_initial_vbrk_tab.
    LOOP AT lt_initial INTO lwa_initial.
      CLEAR lwa_initial_vbrk.
      SPLIT lwa_initial-string AT i_separator_type INTO lwa_initial_vbrk-vbeln
                                                        lwa_initial_vbrk-fktyp
                                                        lwa_initial_vbrk-waerk
                                                        lwa_initial_vbrk-belnr
                                                        lwa_initial_vbrk-fkdat
                                                        lwa_initial_vbrk-zlsch.
      APPEND lwa_initial_vbrk TO lt_initial_vbrk.
    ENDLOOP.
  ENDMETHOD.                    "populate_initial_vbrk_tab

  METHOD populate_initial_vbrp_tab. "VBRP requires an additional level of abstracion due to the presence of the NETWR field. It's data
    TYPES: BEGIN OF t_temp,         "type - CURR makes it impossible to move a substring into the field immediately after splitting the
      string1 TYPE string,          "initial string containing all the data. I need to first save the substring into a string field and
      string2 TYPE string,          "then '=' is enough to perform the conversion to CURR.
      string3 TYPE string,
      string4 TYPE string,
      string5 TYPE string,
    END OF t_temp.
    DATA: lt_temp  TYPE TABLE OF t_temp,
          lwa_temp TYPE t_temp.

    LOOP AT lt_initial INTO lwa_initial.
      CLEAR lwa_temp.
      SPLIT lwa_initial-string AT i_separator_type INTO lwa_temp-string1
                                                        lwa_temp-string2
                                                        lwa_temp-string3
                                                        lwa_temp-string4
                                                        lwa_temp-string5.
      lwa_initial_vbrp-vbeln = lwa_temp-string1.
      lwa_initial_vbrp-posnr = lwa_temp-string2.
      lwa_initial_vbrp-meins = lwa_temp-string3.
      lwa_initial_vbrp-matnr = lwa_temp-string4.
      lwa_initial_vbrp-netwr = lwa_temp-string5.
      APPEND lwa_initial_vbrp TO lt_initial_vbrp.
    ENDLOOP.
  ENDMETHOD.                    "convert_string_to_netwr

  METHOD move_data_to_tab_like_target.
    CASE i_file_structure.
      WHEN 'KNA1'.
        LOOP AT lt_initial_kna1 INTO lwa_initial_kna1.
          CLEAR lwa_final_kna1.
          lwa_final_kna1-kunnr = lwa_initial_kna1-kunnr.
          lwa_final_kna1-land1 = lwa_initial_kna1-land1.
          lwa_final_kna1-regio = lwa_initial_kna1-regio.
          lwa_final_kna1-ort01 = lwa_initial_kna1-ort01.
          lwa_final_kna1-stras = lwa_initial_kna1-stras.
          APPEND lwa_final_kna1 TO lt_final_kna1.
        ENDLOOP.
      WHEN 'VBRK'.
        LOOP AT lt_initial_vbrk INTO lwa_initial_vbrk.
          CLEAR lwa_final_vbrk.
          lwa_final_vbrk-vbeln = lwa_initial_vbrk-vbeln.
          lwa_final_vbrk-fktyp = lwa_initial_vbrk-fktyp.
          lwa_final_vbrk-waerk = lwa_initial_vbrk-waerk.
          lwa_final_vbrk-belnr = lwa_initial_vbrk-belnr.
          lwa_final_vbrk-fkdat = lwa_initial_vbrk-fkdat.
          lwa_final_vbrk-zlsch = lwa_initial_vbrk-zlsch.
          APPEND lwa_final_vbrk TO lt_final_vbrk.
        ENDLOOP.
      WHEN 'VBRP'.
        LOOP AT lt_initial_vbrp INTO lwa_initial_vbrp.
          CLEAR lwa_final_vbrp.
          lwa_final_vbrp-vbeln = lwa_initial_vbrp-vbeln.
          lwa_final_vbrp-posnr = lwa_initial_vbrp-posnr.
          lwa_final_vbrp-meins = lwa_initial_vbrp-meins.
          lwa_final_vbrp-matnr = lwa_initial_vbrp-matnr.
          lwa_final_vbrp-netwr = lwa_initial_vbrp-netwr.
          APPEND lwa_final_vbrp TO lt_final_vbrp.
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.                    "move_data_to_tab_like_target

  METHOD move_data_to_database_table.
    CASE i_file_structure.
      WHEN 'KNA1'.
        MODIFY kna1 FROM TABLE lt_final_kna1.
        IF sy-subrc = 0.
          MESSAGE i000(data_mig_centre).
        ELSE.
          MESSAGE i001(data_mig_centre).
        ENDIF.
      WHEN 'VBRK'.
        MODIFY vbrk FROM TABLE lt_final_vbrk.
        IF sy-subrc = 0.
          MESSAGE i002(data_mig_centre).
        ELSE.
          MESSAGE i003(data_mig_centre).
        ENDIF.
      WHEN 'VBRP'.
        MODIFY vbrp FROM TABLE lt_final_vbrp.
        IF sy-subrc = 0.
          MESSAGE i003(data_mig_centre).
        ELSE.
          MESSAGE i004(data_mig_centre).
        ENDIF.
    ENDCASE.
  ENDMETHOD.                    "move_data_to_database_table
ENDCLASS.                    "lcl_direct_input_technique_ini IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_call_trans_technique_ini IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_call_trans_technique_ini IMPLEMENTATION.
  METHOD initialize_the_migration.
  ENDMETHOD.                    "initialize_migration
ENDCLASS.                    "lcl_call_trans_technique_ini

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

*MESSAGES TO BE INCLUDED IN THE MESSAGE CLASS.-------------------------------------------------------------------------------------------------
*-----------Attributes Sheet-----------
*Short description - Messages for Data Migration Centre.
*---------------Messages---------------
*000 - The data has been moved to the KNA1 database table.
*001 - The moving of the data to the KNA1 database table has failed.
*002 - The data has been moved to the VBRK database table.
*003 - The moving of the data to the VBRK database table has failed.
*004 - The data has been moved to the VBRP database table.
*005 - The moving of the data to the VBRP database table has failed.
*006 - A record & been affected.

*THE MODULE POOL PROGRAM FOR THE CALL TRANSACTION TECHNIQUE IN THE CASE OF KNA1.---------------------------------------------------------------
*-----------Screen 100 Flow Logic-----------
*PROCESS BEFORE OUTPUT.
*
*PROCESS AFTER INPUT.
* MODULE USER_COMMAND_0100.
* MODULE exit_forcefully AT EXIT-COMMAND.
*---------------Messages---------------
*PROGRAM mig_ctr_kna1.
*
*TABLES kna1.
*
*MODULE user_command_0100 INPUT.
*  CASE sy-ucomm.
*    WHEN 'FC1'.
*      MODIFY kna1.
*      IF sy-subrc = 0.
*        MESSAGE i006(data_mig_centre) WITH 'has'.
*      ELSE.
*        MESSAGE i006(data_mig_centre) WITH 'has not'.
*      ENDIF.
*      LEAVE PROGRAM.
*    WHEN 'FC2'.
*      LEAVE PROGRAM.
*  ENDCASE.
*ENDMODULE.
*
*MODULE exit_forcefully INPUT.
*  CASE sy-ucomm.
*    WHEN 'FC3'.
*      LEAVE PROGRAM.
*  ENDCASE.
*ENDMODULE.