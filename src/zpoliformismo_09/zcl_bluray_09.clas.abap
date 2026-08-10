CLASS zcl_bluray_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_soporte_video_09
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_recomendable_09.
    METHODS:
      constructor
        IMPORTING iv_titulo          TYPE string
                  iv_precio_alquiler TYPE zdecimals2
                  iv_es_version_4k   TYPE abap_bool,
      calcular_precio_final REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA mv_es_version_4k TYPE abap_bool.
ENDCLASS.



CLASS zcl_bluray_09 IMPLEMENTATION.



  METHOD constructor.

    super->constructor( iv_titulo          = iv_titulo
                        iv_precio_alquiler = iv_precio_alquiler ).
    mv_es_version_4k                      = iv_es_version_4k.
  ENDMETHOD.



  METHOD calcular_precio_final.
    IF mv_es_version_4k = abap_true.
      rv_importe = super->calcular_precio_final( ) * '1.50'.
    ENDIF.
  ENDMETHOD.

  METHOD zif_recomendable_09~recomendar.
    IF mv_es_version_4k = abap_true.
      rv_recomendar = 'Incluye extras'.
    ELSE.
      rv_recomendar = 'No incluye extras'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
