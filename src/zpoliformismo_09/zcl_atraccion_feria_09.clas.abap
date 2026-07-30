CLASS zcl_atraccion_feria_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_colombinas_09
  FINAL
  CREATE PUBLIC .
*Redefine calcular_precio_entrada*,
"devolviendo el precio fijo propio de esa atracción concreta
"   (guardado en un atributo propio).
*Añade un atributo propio: precio fijo (tipo p decimals 2),
"   que se recibe en su propio constructor.
  PUBLIC SECTION.
    METHODS:
     constructor
        IMPORTING iv_precio TYPE zdecimals2,
     calcular_precio_entrada REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

    data mv_precio_fijo type zdecimals2.

ENDCLASS.



CLASS zcl_atraccion_feria_09 IMPLEMENTATION.

  METHOD calcular_precio_entrada.
    rv_precio     = mv_precio_fijo.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).
    mv_precio_fijo = iv_precio.
  ENDMETHOD.

ENDCLASS.
