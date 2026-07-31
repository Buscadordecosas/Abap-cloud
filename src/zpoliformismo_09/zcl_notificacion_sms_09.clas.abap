CLASS zcl_notificacion_sms_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_notificable_09.

    METHODS constructor IMPORTING iv_num_telf TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA mv_num_telf TYPE string.
ENDCLASS.



CLASS zcl_notificacion_sms_09 IMPLEMENTATION.


  METHOD zif_notificable_09~consultar_coste_envio.
    rv_coste = '0.10'.

  ENDMETHOD.

  METHOD zif_notificable_09~notificar.

  ENDMETHOD.

  METHOD constructor.
    mv_num_telf = iv_num_telf.
  ENDMETHOD.

ENDCLASS.
