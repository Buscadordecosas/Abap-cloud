CLASS zcl_ascensor_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING iv_planta_maxima TYPE i
                  iv_peso_maximo   TYPE i,
      entrar_peso
        IMPORTING iv_peso TYPE i,
      vaciar,
      subir_planta
        IMPORTING iv_planta        TYPE i
        RETURNING VALUE(rv_planta) TYPE abap_boolean,
      consultar_estado
        EXPORTING ev_planta_actual TYPE i
                  ev_peso_actual   TYPE i
                  ev_bloqueado     TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION. "atributos
    DATA:
      mv_planta_actual TYPE i,
      mv_planta_maxima TYPE i,
      mv_peso_actual   TYPE i,
      mv_peso_maximo   TYPE i,
      mv_bloqueado     TYPE abap_boolean.


ENDCLASS.



CLASS zcl_ascensor_09 IMPLEMENTATION.




  METHOD constructor.

    mv_planta_maxima = iv_planta_maxima.
    mv_peso_maximo   = iv_peso_maximo.

    mv_planta_actual = 0.
    mv_peso_actual   = 0.

    mv_bloqueado     = abap_false.

  ENDMETHOD.

  METHOD entrar_peso.
    IF mv_bloqueado = abap_false. "si no esta bloqueado entra al if.
      IF mv_peso_actual + iv_peso <= mv_peso_maximo. " Si peso actual + peso <= max.
        mv_planta_actual = mv_peso_actual + iv_peso.
      ELSE.
        mv_bloqueado = abap_true.

      ENDIF.
    ENDIF.

  ENDMETHOD.

  METHOD vaciar.
    mv_peso_actual = 0.
    mv_bloqueado = abap_false.

  ENDMETHOD.

  METHOD subir_planta.
    IF mv_bloqueado = abap_true.
      rv_planta = abap_false.
    ELSEIF iv_planta >= 0 AND iv_planta <= mv_planta_maxima.
      mv_planta_actual = iv_planta.
      rv_planta = abap_true.
    ENDIF.

  ENDMETHOD.


  METHOD consultar_estado.
    ev_planta_actual = mv_planta_actual.
    ev_peso_actual = mv_peso_actual.
    ev_bloqueado = mv_bloqueado.

  ENDMETHOD.

ENDCLASS.
