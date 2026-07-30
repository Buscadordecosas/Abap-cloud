CLASS zcl_bombilla_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA esta_encendida TYPE abap_bool.

  METHODS: encender.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bombilla_09 IMPLEMENTATION.

    METHOD encender.
        esta_encendida = abap_true.
    ENDMETHOD.


ENDCLASS.
