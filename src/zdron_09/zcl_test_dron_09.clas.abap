CLASS zcl_test_dron_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_dron_09 IMPLEMENTATION.


 METHOD if_oo_adt_classrun~main.

  DATA(lo_dron) = NEW zcl_dron_09(
    iv_carga_maxima = 5 ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = DATA(lv_bateria)
      ev_carga_actual = DATA(lv_carga_actual)
      ev_modo_reserva = DATA(lv_modo) ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Recoger un paquete de 3 kg

  lo_dron->recoger_paquete( 3 ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Volar (debe entregar y bajar batería)

  lo_dron->volar_a_cliente( ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Recoger otro paquete de 3 kg

  lo_dron->recoger_paquete( 3 ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Volar varias veces hasta entrar en reserva

  DO 20 TIMES.

    lo_dron->volar_a_cliente( ).

    lo_dron->consultar_estado(
      IMPORTING
        ev_bateria      = lv_bateria
        ev_carga_actual = lv_carga_actual
        ev_modo_reserva = lv_modo ).

    out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

  ENDDO.

* Intentar recoger un paquete estando en reserva

  lo_dron->recoger_paquete( 2 ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Recargar

  lo_dron->recargar( ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

* Volver a intentar recoger un paquete

  lo_dron->recoger_paquete( 2 ).

  lo_dron->consultar_estado(
    IMPORTING
      ev_bateria      = lv_bateria
      ev_carga_actual = lv_carga_actual
      ev_modo_reserva = lv_modo ).

  out->write( |La bateria { lv_bateria } - La carga { lv_carga_actual } - Modo reserva { lv_modo }| ).

ENDMETHOD.
ENDCLASS.
