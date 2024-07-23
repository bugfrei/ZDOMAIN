CLASS zcl_baseabstract DEFINITION
  PUBLIC
  ABSTRACT
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



CLASS zcl_baseabstract IMPLEMENTATION.
  METHOD test1.
* kein Code notwendig, da die Klasse eh Abstrakt ist!
  ENDMETHOD.

  METHOD test2.
    out->write( |Mann kann aber Code implementieren| ).
  ENDMETHOD.

ENDCLASS.
