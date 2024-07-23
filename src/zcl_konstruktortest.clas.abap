CLASS zcl_konstruktortest DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_konstruktortest IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: cls TYPE REF TO zcl_konstruktor,
          cls2 TYPE REF TO zcl_konstruktor.

    cls = NEW zcl_konstruktor( val1 = 10 val2 = 'Hans' ).
    cls->test( out = out ).
    out->write( |\nGetter und Setter Zugriffe:\n| ).

    out->write( |VOR  SET: Name={ cls->getName(  ) }, Wert={ cls->getWert(  ) }| ).

    cls->setWert( value = 20 ).
    cls->setName( value = 'Hugo' ).
    out->write( |NACH SET: Name={ cls->getName(  ) }, Wert={ cls->getWert(  ) }| ).

    out->write( |\nStatischer Konstruktor/default Wert={ zcl_konstruktor=>getdefaultWert(  ) }| ).

    out->write( |--------------------------------------------------------------------------------| ).
    out->write( |Weitere Instanz ohne Konstruktor Parameter (Default Werte nutzen)| ).

    cls2 = NEW zcl_konstruktor(  ).
    cls2->test( out = out ).


  ENDMETHOD.

ENDCLASS.
