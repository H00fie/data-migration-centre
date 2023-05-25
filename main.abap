*&---------------------------------------------------------------------*
*& Report DATA_MIGRATION_CENTRE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT DATA_MIGRATION_CENTRE.

INCLUDE Z_BMIERZWINSKI_DEV_TEST4_SEL.
INCLUDE Z_BMIERZWINSKI_DEV_TEST4_DEF.
INCLUDE Z_BMIERZWINSKI_DEV_TEST4_IMP.

INITIALIZATION.
  DATA(lo_visibility_dispenser) = NEW lcl_visibility_dispenser( ).
  lo_visibility_dispenser->make_blocks_invisible_init( ).