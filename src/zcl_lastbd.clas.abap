CLASS zcl_lastbd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lastbd IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: itab TYPE TABLE OF zbirthdays,
          item TYPE zbirthdays,
          today TYPE d,
          dayDiff TYPE i,
          prev TYPE zbirthdays,
          prevDiff TYPE i,
          current_year TYPE string,
          janein TYPE abap_boolean,
          dob TYPE d.

          janein = abap_true.

          out->write( janein ).

    SELECT * FROM zbirthdays INTO TABLE @itab.
    today = sy-datum.
    today = '20241015'.

*out->write( 'Huhu\nHaha' ).
    DATA: formatDate TYPE string.

    formatDate = |{ today+6(2) }.{ today+4(2) }.{ today+0(4) }|.
    out->write( formatDate ).

    current_year = sy-datum(4).

    " Lowest positive Diff-Value = nearst Date before Today in actual Year
    LOOP AT itab INTO item.
      dob = item-dob.
      dob = current_year && dob+4(4). "19830507 -> 20240507
      dayDiff = today - dob.
      IF dayDiff >= 0.
        IF ( prevDiff IS INITIAL ) OR dayDiff < prevDiff.
          prev = item.
          prevDiff = dayDiff.
        ENDIF.
      ENDIF.
    ENDLOOP.


    IF ( prevDiff IS INITIAL ).
      " Nothing found, no one had birthday this year
      " Lowest negative diff Value = Nearest Birthdate to Dec. 31 past year
      LOOP AT itab INTO item.
        dob = item-dob.
        dob = current_year && dob+4(4).
        dayDiff = today - dob.
        IF dayDiff < 0.
          IF ( prevDiff IS INITIAL ) OR dayDiff < prevDiff.
            prev = item.
            prevDiff = dayDiff.
          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDIF.

    out->write( | Geburtstag von { prev-name } am { prev-dob } | ).
  ENDMETHOD.
ENDCLASS.
