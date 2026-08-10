CLASS zcl_soporte_video_09 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    CLASS-METHODS consultar_total_soportes RETURNING VALUE(rv_contador) TYPE i.
    METHODS: constructor
      IMPORTING iv_titulo          TYPE string
                iv_precio_alquiler TYPE zdecimals2,
      calcular_precio_final RETURNING VALUE(rv_importe) TYPE zdecimals2,
      registrar_alquiler,
      consultar_veces_alquilado RETURNING VALUE(rv_veces) type i.

  PROTECTED SECTION.
  CLASS-DATA total_soportes_creados TYPE i.
    DATA:
      mp_titulo          TYPE string,
      mp_precio_alquiler TYPE p LENGTH 10 DECIMALS 2.
  PRIVATE SECTION.
    DATA mv_veces_alquilado TYPE i.

ENDCLASS.



CLASS zcl_soporte_video_09 IMPLEMENTATION.

  METHOD consultar_total_soportes.
    rv_contador = total_soportes_creados.
  ENDMETHOD.

  METHOD constructor.
    mp_titulo          = iv_titulo.
    mp_precio_alquiler = iv_precio_alquiler.
    mv_veces_alquilado = 0.

    total_soportes_creados += 1.
  ENDMETHOD.

  METHOD calcular_precio_final.
    rv_importe = mp_precio_alquiler.
  ENDMETHOD.

  METHOD registrar_alquiler.
    mv_veces_alquilado += 1.
  ENDMETHOD.

  METHOD consultar_veces_alquilado.
    rv_veces = mv_veces_alquilado.
  ENDMETHOD.

ENDCLASS.
