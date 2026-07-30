CLASS zcl_bombilla_prv_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: encender,
      get_encendida RETURNING VALUE(rv_encedida) TYPE abap_bool.



  PROTECTED SECTION.

  PRIVATE SECTION.
      " Atributo
    DATA esta_encendida TYPE abap_bool.


ENDCLASS.



CLASS zcl_bombilla_prv_09 IMPLEMENTATION.

  METHOD encender.
    esta_encendida = abap_true.
  ENDMETHOD.

  METHOD get_encendida.
    " Parámetro = Atributo
    rv_encedida = esta_encendida.
  ENDMETHOD.

ENDCLASS.
