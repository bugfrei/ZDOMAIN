CLASS zcl_printer2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_printable .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_printer2 IMPLEMENTATION.


  METHOD zif_printable~print.
    result = val1 - val2.
    out->write( |Ausgabe 1:{ val1 }-{ val2 }={ result }| ).
  ENDMETHOD.
ENDCLASS.
