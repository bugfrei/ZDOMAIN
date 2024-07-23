CLASS zcl_exceptiondemo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    METHODS:
      DEMOMETHOD
      IMPORTING
        number TYPE i
      RAISING zcl_exceptionsample zcl_exceptionsimple.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exceptiondemo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        me->demomethod( 15 ).
      CATCH zcl_exceptionsample INTO DATA(var).
        out->write( var->get_text( ) ).
      CATCH zcl_exceptionsimple INTO DATA(var2).
        out->write( var2->info ).
    ENDTRY.

  ENDMETHOD.
  METHOD demomethod.
    IF number < 10.
      RAISE EXCEPTION NEW zcl_exceptionsample(
        TEXTID = zcl_exceptionsample=>zcx_errorinfo
        INFO = 'Info Text für den Platzhalter'
      ).
    ELSEIF number < 20.
      RAISE EXCEPTION NEW zcl_exceptionsimple( 'Nachricht' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
