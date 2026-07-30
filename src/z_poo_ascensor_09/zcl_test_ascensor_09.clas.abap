CLASS zcl_test_ascensor_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_ascensor_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

DATA(lo_ascensor) = NEW zcl_ascensor_09(
  iv_planta_maxima = 10
  iv_peso_maximo   = 400 ).

    DATA:
      lv_planta     TYPE i,
      lv_peso       TYPE i,
      lv_bloqueado  TYPE abap_bool.

*-----------------------------------------------------------------------
* Estado inicial
*-----------------------------------------------------------------------

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Estado inicial -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 1. Entran 300 kg
*-----------------------------------------------------------------------

    lo_ascensor->entrar_peso( 300 ).

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Tras entrar 300 kg -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 2. Intentan entrar 150 kg más
*-----------------------------------------------------------------------

    lo_ascensor->entrar_peso( 150 ).

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Tras intentar entrar 150 kg -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 3. Intentan subir a la planta 5
*-----------------------------------------------------------------------

    IF lo_ascensor->subir_planta( 5 ).

      out->write( 'Se ha podido subir a la planta 5.' ).

    ELSE.

      out->write( 'No se ha podido subir a la planta 5.' ).

    ENDIF.

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Estado -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 4. Vaciar ascensor
*-----------------------------------------------------------------------

    lo_ascensor->vaciar( ).

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Tras vaciar -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 5. Subir a la planta 5
*-----------------------------------------------------------------------

    IF lo_ascensor->subir_planta( 5 ).

      out->write( 'Se ha podido subir a la planta 5.' ).

    ELSE.

      out->write( 'No se ha podido subir a la planta 5.' ).

    ENDIF.

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Estado -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

*-----------------------------------------------------------------------
* 6. Intentar subir a la planta 15
*-----------------------------------------------------------------------

    IF lo_ascensor->subir_planta( 15 ).

      out->write( 'Se ha podido subir a la planta 15.' ).

    ELSE.

      out->write( 'No se ha podido subir a la planta 15.' ).

    ENDIF.

    lo_ascensor->consultar_estado(
      IMPORTING
        ev_planta_actual = lv_planta
        ev_peso_actual   = lv_peso
        ev_bloqueado     = lv_bloqueado ).

    out->write( |Estado final -> Planta: { lv_planta } Peso: { lv_peso } Bloqueado: { lv_bloqueado }| ).

  ENDMETHOD.

ENDCLASS.


