CLASS zcl_prestamo_biblioteca_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA total_prestamos_realizados type I.
    CLASS-DATA prestamos_pendientes type I.
    class-METHODS:
    consultar_total_prestamos RETURNINg value(rv_total_prestamos_realizados) type zdecimals2,
    consultar_pendientes RETURNINg value(rv_prestamos_pendientes) type zdecimals2.

    METHODS:
        constructor
            IMPORTING iv_nombre TYPE string
                      iv_libro TYPE string
                      iv_devuelto type abap_boolean,

        marcar_devuelto,
        consultar_datos
            EXPORTING
                      ev_nombre TYPE string
                      ev_libro TYPE string
                      ev_devuelto type abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
  data:
    mv_nombre type string,
    mv_libro type string,
    mv_devuelto type abap_bool.
*Atributos privados: nombre del socio (string), título del libro (string), y si ya ha sido devuelto (abap_bool).
*Constructor: recibe nombre del socio y título del libro. El estado de devuelto arranca en abap_false. Aquí es donde tenéis que tocar también los dos contadores estáticos (sumar 1 a cada uno).
*Método marcar_devuelto: sin parámetros. Pone el atributo de devuelto a abap_true, y *resta 1* a prestamos_pendientes (el estático) — pero solo si antes no estaba ya devuelto (para no restar dos veces por error si alguien llama al método dos veces).
*Método consultar_datos: devuelve, por EXPORTING, el nombre del socio, el título y si está devuelto.
ENDCLASS.



CLASS zcl_prestamo_biblioteca_09 IMPLEMENTATION.

  METHOD consultar_total_prestamos.

  ENDMETHOD.

  METHOD consultar_pendientes.

  ENDMETHOD.
  METHOD constructor.
        mv_nombre = iv_nombre.
        mv_libro = iv_libro.
        mv_devuelto = iv_devuelto.
  ENDMETHOD.

  METHOD marcar_devuelto.

  ENDMETHOD.

  METHOD consultar_datos.

  ENDMETHOD.

ENDCLASS.
