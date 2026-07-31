INTERFACE zif_notificable_09
  PUBLIC .
  METHODS:
    notificar IMPORTING iv_enviar type i,
    consultar_coste_envio RETURNING VALUE(rv_coste) type zdecimals2.



ENDINTERFACE.
