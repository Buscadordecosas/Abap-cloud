CLASS zcl_test_maquina_chicles_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_maquina_chicles_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    data(lo_maquina) = NEW zcl_maquina_chicles_09( iv_can_inicial = 2 ).
    data(lv_cambio) = lo_maquina->vender_chicle( 25 ).
    out->write( |El cambio es { lv_cambio } cent| ).

    lv_cambio = lo_maquina->vender_chicle( 50 ).
    out->write( |El cambio es { lv_cambio } cent| ).

    lv_cambio = lo_maquina->vender_chicle( 25 ).
    out->write( |El cambio es { lv_cambio } cent| ).



  ENDMETHOD.
ENDCLASS.
