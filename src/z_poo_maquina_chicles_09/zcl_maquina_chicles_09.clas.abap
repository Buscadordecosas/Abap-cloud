CLASS zcl_maquina_chicles_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
        constructor   importing iv_can_inicial type i,
        vender_chicle importing iv_mon_insertada type i
                        returning value(rv_cambio) type i,
        consultar_stock returning value(rv_restantes) type i.

  PROTECTED SECTION.
  PRIVATE SECTION.
    data:
        mv_restantes type i, "chicles restantes
        mv_precio type i. "centimos


ENDCLASS.



CLASS zcl_maquina_chicles_09 IMPLEMENTATION.
  METHOD constructor.
    mv_restantes = iv_can_inicial.
    mv_precio = 25. "centimos.
  ENDMETHOD.

  METHOD vender_chicle.
    if mv_restantes >= 0 or iv_mon_insertada < mv_precio.
        rv_cambio = iv_mon_insertada.
    else.
        rv_cambio = iv_mon_insertada - mv_precio.
    endif.

  ENDMETHOD.

  METHOD consultar_stock.
    rv_restantes = mv_restantes.
  endmethod.



ENDCLASS.
