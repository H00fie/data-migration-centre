*&---------------------------------------------------------------------*
*&  Include           DATA_MIGRATION_CENTRE_SEL
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE TEXT-000.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-001.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-002.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-003.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-004.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-005.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-006 USER-COMMAND uc1 MODIF ID id1.

SELECTION-SCREEN END OF BLOCK bk1.

SELECTION-SCREEN BEGIN OF BLOCK bk2 WITH FRAME TITLE TEXT-007.
  PARAMETERS: r_butt1 RADIOBUTTON GROUP gr1 DEFAULT 'X' USER-COMMAND uc1 MODIF ID id2,
              r_butt2 RADIOBUTTON GROUP gr1 MODIF ID id2.
SELECTION-SCREEN END OF BLOCK bk2.

*TEXT ELEMENTS TO BE INCLUDED IN "TEXTS".
*-----------Text Symbols Sheet-----------
*000 - Welcome to the Data Migration Centre.
*001 - First you will be asked to choose the type of the file that stores the data. If
*002 - it is a text file, you will need to select the separator. Afterwards you shall
*003 - be presented with available options of the strucutre of the file storing the
*004 - legacy data. At the end you will be able to select the preferred migration
*005 - technique.
*006 - Proceed
*007 - Choose the type of the file with the data.