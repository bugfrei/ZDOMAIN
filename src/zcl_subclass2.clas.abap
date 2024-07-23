CLASS zcl_subclass2 DEFINITION
  PUBLIC
  INHERITING FROM zcl_baseabstract
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS: test1 REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_subclass2 IMPLEMENTATION.
  METHOD test1.
    out->write( |Ausgabe von test1 der Subklasse2 (Abstakt; Implemtierung der Methode test1| ).
  ENDMETHOD.
ENDCLASS.
