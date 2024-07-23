CLASS zcl_exceptionsimple DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA INFO TYPE string.
    METHODS:
     CONSTRUCTOR
     IMPORTING
      INFO TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exceptionsimple IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    ME->INFO = INFO.
  ENDMETHOD.

ENDCLASS.
