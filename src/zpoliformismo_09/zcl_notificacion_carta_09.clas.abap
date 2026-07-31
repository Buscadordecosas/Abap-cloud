CLASS zcl_notificacion_carta_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_notificable_09.
    METHODS constructor IMPORTING iv_postal TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_postal TYPE string.
ENDCLASS.



CLASS zcl_notificacion_carta_09 IMPLEMENTATION.
  METHOD zif_notificable_09~consultar_coste_envio.
    rv_coste = '1.20'.
  ENDMETHOD.

  METHOD zif_notificable_09~notificar.

  ENDMETHOD.

  METHOD constructor.
    mv_postal = iv_postal.
  ENDMETHOD.

ENDCLASS.
