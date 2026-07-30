CLASS zcl_test_bombilla_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_bombilla_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_bombilla) = new zcl_bombilla_09( ).

    lo_bombilla->encender( ).

    out->write( |La bombilla = { lo_bombilla->esta_encendida }| ).
  ENDMETHOD.
ENDCLASS.
