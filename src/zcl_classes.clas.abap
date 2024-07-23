CLASS zcl_classes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS: simple
      IMPORTING
        io_out TYPE REF TO if_oo_adt_classrun_out.

     METHODS:
 "! <p class="shorttext synchronized" lang="de">Methode zum addieren von zwei Zahlen.</p>
 "!
 "! @parameter v1 | <p class="shorttext synchronized" lang="de">Eingabe Wert 1</p>
 "! @parameter v2 | <p class="shorttext synchronized" lang="de">Eingabe Wert 2</p>
 "! @parameter erg | <p class="shorttext synchronized" lang="de">Rückgabe, Summe aus beiden Werten</p>
             calc
      IMPORTING
        v1 TYPE i
        v2 TYPE i
      RETURNING
        VALUE(erg) TYPE i.


  CLASS-METHODS:

    "! <p class="shorttext synchronized" lang="de">Statische Methode die immer 100 zurück gibt.</p>
    "!
    "! @parameter z | <p class="shorttext synchronized" lang="de">Rückgabe: 100</p>
    zahl RETURNING VALUE(z) TYPE i.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_classes IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( 'Start' ).
    me->simple( out ).

    me->calc(
      EXPORTING
        v1  = 1
        v2  = 3
      RECEIVING
        erg = DATA(ze)
    ).
    out->write( ze ).

    DATA: z1 TYPE i,
          z2 TYPE i,
          er  TYPE i.

    z1 = zcl_classes=>zahl(  ).
    z2 = 10.

    er = me->calc( v1 = z1 v2 = z2 ).
    out->write( er ).
  ENDMETHOD.

  METHOD simple.
    io_out->write( 'Simple' ).
  ENDMETHOD.
  METHOD calc.
    erg = v1 + v2.
  ENDMETHOD.

  METHOD zahl.
    z = 100.
  ENDMETHOD.

ENDCLASS.

