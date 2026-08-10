CLASS zcl_dvd_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_soporte_video_09
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES zif_recomendable_09.
  METHODS:
    constructor
        IMPORTING iv_titulo TYPE string
                  iv_precio_alquiler TYPE zdecimals2
                  iv_incluye_extras TYPE abap_bool,
    calcular_precio_final REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
    data mv_incluye_extras type abap_bool.
ENDCLASS.



CLASS zcl_dvd_09 IMPLEMENTATION.



  METHOD constructor.

    super->constructor( iv_titulo          = iv_titulo
                        iv_precio_alquiler = iv_precio_alquiler ).
    mv_incluye_extras                      = iv_incluye_extras.
  ENDMETHOD.



  METHOD calcular_precio_final.
    if mv_incluye_extras = abap_true.
       rv_importe = super->calcular_precio_final( ) + '0.50'.
    ENDIF.
  ENDMETHOD.

  METHOD zif_recomendable_09~recomendar.
  if mv_incluye_extras = abap_true.
    rv_recomendar = 'Incluye extras'.
    else.
     rv_recomendar = 'No incluye extras'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
