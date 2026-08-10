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

  data lt_notificaciones TYPE TABLE of REF TO zif_notificable_09.

  APPEND lo_sms to lt_notificaciones.
  APPEND lo_carta to lt_notificaciones.

  APPEND new zcl_notificacion_sms_09( iv_num_telf = '666999696' ) to lt_notificaciones.
  APPEND new zcl_notificacion_carta_09( iv_postal = '21005' ) to lt_notificaciones.

  out->write( |Comienza el bucle:| ).
    DATA(lv_contador) = 0.
    LOOP AT lt_notificaciones INTO DATA(lo_notificacion).
      lv_coste = lo_notificacion->consultar_coste_envio(  ).
      out->write( |El coste es { lv_coste }€| ).
      lv_contador += 1.
    ENDLOOP.
    out->write( |El número de envíos es { lv_contador }| ).

    DATA(lo_descriptor) =
            cl_abap_typedescr=>describe_by_object_ref( lo_notificacion ).
      DATA(lv_tipo_real) = lo_descriptor->get_relative_name( ).
      out->write( |La notificación es de tipo: { lv_tipo_real }| ).


  ENDMETHOD.
ENDCLASS.
