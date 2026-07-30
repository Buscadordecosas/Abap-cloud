CLASS zcl_instrumento_09 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS:
    constructor importing iv_marca type string,
    registrar_practica importing horas_practicadas TYPE i,
    consultar_horas_uso RETURNING VALUE(rv_ok_cons) type i.

  PROTECTED SECTION.
    DATA:
      Marca            TYPE string,
      Horas_acumuladas TYPE i.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_instrumento_09 IMPLEMENTATION.
  METHOD constructor.
        marca = iv_marca.
        horas_acumuladas = 0.
  ENDMETHOD.

  METHOD registrar_practica.
        horas_acumuladas += horas_practicadas.
  ENDMETHOD.

  METHOD consultar_horas_uso.
    horas_acumuladas = rv_ok_cons.
  ENDMETHOD.

ENDCLASS.
