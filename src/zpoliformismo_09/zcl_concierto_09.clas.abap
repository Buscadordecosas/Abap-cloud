CLASS zcl_concierto_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_colombinas_09
  FINAL
  CREATE PUBLIC .
*Redefine calcular_precio_entrada*:
" si consultar_visitantes( ) es menor de 500,
" el precio es 10€; si es 500 o más, el precio es 5€.

*No añade ningún atributo ni método propio extra —
"  con la redefinición ya tiene toda su particularidad.
  PUBLIC SECTION.
    METHODS calcular_precio_entrada REDEFINITION.
  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_concierto_09 IMPLEMENTATION.

  METHOD calcular_precio_entrada.
    if consultar_visitantes( ) < 500.
    rv_precio = 10.
    else.
    rv_precio = 5.
    endif.
  ENDMETHOD.

ENDCLASS.
