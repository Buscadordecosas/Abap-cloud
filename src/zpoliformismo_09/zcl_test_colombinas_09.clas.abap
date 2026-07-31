CLASS zcl_test_colombinas_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_colombinas_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*1. Crear una caseta, una atracción de feria (con precio 3€) y un concierto.
    DATA(lo_caseta) = NEW zcl_caseta_09( iv_nombre = 'Antonio' ).
    DATA(lo_atraccion) = NEW zcl_atraccion_feria_09( iv_nombre = 'David' iv_precio = 3 ).
    DATA(lo_concierto) = NEW zcl_concierto_09( iv_nombre = 'Juan' ).
*2. Meter los tres objetos en *una única tabla interna* del tipo del padre (TABLE OF REF TO zcl_atraccion_00).
    DATA lt_atracciones TYPE TABLE OF REF TO zcl_colombinas_09.
    APPEND lo_caseta TO lt_atracciones.
    APPEND lo_atraccion TO lt_atracciones.
    APPEND lo_concierto TO lt_atracciones.
*3. Recorrer la tabla con un LOOP, y para cada elemento: llamar a recibir_visitante( ) una vez,
    "  y mostrar por consola el nombre (si lo tenéis como atributo) junto con el resultado de calcular_precio_entrada( ).
    LOOP AT lt_atracciones INTO DATA(lo_atracciones).
      lo_atracciones->recibir_visitante( ).
      DATA(lv_nombre) = lo_atracciones->get_nombre( ).
      DATA(lv_precio) = lo_atracciones->calcular_precio_entrada( ).
      out->write( lv_nombre &&  ` ` && lv_precio ).
    ENDLOOP.

*4. Fuera del LOOP, forzar que el concierto reciba 500 visitantes de golpe
    " (con un bucle simple llamando 500 veces a recibir_visitante( ) sobre el objeto concierto directamente, no a través de la tabla),
    "  y volver a consultar su precio — comprobad que ahora sale el precio reducido.
    DO 500 TIMES.
      lo_concierto->recibir_visitante( ).
    ENDDO.
        lv_nombre = lo_concierto->get_nombre( ).
        lv_precio = lo_concierto->calcular_precio_entrada( ).
            out->write( '-------------' ).
            out->write( lv_nombre &&  ` ` && lv_precio ).
  ENDMETHOD.
ENDCLASS.
