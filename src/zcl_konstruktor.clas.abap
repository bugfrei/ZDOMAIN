CLASS zcl_konstruktor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS: CLASS_CONSTRUCTOR,
                 getDefaultWert RETURNING VALUE(value) TYPE i.

  CLASS-DATA:
      defaultWert TYPE i.

  METHODS: CONSTRUCTOR
    IMPORTING
      val1 TYPE i DEFAULT 1
      val2 TYPE string DEFAULT 'Noname',

    Test
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out,

    getWert RETURNING VALUE(value) TYPE i,
    setWert IMPORTING value TYPE i,

    getName RETURNING VALUE(value) TYPE string,
    setName IMPORTING value TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
  DATA: wert TYPE i,
        name TYPE string.

ENDCLASS.



CLASS zcl_konstruktor IMPLEMENTATION.

  METHOD constructor.
    wert = val1.
    name = val2.
  ENDMETHOD.



  METHOD test.
    out->write( |Ausgabe von test(): Wert={ wert }, Name={ name }| ).
  ENDMETHOD.

  METHOD getname.
    value = name.
  ENDMETHOD.

  METHOD getwert.
    value = wert.
  ENDMETHOD.

  METHOD setname.
    name = value.
  ENDMETHOD.

  METHOD setwert.
    wert = value.
  ENDMETHOD.

  METHOD class_constructor.
    zcl_konstruktor=>defaultwert = 10.
  ENDMETHOD.


  METHOD getdefaultwert.
    value = zcl_konstruktor=>defaultwert.
  ENDMETHOD.

ENDCLASS.
