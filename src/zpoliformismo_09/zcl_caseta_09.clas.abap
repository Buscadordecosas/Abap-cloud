CLASS zcl_caseta_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_colombinas_09
  FINAL
  CREATE PUBLIC .
*Las casetas de comida y bebida no cobran entrada,
"son gratuitas para entrar — igual que el padre.
"   *No redefine calcular_precio_entrada.*

*Añade un método propio: pedir_rebujito,
"   sin parámetros ni lógica obligatoria.

  PUBLIC SECTION.
    METHODS pedir_rebujito.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_caseta_09 IMPLEMENTATION.

  METHOD pedir_rebujito.

  ENDMETHOD.

ENDCLASS.
