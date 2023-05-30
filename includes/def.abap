*&---------------------------------------------------------------------*
*&  Include           DATA_MIGRATION_CENTRE_DEF
*&---------------------------------------------------------------------*

*----------------------------------------------------------------------*
*       CLASS lcl_direct_input_technique_ini DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_direct_input_technique_ini DEFINITION.
  PUBLIC SECTION.
    METHODS: initialize_the_migration,
             upload_file,
             move_data_to_tab_with_sep_flds,
             move_data_to_tab_like_target.
  PRIVATE SECTION.
    TYPES: BEGIN OF t_temp,
      string TYPE string,
    END OF t_temp.
    TYPES: BEGIN OF t_temp2,
      kunnr TYPE kna1-kunnr,
      name1 TYPE kna1-name1,
      land1 TYPE kna1-land1,
      regio TYPE kna1-regio,
      ort01 TYPE kna1-ort01,
      stras TYPE kna1-stras,
    END OF t_temp2.
    DATA: lt_temp1  TYPE TABLE OF t_temp,
          lwa_temp1 TYPE t_temp,
          lt_temp2  TYPE TABLE OF t_temp2,
          lwa_temp2 TYPE t_temp2,
          lt_temp3  TYPE TABLE OF kna1,
          lwa_temp3 TYPE kna1.
ENDCLASS.                    "lcl_direct_input_technique_ini DEFINITION

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
             make_block_visible IMPORTING i_marker TYPE string.
ENDCLASS.                    "lcl_visibility_dispenser DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_action_handler DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_action_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING io_direct_input_technique_ini TYPE REF TO lcl_direct_input_technique_ini,
             decide_action.
  PRIVATE SECTION.
    METHODS: set_file_type      IMPORTING i_file_type      TYPE string,
             set_separator_type IMPORTING i_separator_type TYPE string,
             set_file_structure IMPORTING i_file_structure TYPE string,
             set_file_location  IMPORTING i_file_location  TYPE string.
    DATA: lo_direct_input_technique_ini TYPE REF TO lcl_direct_input_technique_ini,
          lv_file_type                  TYPE string,
          lv_separator_type             TYPE string,
          lv_file_structure             TYPE string,
          lv_file_location              TYPE string.
ENDCLASS.                    "lcl_action_handler DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_marker DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_marker DEFINITION. "SAP clears 'sy-ucomm' upon the change of events. This class circumvents that limitation.
  PUBLIC SECTION.
    METHODS: set_the_marker,
             deploy_the_marker RETURNING VALUE(r_marker) TYPE string.
  PRIVATE SECTION.
    DATA: lv_marker TYPE string.
ENDCLASS.                    "lcl_marker DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_screen_adjuster DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_screen_adjuster DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING io_element_remover      TYPE REF TO lcl_element_remover
                                   io_visibility_dispenser TYPE REF TO lcl_visibility_dispenser
                                   io_marker               TYPE REF TO lcl_marker,
             adjust_screen.
  PRIVATE SECTION.
    DATA: lo_element_remover      TYPE REF TO lcl_element_remover,
          lo_visibility_dispenser TYPE REF TO lcl_visibility_dispenser,
          lo_marker               TYPE REF TO lcl_marker.
ENDCLASS.                    "lcl_screen_adjuster DEFINITION

*----------------------------------------------------------------------*
*       CLASS lcl_f4_help_provider DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
CLASS lcl_f4_help_provider DEFINITION.
  PUBLIC SECTION.
    METHODS: provide_f4_help.
ENDCLASS.                    "lcl_f4_help_provider DEFINITION