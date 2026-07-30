CLASS zcl_dron_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING iv_carga_maxima TYPE i,
      recoger_paquete IMPORTING iv_peso         TYPE i
                      RETURNING VALUE(rv_carga) TYPE abap_boolean,
      volar_a_cliente RETURNING VALUE(rv_cliente) TYPE abap_boolean,
      recargar,
      consultar_estado EXPORTING ev_bateria      TYPE i
                                 ev_carga_actual TYPE i
                                 ev_modo_reserva TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:
      mv_bateria      TYPE i,
      mv_carga_maxima TYPE i,
      mv_carga_actual TYPE i,
      mv_modo_reserva TYPE abap_bool.


ENDCLASS.



CLASS zcl_dron_09 IMPLEMENTATION.
  METHOD constructor.

    mv_carga_maxima = iv_carga_maxima.
    mv_bateria      = 100.
    mv_carga_actual = 0.
    mv_modo_reserva      = abap_false.

  ENDMETHOD.

  METHOD recoger_paquete.

    DATA(lv_carga_aux) = mv_carga_actual + iv_peso.

    IF lv_carga_aux <= mv_carga_maxima
       AND mv_bateria >= 20.

      mv_carga_actual = lv_carga_aux.
      rv_carga = abap_true.

    ELSE.

      rv_carga = abap_false.

    ENDIF.

  ENDMETHOD.

  METHOD volar_a_cliente.

    IF mv_modo_reserva = abap_false.

      "¿Lleva carga?
      IF mv_carga_actual > 0.

        DATA(lv_bateria_restante) = mv_bateria - 15.

      ELSE.

        lv_bateria_restante = mv_bateria - 5.

      ENDIF.

      IF lv_bateria_restante < 0.

        rv_cliente = abap_false.

      ELSE.

        rv_cliente = abap_true.

        mv_carga_actual = 0.
        mv_bateria = lv_bateria_restante.

        IF lv_bateria_restante <= 10.

          mv_modo_reserva = abap_true.

        ENDIF.

      ENDIF.

    ELSE.

      rv_cliente = abap_false.

    ENDIF.

  ENDMETHOD.

  METHOD recargar.

    mv_bateria = 100.
    mv_modo_reserva = abap_false.

  ENDMETHOD.

  METHOD consultar_estado.

    ev_bateria      = mv_bateria.
    ev_carga_actual = mv_carga_actual.
    ev_modo_reserva = mv_modo_reserva.

  ENDMETHOD.

ENDCLASS.
