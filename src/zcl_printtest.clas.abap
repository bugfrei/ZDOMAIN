* Interface Test
* ZIF_PRINTABLE         Schnittstelle die Druckbare Elemente "markiert"
*                         Muss eine print Methode beinhalten mit. 2 int Parameter, der out Instanz und einer int Rückgabe
* ZCL_PRINTER1 (234)    Klassen die "Druckbar" sind (also die Schnittstelle ZIF_PRINTABLE implementieren)
* ZCL_PRINTTEST         Ausführbare Klasse die die PRINTER# Klassen verwendet
*                         Die Methode 'doPrint' erwartet eine beliebige ZIF_PRINTABLE Instanz
*                         + 2 Zahlen (und die out Instanz)
*                         Die ZIF_PRINTABLE Instanz führt die Berechnung aus und gibt dann das Ergebnis aus.
*                         Anschließend wird von der doPrint Methode die Rückgabe von print ausgegeben.

CLASS zcl_printtest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS:  doPrint
    IMPORTING
      printerClass TYPE REF TO zif_printable
      val1 TYPE i
      val2 TYPE i
      OUT TYPE REF TO if_oo_adt_classrun_out
    RETURNING
      VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_printtest IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: printer TYPE REF TO zif_printable,
          r TYPE i.

    me->doPrint( printerClass = NEW zcl_printer1(  ) val1 = 10 val2 = 5 out = out ).

    DATA: instanz1 TYPE REF TO zif_printable,
          instanz2 TYPE REF TO zif_printable.

    instanz1 = NEW zcl_printer1(  ).
    instanz2 = NEW zcl_printer2(  ).

    IF ( cl_abap_typedescr=>describe_by_object_ref( instanz1 ) ) IS INSTANCE OF cl_abap_classdescr.
      out->write( 'Ist cl_abap_classdescr' ).
    ENDIF.
    IF ( instanz1 IS INSTANCE OF zif_printable ).
      out->write( 'I1: Ist vom Typ zif_printable' ).
    ENDIF.
    IF ( instanz1 IS INSTANCE OF zcl_printer1 ).
      out->write( 'I1: Ist vom Typ zcl_printer1' ).
    ENDIF.
    IF ( instanz1 IS INSTANCE OF zcl_printer2 ).
      out->write( 'I1: Ist vom Typ zcl_printer2' ).
    ENDIF.

    IF ( instanz2 IS INSTANCE OF zif_printable ).
      out->write( 'I2: Ist vom Typ zif_printable' ).
    ENDIF.
    IF ( instanz2 IS INSTANCE OF zcl_printer1 ).
      out->write( 'I2: Ist vom Typ zcl_printer1' ).
    ENDIF.
    IF ( instanz2 IS INSTANCE OF zcl_printer2 ).
      out->write( 'I2: Ist vom Typ zcl_printer2' ).
    ENDIF.
  ENDMETHOD.
  METHOD doPrint.
    result = printerClass->print( val1 = val1 val2 = val2 out = out ).
    out->write( |Rückgabe: { result }| ).
  ENDMETHOD.

ENDCLASS.
