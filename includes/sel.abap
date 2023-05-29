*&---------------------------------------------------------------------*
*&  Include           DATA_MIGRATION_CENTRE_SEL
*&---------------------------------------------------------------------*

SELECTION-SCREEN BEGIN OF BLOCK bk1 WITH FRAME TITLE TEXT-000.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-001 MODIF ID id1.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-002 MODIF ID id1.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-003 MODIF ID id1.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-004 MODIF ID id1.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(79) TEXT-005 MODIF ID id1.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-006 USER-COMMAND fc1 MODIF ID id1.

SELECTION-SCREEN END OF BLOCK bk1.

SELECTION-SCREEN BEGIN OF BLOCK bk2 WITH FRAME TITLE TEXT-007.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-008 USER-COMMAND fc2 MODIF ID id2.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-009 USER-COMMAND fc3 MODIF ID id2.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk2.

SELECTION-SCREEN BEGIN OF BLOCK bk3 WITH FRAME TITLE TEXT-010.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-011 USER-COMMAND fc4 MODIF ID id3.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-012 USER-COMMAND fc5 MODIF ID id3.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk3.

SELECTION-SCREEN BEGIN OF BLOCK bk4 WITH FRAME TITLE TEXT-013.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(14) TEXT-014 MODIF ID id4.
    SELECTION-SCREEN COMMENT 15(63) TEXT-015 MODIF ID id4.
    SELECTION-SCREEN PUSHBUTTON 79(20) TEXT-016 USER-COMMAND fc6 MODIF ID id4.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN ULINE MODIF ID id4.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(14) TEXT-017 MODIF ID id4.
    SELECTION-SCREEN COMMENT 15(63) TEXT-018 MODIF ID id4.
    SELECTION-SCREEN PUSHBUTTON 79(20) TEXT-019 USER-COMMAND fc7 MODIF ID id4.
  SELECTION-SCREEN END OF LINE.

  SELECTION-SCREEN ULINE MODIF ID id4.

  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN COMMENT 1(14) TEXT-020 MODIF ID id4.
    SELECTION-SCREEN COMMENT 15(63) TEXT-021 MODIF ID id4.
    SELECTION-SCREEN PUSHBUTTON 79(20) TEXT-022 USER-COMMAND fc8 MODIF ID id4.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk4.

SELECTION-SCREEN BEGIN OF BLOCK bk5 WITH FRAME TITLE TEXT-023.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-024 USER-COMMAND fc9 MODIF ID id5.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-025 USER-COMMAND fc10 MODIF ID id5.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk5.

SELECTION-SCREEN BEGIN OF BLOCK bk6 WITH FRAME TITLE TEXT-026.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-027 USER-COMMAND fc11 MODIF ID id6.
  SELECTION-SCREEN END OF LINE.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    SELECTION-SCREEN PUSHBUTTON 1(20) TEXT-028 USER-COMMAND fc12 MODIF ID id6.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk6.

SELECTION-SCREEN BEGIN OF BLOCK bk7 WITH FRAME TITLE TEXT-029.
  SELECTION-SCREEN SKIP.
  SELECTION-SCREEN BEGIN OF LINE.
    PARAMETERS: p_f_path TYPE string MODIF ID id7.
  SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK bk7.

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
*008 - Text
*009 - Excel
*010 - Choose the separator type.
*011 - Comma
*012 - Tab
*013 - Select the structure of the file
*014 - Customer data:
*015 - Cust. no., name, ct. code, region, city, street & building no.
*016 - Choose this
*017 - Inv. header:
*018 - Inv. no., inv. type, curr. type, doc. no., date, payment type
*019 - Choose this
*020 - Inv. items:
*021 - Inv. no., pos. no., amount, unit of measure, weight, net worth
*022 - Choose this
*023 - Choose the location of the file.
*024 - Locally
*025 - Application server
*026 - Choose the preferred migration technique.
*027 - Direct Input Method
*028 - Call Transaction
*029 - Provide the path to the file with the data.