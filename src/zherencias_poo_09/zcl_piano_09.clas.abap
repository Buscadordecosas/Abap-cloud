CLASS zcl_piano_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_instrumento_09
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
"Constructor propio: recibe marca *y* si es eléctrico (abap_bool).
"Atributo propio: si es eléctrico (abap_bool).

"Método propio pedalear: sin parámetros de entrada.
" Solo tiene sentido si el piano lleva *al menos 1 hora de uso acumulada*
"  (un piano recién estrenado, sin haberse tocado nunca,
"   no tiene sentido que ya se le esté dando al pedal).
"Devuelve (RETURNING) un abap_bool indicando si la acción se pudo hacer.
  METHODS:
    constructor importing iv_marca_piano TYPE string
                          iv_electrico TYPE abap_boolean,
    pedalear RETURNING VALUE(rv_accion) type abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
    data mv_electrico type abap_boolean.


ENDCLASS.



CLASS zcl_piano_09 IMPLEMENTATION.

  METHOD constructor.

    super->constructor( iv_marca = iv_marca_piano ).
    mv_electrico = iv_electrico.

  ENDMETHOD.

  METHOD pedalear.
  rv_accion = abap_false.
  if horas_acumuladas >= 1.
    rv_accion = abap_true.
    ENDIF.
  ENDMETHOD.





ENDCLASS.
