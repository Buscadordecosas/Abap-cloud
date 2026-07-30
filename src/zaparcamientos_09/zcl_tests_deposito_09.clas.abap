CLASS zcl_tests_deposito_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tests_deposito_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  data lv_minutos TYPE i.

  data(lo_aparcamiento) = new zcl_aparcamiento_09( ).


  data(lv_total) = lo_aparcamiento->calcular_tarifa(
  EXPORTING iv_horas_estacionado = 8
  IMPORTING ev_minutos_totales = lv_minutos ).

  out->write( |Se ha estaciado { lv_minutos } minutos y nos ha costado { lv_total }€| ).

  ENDMETHOD.
ENDCLASS.
