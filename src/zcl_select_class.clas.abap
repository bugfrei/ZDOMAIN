CLASS zcl_select_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_select_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TYPES: BEGIN OF T_BD,
           ID TYPE raw16,
           NAME TYPE string,
           DOB TYPE d,
           BDITEM TYPE REF TO zcl_birthdays,
         END OF T_BD.

    DATA bds TYPE STANDARD TABLE OF T_BD WITH EMPTY KEY.

    SELECT ID, NAME, DOB FROM zbirthdays
    INTO CORRESPONDING FIELDS OF TABLE @bds.

    LOOP AT BDS REFERENCE INTO DATA(B).
      B->BDITEM = NEW ZCL_BIRTHDAYS( B->id ).
    ENDLOOP.

    out->write( 'fertig' ).

  ENDMETHOD.
ENDCLASS.
