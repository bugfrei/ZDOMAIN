CLASS zcl_exceptionsample DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: INFO TYPE string.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF ZCX_DEMO_DEFAULT,
        MSGID TYPE SYMSGID VALUE 'ZMC_SAMPLEMSG',
        MSGNO TYPE SYMSGNO VALUE '001',
        ATTR1 TYPE SCX_ATTRNAME VALUE '',
        ATTR2 TYPE SCX_ATTRNAME VALUE '',
        ATTR3 TYPE SCX_ATTRNAME VALUE '',
        ATTR4 TYPE SCX_ATTRNAME VALUE '',
      END OF ZCX_DEMO_DEFAULT.

    CONSTANTS:
      BEGIN OF ZCX_ERRORINFO,
        MSGID TYPE SYMSGID VALUE 'ZMC_SAMPLEMSG',
        MSGNO TYPE SYMSGNO VALUE '002',
        ATTR1 TYPE SCX_ATTRNAME VALUE 'INFO',
        ATTR2 TYPE SCX_ATTRNAME VALUE '',
        ATTR3 TYPE SCX_ATTRNAME VALUE '',
        ATTR4 TYPE SCX_ATTRNAME VALUE '',
      END OF ZCX_ERRORINFO.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        !info     TYPE string OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_exceptionsample IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
    ME->info = info.
  ENDMETHOD.
ENDCLASS.
