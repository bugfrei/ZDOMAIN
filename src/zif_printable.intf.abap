INTERFACE zif_printable
  PUBLIC .
    METHODS: print
      IMPORTING
        val1 TYPE i
        val2 TYPE i
        out TYPE REF TO if_oo_adt_classrun_out
      RETURNING
        VALUE(result) TYPE i.
ENDINTERFACE.
