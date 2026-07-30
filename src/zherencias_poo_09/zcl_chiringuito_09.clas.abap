CLASS zcl_chiringuito_09 DEFINITION
  PUBLIC
"  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*Tiene*: un nombre, y el dinero recaudado en el día (empieza en 0).
    METHODS:
      constructor IMPORTING iv_nombre TYPE string,

      vender IMPORTING iv_importe           TYPE zdecimals2
             RETURNING VALUE(rv_importe_ok) TYPE abap_bool,

      calcular_comision_ayuntamiento RETURNING VALUE(rv_importe) TYPE zdecimals2,

      consultar_recaudacion RETURNING VALUE(rv_recaudacion) TYPE zdecimals2.
*Sabe*:
*vender*: recibe un importe (IMPORTING),
    " y lo suma a la recaudación del día.
    "Comportamiento por defecto (el del padre):
    " se acepta cualquier importe mayor que 0, sin más condiciones.
*calcular_comision_ayuntamiento: sin parámetros,
    " devuelve (RETURNING) un importe.
    "Comportamiento por defecto del padre:
    " la comisión es siempre el **10%* de la recaudación del día.
*consultar_recaudacion*: devuelve (RETURNING) la recaudación acumulada del día.


  PROTECTED SECTION.
    DATA:
      mv_nombre      TYPE STring,
      mv_recaudacion TYPE zdecimals2.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_chiringuito_09 IMPLEMENTATION.
  METHOD constructor.
    mv_nombre = iv_nombre.
    mv_recaudacion = 0.
  ENDMETHOD.

  METHOD vender.
    rv_importe_ok = abap_false.
    IF iv_importe > 0.
      mv_recaudacion += iv_importe.
      rv_importe_ok = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD calcular_comision_ayuntamiento.
    rv_importe = mv_recaudacion * '0.1'.
  ENDMETHOD.

  METHOD consultar_recaudacion.
    rv_recaudacion = mv_recaudacion.
  ENDMETHOD.

ENDCLASS.
