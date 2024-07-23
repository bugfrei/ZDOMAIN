CLASS zcl_zbirthdays_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zbirthdays_data IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA itab TYPE TABLE OF zbirthdays.

  itab = VALUE #(
    (
      dob = '19830721'
      id = cl_system_uuid=>create_uuid_x16_static( )
      name = 'Hugo'
 )
    (
      dob = '19871013'
      id = cl_system_uuid=>create_uuid_x16_static( )
      name = 'Peter'
 )
    (
      dob = '19910501'
      id = cl_system_uuid=>create_uuid_x16_static( )
      name = 'Marie'
 )
    (
      dob = '19731201'
      id = cl_system_uuid=>create_uuid_x16_static( )
      name = 'Birgit'
 )
  ).

  DELETE FROM zbirthdays.

  INSERT zbirthdays FROM TABLE @itab.

  out->write( | { sy-dbcnt } entries inserted successfully | ).

  ENDMETHOD.
ENDCLASS.

