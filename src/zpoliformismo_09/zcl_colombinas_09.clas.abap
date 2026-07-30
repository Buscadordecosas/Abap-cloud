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
        constructor,
*            importing   iv_nombre type  string
*                        iv_num_visitantes TYPE i,
        recibir_visitante,
        calcular_precio_entrada RETURNING VALUE(rv_precio) type zdecimals2,
        consultar_visitantes RETURNING VALUE(rv_numero) type i.

  PROTECTED SECTION.
    data:
          nombre type  string,
          num_visitantes TYPE i.
  PRIVATE SECTION.



ENDCLASS.



CLASS zcl_colombinas_09 IMPLEMENTATION.


  METHOD constructor.
    nombre = 'David'.
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

ENDCLASS.
