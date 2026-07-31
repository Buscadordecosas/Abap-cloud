CLASS zcl_test_notificaciones_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_notificaciones_09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    data(lo_sms) = new zcl_notificacion_sms_09( iv_num_telf = '666999696' ).
    data(lo_carta) = new zcl_notificacion_carta_09( iv_postal = '21005' ).

  data(lv_coste) = lo_sms->zif_notificable_09~consultar_coste_envio( ).
  out->write( |El coste del SMS { lv_coste } €| ).

  lv_coste = lo_carta->zif_notificable_09~consultar_coste_envio( ).
  out->write( |El coste del SMS { lv_coste } €| ).
  ENDMETHOD.
ENDCLASS.
