CLASS zcl_colombinas_09 DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .
  "   Toda atracción del recinto:
*Tiene*: un nombre, y el número de visitantes que han pasado por ella hoy.
*Sabe*:
*recibir_visitante*: sin parámetros de entrada,
  "   suma 1 al contador de visitantes de hoy.
*calcular_precio_entrada: sin parámetros,
  "   devuelve (RETURNING) un importe.
  "   Comportamiento del padre: **entrada gratuita (0€)*, por defecto.
*consultar_visitantes*: devuelve (RETURNING) el número de visitantes de hoy.
  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING iv_nombre TYPE  string,
*                  iv_num_visitantes TYPE i,
      recibir_visitante,
      calcular_precio_entrada RETURNING VALUE(rv_precio) TYPE zdecimals2,
      consultar_visitantes RETURNING VALUE(rv_numero)    TYPE i,
      get_nombre RETURNING VALUE(rv_nombre) TYPE string.

  PROTECTED SECTION.
    DATA:
      nombre         TYPE  string,
      num_visitantes TYPE i.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_colombinas_09 IMPLEMENTATION.


  METHOD constructor.
    nombre = iv_nombre.
    num_visitantes = 0.
  ENDMETHOD.

  METHOD recibir_visitante.
    num_visitantes += 1.
  ENDMETHOD.

  METHOD calcular_precio_entrada.
    rv_precio = 0.
  ENDMETHOD.

  METHOD consultar_visitantes.
    rv_numero = num_visitantes.
  ENDMETHOD.

  METHOD get_nombre.
    rv_nombre = nombre.
  ENDMETHOD.

ENDCLASS.
