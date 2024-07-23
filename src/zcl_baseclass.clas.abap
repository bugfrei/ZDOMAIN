CLASS zcl_baseclass DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:  test1
              IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out,
              test2
              IMPORTING
                out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_baseclass IMPLEMENTATION.
  METHOD test1.
    out->write( |Ausgabe der Basisklasse von test1| ).
  ENDMETHOD.

  METHOD test2.
    out->write( |Ausgabe der Basisklasse von test2| ).
  ENDMETHOD.

ENDCLASS.
