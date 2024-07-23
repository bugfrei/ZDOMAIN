CLASS zcl_inherittest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_inherittest IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: cl1normal TYPE REF TO ZCL_BASECLASS,
          cl2normal TYPE REF TO ZCL_SUBCLASS,
          cl1abstract TYPE REF TO ZCL_BASEABSTRACT.

   cl1normal = NEW ZCL_BASECLASS( ).
   cl2normal = NEW ZCL_SUBCLASS( ).

   cl1normal->test1( out = out ).
   cl1normal->test2( out = out ).
   " Ausgabe der Basisklasse von test1
   " Ausgabe der Basisklasse von test2

   cl2normal->test1( out = out ).
   cl2normal->test2( out = out ).
   " Ausgabe von test1 der Subklasse (Überschriebene Methode test1
   " Ausgabe der Basisklasse von test2

   out->write( |--------------------------------------------------| ).

   "cl1abstract = NEW ZCL_BASEABSTRACT(  ).
   " Erstellen einer Instanz von ZCL_BASEABSTRACT ist nicht erlaubt!!!
   cl1abstract = NEW ZCL_SUBCLASS2(  ).
   " Aber man kann dem Typ der ZCL_BASEABSTRACT eine Instanz der Subklasse zuweisen

    cl1abstract->test1( out = out ).
    cl1abstract->test2( out = out ).
    " Ausgabe von test1 der Subklasse2 (Abstakt; Implemtierung der Methode test1
    " Mann kann aber Code implementieren
  ENDMETHOD.
ENDCLASS.
