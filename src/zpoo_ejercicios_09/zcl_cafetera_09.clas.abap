CLASS zcl_cafetera_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
        constructor IMPORTING i_cantidad_agua TYPE i,
        preparar_cafe,
        consultar_agua RETURNING VALUE(rv_agua) type i.

  PRIVATE SECTION.
   data agua_restante type i.

ENDCLASS.



CLASS zcl_cafetera_09 IMPLEMENTATION.


  METHOD constructor.

    agua_restante = i_cantidad_agua.

  ENDMETHOD.



  METHOD consultar_agua.
  rv_agua = agua_restante.

  ENDMETHOD.

  METHOD preparar_cafe.
    if agua_restante >= 250.
        agua_restante = agua_restante - 250.
        ENDIF.

  ENDMETHOD.

ENDCLASS.
