CLASS zcl_guitarra_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_instrumento_09
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "Constructor propio: recibe marca *y* número de cuerdas.
    "Atributo propio: número de cuerdas (tipo I).
    "Método propio afinar_cuerda: recibe (IMPORTING) el número de cuerda a afinar.
    "Devuelve (RETURNING) un abap_bool: abap_true
    "   si el número de cuerda pedido es válido (mayor que 0 y no mayor que
    "    el número de cuerdas que tiene esa guitarra en concreto), abap_false si no lo es.
    METHODS:
      constructor IMPORTING iv_marca_guitarra         TYPE string
                            iv_numero_cuerda_guitarra TYPE i,
      afinar_cuerda IMPORTING iv_numero_cuerda TYPE i
                    RETURNING VALUE(rv_cuerda) TYPE abap_boolean.
  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: mv_numero_cuerda TYPE i.

ENDCLASS.



CLASS zcl_guitarra_09 IMPLEMENTATION.
  METHOD constructor.

    super->constructor( iv_marca = iv_marca_guitarra ).
    mv_numero_cuerda = iv_numero_cuerda_guitarra.

  ENDMETHOD.

  METHOD afinar_cuerda.
    rv_cuerda = abap_false.
    IF iv_numero_cuerda > 0 AND iv_numero_cuerda < mv_numero_cuerda.
      rv_cuerda = abap_true.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
