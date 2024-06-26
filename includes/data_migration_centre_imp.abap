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
      WHEN 'FC3' OR 'FC4' OR 'FC5'.
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
      WHEN 'FC9' OR 'FC10'.
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
      WHEN 'FC11' OR 'FC12' OR 'FC14'.
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
      WHEN 'FC12'.
        set_migration_technique( i_migration_technique = 'Session Technique' ).
      WHEN 'FC13'.
        carry_out_migration( ).
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

  METHOD carry_out_migration.
    DATA(lo_factory) = NEW lcl_factory( ).
    lo_migrator = lo_factory->provide_chosen_migrator( i_migration_technique = lv_migration_technique ).
    lo_migrator->initialize_the_migration( i_separator_type = lv_separator_type
                                           i_file_structure = lv_file_structure
                                           i_file_type      = lv_file_type
                                           i_file_location  = lv_file_location ).
  ENDMETHOD.                    "carry_out_migration
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
  METHOD lif_migrator~initialize_the_migration.
    IF i_file_location = 'Locally'.
      upload_local_file( i_file_type = i_file_type
                         i_file_structure = i_file_structure ).
    ELSE.
      upload_server_file( ).
    ENDIF.
    IF i_file_type = 'Text'.
      move_data_to_tab_with_sep_flds( i_separator_type = i_separator_type
                                      i_file_structure = i_file_structure ).
    ENDIF.
    move_data_to_tab_like_target( i_file_structure = i_file_structure ).
    move_data_to_database_table( i_file_structure = i_file_structure ).
  ENDMETHOD.                    "initialize_the_migration

  METHOD upload_local_file.
    CASE i_file_type.
      WHEN 'Text'.
        load_text_file( ).
      WHEN 'Excel'.
        load_excel_file( i_file_structure = i_file_structure ).
    ENDCASE.
  ENDMETHOD.                    "upload_local_file

  METHOD upload_server_file.
    DATA: lv_msg TYPE string.
    OPEN DATASET p_f_path FOR INPUT IN TEXT MODE ENCODING DEFAULT MESSAGE lv_msg.
    IF sy-subrc = 0.
      CLEAR: lwa_initial.
      READ DATASET p_f_path INTO lwa_initial-string.
      IF sy-subrc = 0.
        APPEND lwa_initial TO lt_initial.
      ELSE.
        CLOSE DATASET p_f_path.
        EXIT.
      ENDIF.
    ELSE.
      MESSAGE lv_msg TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.                    "upload_server_file

  METHOD load_text_file.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename = p_f_path
      TABLES
        data_tab = lt_initial.
  ENDMETHOD.                    "load_text_file

  METHOD load_excel_file.
    CASE i_file_structure.
      WHEN 'KNA1'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_kna1.
      WHEN 'VBRK'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrk.
      WHEN 'VBRP'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrp.
    ENDCASE.
  ENDMETHOD.                    "load_excel_file

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
  ENDMETHOD.                    "populate_initial_vbrp_tab

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
          MESSAGE i000(zbmierzwi_test_msg2).
        ELSE.
          MESSAGE i001(zbmierzwi_test_msg2).
        ENDIF.
      WHEN 'VBRK'.
        MODIFY vbrk FROM TABLE lt_final_vbrk.
        IF sy-subrc = 0.
          MESSAGE i002(zbmierzwi_test_msg2).
        ELSE.
          MESSAGE i003(zbmierzwi_test_msg2).
        ENDIF.
      WHEN 'VBRP'.
        MODIFY vbrp FROM TABLE lt_final_vbrp.
        IF sy-subrc = 0.
          MESSAGE i003(zbmierzwi_test_msg2).
        ELSE.
          MESSAGE i004(zbmierzwi_test_msg2).
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
  METHOD lif_migrator~initialize_the_migration.
    IF i_file_location = 'Locally'.
      upload_local_file( i_file_type = i_file_type
                         i_file_structure = i_file_structure ).
    ELSE.
      upload_server_file( ).
    ENDIF.
    IF i_file_type = 'Text'.
      move_data_to_tab_with_sep_flds( i_separator_type = i_separator_type
                                      i_file_structure = i_file_structure ).
    ENDIF.
    populate_bdcdata_structure( i_file_structure = i_file_structure ).
  ENDMETHOD.                    "initialize_the_migration

  METHOD upload_local_file.
    CASE i_file_type.
      WHEN 'Text'.
        load_text_file( ).
      WHEN 'Excel'.
        load_excel_file( i_file_structure = i_file_structure ).
    ENDCASE.
  ENDMETHOD.                    "upload_local_file

  METHOD upload_server_file.
    DATA: lv_msg TYPE string.
    OPEN DATASET p_f_path FOR INPUT IN TEXT MODE ENCODING DEFAULT MESSAGE lv_msg.
    IF sy-subrc = 0.
      CLEAR: lwa_initial.
      READ DATASET p_f_path INTO lwa_initial-string.
      IF sy-subrc = 0.
        APPEND lwa_initial TO lt_initial.
      ELSE.
        CLOSE DATASET p_f_path.
        EXIT.
      ENDIF.
    ELSE.
      MESSAGE lv_msg TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.                    "upload_server_file

  METHOD load_text_file.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename = p_f_path
      TABLES
        data_tab = lt_initial.
  ENDMETHOD.                    "load_text_file

  METHOD load_excel_file.
    CASE i_file_structure.
      WHEN 'KNA1'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_kna1.
      WHEN 'VBRK'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrk.
      WHEN 'VBRP'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrp.
    ENDCASE.
  ENDMETHOD.                    "load_excel_file

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
  ENDMETHOD.                    "populate_initial_vbrp_tab

  METHOD populate_bdcdata_structure.
    CASE i_file_structure.
      WHEN 'KNA1'.
        LOOP AT lt_initial_kna1 INTO lwa_initial_kna1.
          map_program_data( ).
          map_field_data( i_field = 'KUNNR' ).
          map_field_data( i_field = 'NAME1' ).
          map_field_data( i_field = 'LAND1' ).
          map_field_data( i_field = 'REGIO' ).
          map_field_data( i_field = 'ORT01' ).
          map_field_data( i_field = 'STRAS' ).
          CALL TRANSACTION 'ZBMI11' USING lt_bdcdata.
        ENDLOOP.
      WHEN 'VBRK'.
        LOOP AT lt_initial_vbrk INTO lwa_initial_vbrk.
          map_program_data( ).
          map_field_data( i_field = 'VBELN' ).
          map_field_data( i_field = 'FKTYP' ).
          map_field_data( i_field = 'WAERK' ).
          map_field_data( i_field = 'BELNR' ).
          map_field_data( i_field = 'FKDAT' ).
          map_field_data( i_field = 'ZLSCH' ).
          CALL TRANSACTION 'ZBMI11' USING lt_bdcdata.
        ENDLOOP.
      WHEN 'VBRP'.
        LOOP AT lt_initial_vbrp INTO lwa_initial_vbrp.
          map_program_data( ).
          map_field_data( i_field = 'VBELN2' ).
          map_field_data( i_field = 'POSNR' ).
          map_field_data( i_field = 'MEINS' ).
          map_field_data( i_field = 'MATNR' ).
          map_field_data( i_field = 'NETWR' ).
          CALL TRANSACTION 'ZBMI11' USING lt_bdcdata.
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.                    "populate_bdcdata_structure

  METHOD map_program_data.
    REFRESH lt_bdcdata.
    CLEAR lwa_bdcdata.
    lwa_bdcdata-program = sy-repid.
    lwa_bdcdata-dynpro = '100'.
    lwa_bdcdata-dynbegin = 'X'.
    APPEND lwa_bdcdata TO lt_bdcdata.
  ENDMETHOD.                    "map_program_data

  METHOD map_field_data.
    CLEAR lwa_bdcdata.
    CASE i_field.
      WHEN 'KUNNR'.
        lwa_bdcdata-fnam = 'KNA1-KUNNR'.
        lwa_bdcdata-fval = lwa_initial_kna1-kunnr.
      WHEN 'NAME1'.
        lwa_bdcdata-fnam = 'KNA1-NAME1'.
        lwa_bdcdata-fval = lwa_initial_kna1-name1.
      WHEN 'LAND1'.
        lwa_bdcdata-fnam = 'KNA1-LAND1'.
        lwa_bdcdata-fval = lwa_initial_kna1-land1.
      WHEN 'REGIO'.
        lwa_bdcdata-fnam = 'KNA1-REGIO'.
        lwa_bdcdata-fval = lwa_initial_kna1-regio.
      WHEN 'ORT01'.
        lwa_bdcdata-fnam = 'KNA1-ORT01'.
        lwa_bdcdata-fval = lwa_initial_kna1-ort01.
      WHEN 'STRAS'.
        lwa_bdcdata-fnam = 'KNA1-STRAS'.
        lwa_bdcdata-fval = lwa_initial_kna1-stras.
      WHEN 'VBELN'.
        lwa_bdcdata-fnam = 'VBRK-VBELN'.
        lwa_bdcdata-fval = lwa_initial_vbrk-vbeln.
      WHEN 'FKTYP'.
        lwa_bdcdata-fnam = 'VBRK-FKTYP'.
        lwa_bdcdata-fval = lwa_initial_vbrk-fktyp.
      WHEN 'WAERK'.
        lwa_bdcdata-fnam = 'VBRK-WAERK'.
        lwa_bdcdata-fval = lwa_initial_vbrk-waerk.
      WHEN 'BELNR'.
        lwa_bdcdata-fnam = 'VBRK-BELNR'.
        lwa_bdcdata-fval = lwa_initial_vbrk-belnr.
      WHEN 'FKDAT'.
        lwa_bdcdata-fnam = 'VBRK-FKDAT'.
        lwa_bdcdata-fval = lwa_initial_vbrk-fkdat.
      WHEN 'ZLSCH'.
        lwa_bdcdata-fnam = 'VBRK-ZLSCH'.
        lwa_bdcdata-fval = lwa_initial_vbrk-zlsch.
      WHEN 'VBELN2'.
        lwa_bdcdata-fnam = 'VBRP-VBELN'.
        lwa_bdcdata-fval = lwa_initial_vbrp-vbeln.
      WHEN 'POSNR'.
        lwa_bdcdata-fnam = 'VBRP-POSNR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-posnr.
      WHEN 'MEINS'.
        lwa_bdcdata-fnam = 'VBRP-MEINS'.
        lwa_bdcdata-fval = lwa_initial_vbrp-meins.
      WHEN 'MATNR'.
        lwa_bdcdata-fnam = 'VBRP-MATNR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-matnr.
      WHEN 'NETWR'.
        lwa_bdcdata-fnam = 'VBRP-NETWR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-netwr.
    ENDCASE.
    APPEND lwa_bdcdata TO lt_bdcdata.
  ENDMETHOD.                    "map_field_data
ENDCLASS.                    "lcl_call_trans_technique_ini IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_session_technique_ini IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_session_technique_ini IMPLEMENTATION.
  METHOD lif_migrator~initialize_the_migration.
    IF i_file_location = 'Locally'.
      upload_local_file( i_file_type = i_file_type
                         i_file_structure = i_file_structure ).
    ELSE.
      upload_server_file( ).
    ENDIF.
    IF i_file_type = 'Text'.
      move_data_to_tab_with_sep_flds( i_separator_type = i_separator_type
                                      i_file_structure = i_file_structure ).
    ENDIF.
    open_session_object( ).
    finalize_session_object( i_file_structure = i_file_structure ).
    close_session_object( ).
    display_summary( ).
  ENDMETHOD.                    "initialize_the_migration

  METHOD upload_local_file.
    CASE i_file_type.
      WHEN 'Text'.
        load_text_file( ).
      WHEN 'Excel'.
        load_excel_file( i_file_structure = i_file_structure ).
    ENDCASE.
  ENDMETHOD.                    "upload_local_file

  METHOD load_text_file.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING
        filename = p_f_path
      TABLES
        data_tab = lt_initial.
  ENDMETHOD.                    "load_text_file

  METHOD load_excel_file.
    CASE i_file_structure.
      WHEN 'KNA1'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_kna1.
      WHEN 'VBRK'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrk.
      WHEN 'VBRP'.
        CALL FUNCTION 'TEXT_CONVERT_XLS_TO_SAP'
          EXPORTING
            i_tab_raw_data       = lt_truxs
            i_filename           = lv_excel_file_path
          TABLES
            i_tab_converted_data = lt_initial_vbrp.
    ENDCASE.
  ENDMETHOD.                    "load_excel_file

  METHOD upload_server_file.
    DATA: lv_msg TYPE string.
    OPEN DATASET p_f_path FOR INPUT IN TEXT MODE ENCODING DEFAULT MESSAGE lv_msg.
    IF sy-subrc = 0.
      CLEAR: lwa_initial.
      READ DATASET p_f_path INTO lwa_initial-string.
      IF sy-subrc = 0.
        APPEND lwa_initial TO lt_initial.
      ELSE.
        CLOSE DATASET p_f_path.
        EXIT.
      ENDIF.
    ELSE.
      MESSAGE lv_msg TYPE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.                    "upload_server_file

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
  ENDMETHOD.                    "populate_initial_vbrp_tab

  METHOD open_session_object.
    CALL FUNCTION 'BDC_OPEN_GROUP'
      EXPORTING
        CLIENT                    = SY-MANDT
        GROUP                     = 'S1'
        KEEP                      = 'X'
        USER                      = SY-UNAME.
  ENDMETHOD.                    "open_session_object

  METHOD finalize_session_object.
    CASE i_file_structure.
      WHEN 'KNA1'.
        LOOP AT lt_initial_kna1 INTO lwa_initial_kna1.
          map_program_data( ).
          map_field_data( i_field = 'KUNNR' ).
          map_field_data( i_field = 'NAME1' ).
          map_field_data( i_field = 'LAND1' ).
          map_field_data( i_field = 'REGIO' ).
          map_field_data( i_field = 'ORT01' ).
          map_field_data( i_field = 'STRAS' ).
          create_session_object( ).
        ENDLOOP.
      WHEN 'VBRK'.
        LOOP AT lt_initial_vbrk INTO lwa_initial_vbrk.
          map_program_data( ).
          map_field_data( i_field = 'VBELN' ).
          map_field_data( i_field = 'FKTYP' ).
          map_field_data( i_field = 'WAERK' ).
          map_field_data( i_field = 'BELNR' ).
          map_field_data( i_field = 'FKDAT' ).
          map_field_data( i_field = 'ZLSCH' ).
          create_session_object( ).
        ENDLOOP.
      WHEN 'VBRP'.
        LOOP AT lt_initial_vbrp INTO lwa_initial_vbrp.
          map_program_data( ).
          map_field_data( i_field = 'VBELN2' ).
          map_field_data( i_field = 'POSNR' ).
          map_field_data( i_field = 'MEINS' ).
          map_field_data( i_field = 'MATNR' ).
          map_field_data( i_field = 'NETWR' ).
          create_session_object( ).
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.                    "finalize_session_object

  METHOD map_program_data.
    REFRESH lt_bdcdata.
    CLEAR lwa_bdcdata.
    lwa_bdcdata-program = sy-repid.
    lwa_bdcdata-dynpro = '100'.
    lwa_bdcdata-dynbegin = 'X'.
    APPEND lwa_bdcdata TO lt_bdcdata.
  ENDMETHOD.                    "map_program_data

  METHOD map_field_data.
    CLEAR lwa_bdcdata.
    CASE i_field.
      WHEN 'KUNNR'.
        lwa_bdcdata-fnam = 'KNA1-KUNNR'.
        lwa_bdcdata-fval = lwa_initial_kna1-kunnr.
      WHEN 'NAME1'.
        lwa_bdcdata-fnam = 'KNA1-NAME1'.
        lwa_bdcdata-fval = lwa_initial_kna1-name1.
      WHEN 'LAND1'.
        lwa_bdcdata-fnam = 'KNA1-LAND1'.
        lwa_bdcdata-fval = lwa_initial_kna1-land1.
      WHEN 'REGIO'.
        lwa_bdcdata-fnam = 'KNA1-REGIO'.
        lwa_bdcdata-fval = lwa_initial_kna1-regio.
      WHEN 'ORT01'.
        lwa_bdcdata-fnam = 'KNA1-ORT01'.
        lwa_bdcdata-fval = lwa_initial_kna1-ort01.
      WHEN 'STRAS'.
        lwa_bdcdata-fnam = 'KNA1-STRAS'.
        lwa_bdcdata-fval = lwa_initial_kna1-stras.
      WHEN 'VBELN'.
        lwa_bdcdata-fnam = 'VBRK-VBELN'.
        lwa_bdcdata-fval = lwa_initial_vbrk-vbeln.
      WHEN 'FKTYP'.
        lwa_bdcdata-fnam = 'VBRK-FKTYP'.
        lwa_bdcdata-fval = lwa_initial_vbrk-fktyp.
      WHEN 'WAERK'.
        lwa_bdcdata-fnam = 'VBRK-WAERK'.
        lwa_bdcdata-fval = lwa_initial_vbrk-waerk.
      WHEN 'BELNR'.
        lwa_bdcdata-fnam = 'VBRK-BELNR'.
        lwa_bdcdata-fval = lwa_initial_vbrk-belnr.
      WHEN 'FKDAT'.
        lwa_bdcdata-fnam = 'VBRK-FKDAT'.
        lwa_bdcdata-fval = lwa_initial_vbrk-fkdat.
      WHEN 'ZLSCH'.
        lwa_bdcdata-fnam = 'VBRK-ZLSCH'.
        lwa_bdcdata-fval = lwa_initial_vbrk-zlsch.
      WHEN 'VBELN2'.
        lwa_bdcdata-fnam = 'VBRP-VBELN'.
        lwa_bdcdata-fval = lwa_initial_vbrp-vbeln.
      WHEN 'POSNR'.
        lwa_bdcdata-fnam = 'VBRP-POSNR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-posnr.
      WHEN 'MEINS'.
        lwa_bdcdata-fnam = 'VBRP-MEINS'.
        lwa_bdcdata-fval = lwa_initial_vbrp-meins.
      WHEN 'MATNR'.
        lwa_bdcdata-fnam = 'VBRP-MATNR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-matnr.
      WHEN 'NETWR'.
        lwa_bdcdata-fnam = 'VBRP-NETWR'.
        lwa_bdcdata-fval = lwa_initial_vbrp-netwr.
    ENDCASE.
    APPEND lwa_bdcdata TO lt_bdcdata.
  ENDMETHOD.                    "map_field_data

  METHOD create_session_object.
    CALL FUNCTION 'BDC_INSERT'
      EXPORTING
        TCODE                  = 'ZBMI11'
      TABLES
        DYNPROTAB              = lt_bdcdata.
  ENDMETHOD.                    "create_session_object

  METHOD close_session_object.
    CALL FUNCTION 'BDC_CLOSE_GROUP'.
  ENDMETHOD.                    "close_session_object

  METHOD display_summary.
    IF sy-subrc = 0.
      MESSAGE i007(data_mig_centre).
    ELSE.
      MESSAGE i008(data_mig_centre).
    ENDIF.
  ENDMETHOD.                    "display_summary
ENDCLASS.                    "lcl_session_technique_ini IMPLEMENTATION

*----------------------------------------------------------------------*
*       CLASS lcl_factory IMPLEMENTATION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_factory IMPLEMENTATION.
  METHOD provide_chosen_migrator.
    CASE i_migration_technique.
      WHEN 'Direct Input Method'.
        DATA(lo_direct_input_technique_ini) = NEW lcl_direct_input_technique_ini( ).
        r_o_migrator = lo_direct_input_technique_ini.
      WHEN 'Call Transaction Technique'.
        DATA(lo_call_trans_technique_ini) = NEW lcl_call_trans_technique_ini( ).
        r_o_migrator = lo_call_trans_technique_ini.
      WHEN 'Session Technique'.
        DATA(lo_session_technique_ini) = NEW lcl_session_technique_ini( ).
        r_o_migrator = lo_session_technique_ini.
    ENDCASE.
  ENDMETHOD.                    "provide_chosen_migrator
ENDCLASS.                    "lcl_factory IMPLEMENTATION

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
*007 - The session object has been created. To process it - proceed to SM35.
*008 - The creation of the session object has failed.

*THE MODULE POOL PROGRAM FOR THE CALL TRANSACTION TECHNIQUE.---------------------------------------------------------------
*-----------Screen 100 Flow Logic-----------
*PROCESS BEFORE OUTPUT.
*
*PROCESS AFTER INPUT.
* MODULE USER_COMMAND_0100.
* MODULE exit_forcefully AT EXIT-COMMAND.
*---------------TOP INCLUDE---------------
*PROGRAM mig_ctr_kna1/mig_ctr_vbrk/mig_ctr_vbrp.
*
*TABLES kna1/vbrk/vbrp.
*
*MODULE user_command_0100 INPUT.
*  CASE sy-ucomm.
*    WHEN 'FC1'.
*      MODIFY kna1/vbrk/vbrp.
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
