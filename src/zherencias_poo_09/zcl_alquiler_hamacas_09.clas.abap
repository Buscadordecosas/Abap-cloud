CLASS zcl_alquiler_hamacas_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_chiringuito_09
  FINAL
  CREATE PUBLIC .
*Alquila hamacas y sombrillas, y aquí la particularidad está en la *comisión:
  "   el ayuntamiento le cobra más porque ocupa espacio físico de la playa.
  "   En vez del 10% general, a este tipo de negocio se le aplica un **20%* de comisión.
*
*Debe *redefinir calcular_comision_ayuntamiento*, cambiando el porcentaje al 20%.
  "   Pensad si os conviene reutilizar super->calcular_comision_ayuntamiento( ) de alguna forma ingeniosa
  "   (pista: el resultado del padre ya os da el 10%...
  "   ¿cómo llegaríais al 20% a partir de eso, sin repetir el cálculo desde cero?),
  "       o si preferís calcularlo directamente vosotros con vuestro propio porcentaje.

*No toca vender — hereda el comportamiento del padre tal cual (cualquier importe mayor que 0 se acepta).

*Añade además un método propio,
  "   reservar_sombrilla,
  "   recibe un número de sombrilla (IMPORTING),
  "   sin lógica obligatoria más allá de guardarlo
  "   o mostrarlo (vosotros decidís el nivel de detalle).

  PUBLIC SECTION.
    METHODS:
      calcular_comision_ayuntamiento REDEFINITION,
      reservar_sombrilla IMPORTING iv_numero_sombrilla TYPE i.


  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_numero_sombrilla TYPE i. "Para guardar el numero de sobrillas


ENDCLASS.



CLASS zcl_alquiler_hamacas_09 IMPLEMENTATION.



  METHOD calcular_comision_ayuntamiento.
    rv_importe = super->calcular_comision_ayuntamiento( ).
    rv_importe *= 2. " esto es el 20% de la comisión del 10% * 2 = 20%.
  ENDMETHOD.

  METHOD reservar_sombrilla.
    mv_numero_sombrilla = iv_numero_sombrilla.
  ENDMETHOD.


ENDCLASS.
