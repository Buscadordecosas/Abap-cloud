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
    data(lo_caseta) = NEW zcl_caseta_09( ).
    DATA(lo_atarccion) = new zcl_atraccion_feria_09( 3 ).
    DATA(lo_concierto) = new zcl_concierto_09( ).
*2. Meter los tres objetos en *una única tabla interna* del tipo del padre (TABLE OF REF TO zcl_atraccion_00).

*3. Recorrer la tabla con un LOOP, y para cada elemento: llamar a recibir_visitante( ) una vez,
"  y mostrar por consola el nombre (si lo tenéis como atributo) junto con el resultado de calcular_precio_entrada( ).
*4. Fuera del LOOP, forzar que el concierto reciba 500 visitantes de golpe
" (con un bucle simple llamando 500 veces a recibir_visitante( ) sobre el objeto concierto directamente, no a través de la tabla),
"  y volver a consultar su precio — comprobad que ahora sale el precio reducido.

  ENDMETHOD.
ENDCLASS.
