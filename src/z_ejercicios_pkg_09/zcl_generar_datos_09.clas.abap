CLASS zcl_generar_datos_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generar_datos_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   " Limpiar datos previos (por si se ejecuta varias veces)
      DELETE FROM zcliente_09.
      DELETE FROM zpedido_09.
  " ---------- CLIENTES ----------
    DATA lt_clientes TYPE TABLE OF zcliente_09.
  lt_clientes = VALUE #(
      ( cliente_id = '0001' nombre = 'Ana Garcia'      ciudad = 'Sevilla' )
      ( cliente_id = '0002' nombre = 'Luis Perez'      ciudad = 'Huelva' )
      ( cliente_id = '0003' nombre = 'Marta Ruiz'      ciudad = 'Cadiz' )
      ( cliente_id = '0004' nombre = 'Pedro Sanchez'   ciudad = 'Sevilla' )
      ( cliente_id = '0005' nombre = 'Lucia Fernandez' ciudad = 'Granada' )
      ( cliente_id = '0006' nombre = 'Javier Torres'   ciudad = 'Huelva' )
      ( cliente_id = '0007' nombre = 'Sara Jimenez'    ciudad = 'Malaga' )
      ( cliente_id = '0008' nombre = 'Diego Morales'   ciudad = 'Sevilla' )
    ).

     INSERT zcliente_09 FROM TABLE @lt_clientes.

       " ---------- PEDIDOS ----------
     DATA lt_pedidos TYPE TABLE OF zpedido_09.

     lt_pedidos = VALUE #(
      ( pedido_id = '0001' cliente_id = '0001' producto = 'Portatil'     importe = '899.00'  fecha = '20260115' )
      ( pedido_id = '0002' cliente_id = '0001' producto = 'Raton'         importe = '25.50'   fecha = '20260118' )
      ( pedido_id = '0003' cliente_id = '0002' producto = 'Monitor'       importe = '210.00'  fecha = '20260120' )
      ( pedido_id = '0004' cliente_id = '0002' producto = 'Teclado'       importe = '45.00'   fecha = '20260122' )
      ( pedido_id = '0005' cliente_id = '0003' producto = 'Auriculares'   importe = '60.00'   fecha = '20260125' )
      ( pedido_id = '0006' cliente_id = '0004' producto = 'Tablet'        importe = '320.00'  fecha = '20260128' )
      ( pedido_id = '0007' cliente_id = '0004' producto = 'Funda tablet'  importe = '18.00'   fecha = '20260130' )
      ( pedido_id = '0008' cliente_id = '0005' producto = 'Impresora'     importe = '150.00'  fecha = '20260201' )
      ( pedido_id = '0009' cliente_id = '0006' producto = 'Silla oficina' importe = '210.00'  fecha = '20260203' )
      ( pedido_id = '0010' cliente_id = '0007' producto = 'Portatil'      importe = '750.00'  fecha = '20260205' )
      ( pedido_id = '0011' cliente_id = '0007' producto = 'Mochila'       importe = '35.00'   fecha = '20260207' )
      ( pedido_id = '0012' cliente_id = '0008' producto = 'Monitor'       importe = '195.00'  fecha = '20260210' )
      ( pedido_id = '0013' cliente_id = '0001' producto = 'Webcam'        importe = '40.00'   fecha = '20260212' )
      ( pedido_id = '0015' cliente_id = '0005' producto = 'Raton'         importe = '22.00'   fecha = '20260218' )
    ).

    INSERT zpedido_09 FROM TABLE @lt_pedidos.

    out->write( |Insertados { lines( lt_clientes ) } clientes y { lines( lt_pedidos ) } pedidos.| ).

"### 1️ "El cliente que cambia de ciudad"
"Recupera con SELECT SINGLE el registro completo del cliente 000555 de /DMO/CUSTOMER. Muéstralo con out->write(). Después, modifica su campo city a 'SEVILLA' usando UPDATE ... SET. Vuelve a hacer el SELECT SINGLE y comprueba que el cambio se ha aplicado.

*Pasos:* 1) SELECT SINGLE + write · 2) UPDATE con SET · 3) comprobar sy-subrc · 4) SELECT SINGLE otra vez para verificar.

*    DATA lv_id_cliente TYPE zcliente_00-cliente_id.
*    lv_id_cliente = '0001'.
*
*    " Recupero los datos
*    SELECT SINGLE FROM zcliente_00
*        FIELDS *
*        WHERE cliente_id = @lv_id_cliente
*        INTO @DATA(ls_cliente_1).
*    IF sy-subrc = 0. " En caso de acierto
*      out->write( ls_cliente_1 ).
*    ELSE.            " En caso de error
*      out->write( |El cliente { lv_id_cliente } no existe| ).
*    ENDIF.
*
*    " Cambiamos la ciudad a Huelva si no es la que ya tiene
*    IF ls_cliente_1-ciudad <> 'Huelva'.
*      UPDATE zcliente_00 SET ciudad = 'Huelva'
*        WHERE cliente_id = @lv_id_cliente.
*      IF sy-subrc = 0. " En caso de acierto
*        out->write( |La ciudad del cliente { ls_cliente_1-nombre } se ha actualizado a Huelva| ).
*
*        " Recuperamos tras la actualación machando los datos de la estructura
*        SELECT SINGLE FROM zcliente_00
*            FIELDS *
*            WHERE cliente_id = @lv_id_cliente
*            INTO @ls_cliente_1.
*        IF sy-subrc = 0.
*          out->write( ls_cliente_1 ).
*        ELSE.
*          out->write( |El cliente { lv_id_cliente } no existe| ).
*        ENDIF.
*
*      ELSE. " En caso de fallo al actualizar
*        out->write( |La ciudad del cliente { ls_cliente_1-nombre } no se ha actualizado| ).
*
*      ENDIF.
*
*    ELSE.
*      out->write( |La ciudad del cliente { ls_cliente_1-nombre } es { ls_cliente_1-ciudad }, no se tiene que actualizar| ).
*    ENDIF.

"--------------------------------------------------------------------

"### 2️ "Pedido nuevo para un cliente existente"
"Elige un cliente_id que ya exista en ZCLIENTE_XX (compruébalo con Data Preview).
"Inserta una fila nueva en ZPEDIDO_XX con INSERT,
"usando ese cliente_id, un pedido_id que no exista todavía ('0016'),
"y datos inventados de producto e importe.

"Después haz un JOIN ZPEDIDO_XX + ZCLIENTE_XX filtrando por ese pedido_id para comprobar
"  que aparece con el nombre del cliente correcto.

*Pasos:* 1) verificar cliente_id con Data Preview ·
"2) INSERT con VALUES ·
*3) comprobar sy-subrc ·
*4) SELECT con JOIN para verificar.

**    DATA ls_pedido_2 TYPE zpedido_00.
**    ls_pedido_2-cliente_id = '0002'.
**    ls_pedido_2-pedido_id = '0016'.
**    ls_pedido_2-producto = 'Cargador'.
**    ls_pedido_2-importe = '30.00'.
**    ls_pedido_2-fecha = '20260720'.
**
**    INSERT zpedido_00 FROM @ls_pedido_2.
**    IF sy-subrc = 0.
**      out->write( |Pedido añadido| ).
**
**      SELECT FROM zpedido_00 AS p
**        INNER JOIN zcliente_00 AS c
**            ON c~cliente_id = p~cliente_id
**            FIELDS p~pedido_id, p~producto, c~nombre
**            INTO TABLE @DATA(lt_ped_cli_2).
**      IF sy-subrc = 0.
**        out->write( lt_ped_cli_2 ).
**      ELSE.
**        out->write( |Fallo en el JOIN| ).
**      ENDIF.
**
**
**    ELSE.
**      out->write( |NO se ha añadido el pedido| ).
**    ENDIF.

"--------------------------------------------------------------------

*### 3️⃣ "El pedido que ya no existe"

*Elige un pedido_id de ZPEDIDO_XX cualquiera (por ejemplo '0015').
" Bórralo con DELETE.
" Después, intenta hacer el mismo JOIN de ZPEDIDO_XX + ZCLIENTE_XX que hicisteis antes
"  y comprueba que ese pedido ya no aparece en el resultado,
"  aunque el cliente al que pertenecía sigue existiendo en ZCLIENTE_XX.

*Pasos:*
"1) SELECT SINGLE antes de borrar
"2) DELETE ·
"3) comprobar sy-subrc ·
"4) JOIN para comprobar que el pedido desapareció pero el cliente sigue ahí.


***    DATA lv_pedido_3 TYPE zpedido_00-pedido_id.
***    lv_pedido_3 = '0015'.
***    DELETE FROM zpedido_00
***        WHERE pedido_id = @lv_pedido_3.
***    IF sy-subrc = 0.
***      out->write( |Se ha borrado el pedido { lv_pedido_3 } | ).
***    ELSE.
***      out->write( |Ha fallado el borrado| ).
***    ENDIF.
***
***    SELECT FROM zpedido_00 AS p
***        INNER JOIN zcliente_00 AS c
***            ON c~cliente_id = p~cliente_id
***            FIELDS p~pedido_id, p~producto, c~nombre
***            INTO TABLE @DATA(lt_ped_cli_3).
***    IF sy-subrc = 0.
***      out->write( lt_ped_cli_3 ).
***    ELSE.
***      out->write( |Fallo en el JOIN| ).
***    ENDIF.

"--------------------------------------------------------------------
*### 4️⃣ "Sube el importe a un cliente concreto"

*Usando UPDATE ... WHERE,
" sube un 10% el importe de todos los pedidos del cliente '0001'.

"Antes y después, haz un SELECT con SUM( importe )
" filtrado por ese cliente_id para comprobar visualmente que el total ha subido.

*Pasos:*
"1) SELECT con SUM antes ·
"2) UPDATE con cálculo importe = importe * '1.1' ·
"3) SELECT con SUM después ·
"4) comparar.

***    lv_id_cliente = '0001'.
***    SELECT FROM zpedido_00
***        FIELDS SUM( importe )
***        WHERE cliente_id = @lv_id_cliente
***        INTO @DATA(lv_importe_4).
***    IF sy-subrc = 0.
***      out->write( |El importe inicial es { lv_importe_4 }€| ).
***    ELSE.
***      out->write( |El cliente { lv_id_cliente } no existe| ).
***    ENDIF.
***
***    " Solución PRO de Ramón
****    DATA lv_mult TYPE p DECIMALS 4.
****    lv_mult = 1 / '1.10'.
****
****    UPDATE zpedido_00
****        SET importe = division( importe, @lv_mult, 2 )
****        WHERE cliente_id = '0001'.

****    " Estilo chapucero de LCa
****    SELECT FROM zpedido_00
****        FIELDS *
****        WHERE cliente_id = @lv_id_cliente
****        INTO TABLE @DATA(lt_pedido_4).
****    IF sy-subrc = 0.
****      LOOP AT lt_pedido_4 ASSIGNING FIELD-SYMBOL(<fs_pedido>).
****        <fs_pedido>-importe = <fs_pedido>-importe * '1.1'.
****      ENDLOOP.
****
****      UPDATE zpedido_00 FROM TABLE @lt_pedido_4.
****      IF sy-subrc = 0.
****        out->write( |Se han actalizado los importes del cliente { lv_id_cliente } | ).
****      ELSE.
****        out->write( |No se han podido actualizar los importes del cliente { lv_id_cliente } | ).
****      ENDIF.
****    ENDIF.
****
****    SELECT FROM zpedido_00
****        FIELDS SUM( importe )
****        WHERE cliente_id = @lv_id_cliente
****        INTO @lv_importe_4.
****    IF sy-subrc = 0.
****      out->write( |El importe final es { lv_importe_4 }€| ).
****    ELSE.
****      out->write( |El cliente { lv_id_cliente } no existe| ).
****    ENDIF..

"--------------------------------------------------------------------
*### 5️⃣ "El cliente fantasma"

*Intenta insertar un pedido en ZPEDIDO_XX con un cliente_id que
"  *no exista* en ZCLIENTE_XX (por ejemplo '9999').

" Comprueba con un SELECT SINGLE sobre ZCLIENTE_XX que ese código no existe,
"  y razona (sin necesidad de código extra) qué pasaría luego
"   con un JOIN ZPEDIDO_XX + ZCLIENTE_XX con esa fila —
"    ¿en qué tipo de JOIN desaparecería y en cuál se quedaría con huecos vacíos?


*****
    DATA ls_pedido_5 TYPE zpedido_00.
    ls_pedido_5-cliente_id = '9999'.
    ls_pedido_5-pedido_id = '0018'.
    ls_pedido_5-producto = 'Router'.
    ls_pedido_5-importe = '40.00'.
    ls_pedido_5-fecha = '20260720'.

    INSERT zpedido_00 FROM @ls_pedido_5.
    IF sy-subrc = 0.
      out->write( |Pedido añadido| ).

      " Comprobación con INNER JOIN
      SELECT FROM zpedido_00 AS p
        INNER JOIN zcliente_00 AS c
            ON c~cliente_id = p~cliente_id
            FIELDS p~pedido_id, p~producto, c~nombre
            INTO TABLE @DATA(lt_ped_cli_5I).
      IF sy-subrc = 0.
        out->write( |---> INNER JOIN <---| ).
        out->write( lt_ped_cli_5I ).
      ELSE.
        out->write( |Fallo en el JOIN| ).
      ENDIF.

      " Comprobación con LEFT JOIN
      SELECT FROM zpedido_00 AS p
        LEFT JOIN zcliente_00 AS c
            ON c~cliente_id = p~cliente_id
            FIELDS p~pedido_id, p~producto, c~nombre
            INTO TABLE @DATA(lt_ped_cli_5L).
      IF sy-subrc = 0.
        out->write( |---> LEFT JOIN 1 <---| ).
        out->write( lt_ped_cli_5L ).
      ELSE.
        out->write( |Fallo en el LEFT JOIN| ).
      ENDIF.

      " Comprobación con LEFT JOIN
      SELECT FROM zcliente_00 AS c
        LEFT JOIN zpedido_00 AS p
            ON c~cliente_id = p~cliente_id
            FIELDS p~pedido_id, p~producto, c~nombre
            INTO TABLE @lt_ped_cli_5L.
      IF sy-subrc = 0.
        out->write( |---> LEFT JOIN 2 <---| ).
        out->write( lt_ped_cli_5L ).
      ELSE.
        out->write( |Fallo en el LEFT JOIN| ).
      ENDIF.

    ELSE.
      out->write( |NO se ha añadido el pedido| ).
    ENDIF.


"--------------------------------------------------------------------

"El pedido existe pero el cliente no.
"inner join el pedido desaparece porque intenta unir dos coincidencias y no exite una de ellas.
"--------------------------------------------------------------------
" 6️.- "El cliente que más ha gastado"
"Averigua qué cliente ha gastado más dinero en total sumando el importe de todos sus pedidos
" en ZPEDIDO_XX, y muestra su nombre completo (no solo el cliente_id).

*Pasos:*
"1) SELECT SUM ·
"2) JOIN con MAX ·
"3) SELECT SINGLE para el nombre completo.

*  " DATA lt_total type table of zpedido_09.
*    DATA lv_max TYPE zpedido_09-importe.
*    DATA lv_cliente TYPE zpedido_09-cliente_id.
*    DATA ls_cliente TYPE zcliente_09.
*
*    "Sumar el importe por cliente
*       select from zpedido_09
*       fields cliente_id,
*       Sum( importe ) as total " As hay que añadirlo para que sepa donde esta el campo total
*       group by cliente_id
*       into table @data(lt_suma).
*
*    "buscar el mayor total con loop at
*       LOOP AT lt_suma into data(ls_suma).
*
*        if ls_suma-total > lv_max.
*            lv_max = ls_suma-total.
*            lv_cliente = ls_suma-cliente_id.
*        endif.
*
*       ENDLOOP.
*
*    "mostrar el nombre completo del cliente con el mayor total
*       SELECT SINGLE from zcliente_09
*       fields *
*       where cliente_id = @lv_cliente
*       into @ls_cliente.
*
*
*    out->write( ls_cliente ).
*    out->write( |Total gastado: { lv_max }| ).

"   segun como lo ha echo el profesor

    " Recuperando los datos y recorriendo
*    DATA lt_pedido_aux TYPE TABLE OF zpedido_00.
*    SELECT FROM zpedido_00
*        FIELDS *
*        INTO TABLE @DATA(lt_pedido_6).
*
*    LOOP AT lt_pedido_6 INTO DATA(ls_pedido_6).
*      READ TABLE lt_pedido_aux ASSIGNING FIELD-SYMBOL(<fs_pedido_6>)
*          WITH KEY cliente_id = ls_pedido_6.
*      IF sy-subrc = 0. " El cliente existe en la auxiliar
*        <fs_pedido_6>-importe = <fs_pedido_6>-importe + ls_pedido_6-importe.
*      ELSE. " El cliente NO existe en la auxiliar
*        APPEND ls_pedido_6 TO lt_pedido_aux.
*      ENDIF.
*    ENDLOOP.
*
*    SORT lt_pedido_aux BY importe DESCENDING.
*    CLEAR ls_pedido_6.
*    READ TABLE lt_pedido_aux INTO ls_pedido_6 INDEX 1.
*    IF sy-subrc EQ 0.
*      SELECT SINGLE FROM zcliente_00
*          FIELDS nombre
*          WHERE cliente_id = @ls_pedido_6-cliente_id
*          INTO @DATA(lv_nombre_6).
*      IF sy-subrc = 0.
*        out->write( lv_nombre_6 ).
*      ENDIF.
*    ENDIF.

*    " Todo en el SELECT
*    SELECT FROM zpedido_00 AS p
*        INNER JOIN zcliente_00 AS c
*        ON p~cliente_id = c~cliente_id
*        FIELDS c~nombre, SUM( p~importe ) AS suma
*        GROUP BY c~nombre
*        ORDER BY suma DESCENDING
*        INTO TABLE @DATA(lt_join_6).
*    IF sy-subrc = 0.
*      CLEAR ls_pedido_6.
*      READ TABLE lt_join_6 INTO DATA(ls_join_6) INDEX 1.
*      IF sy-subrc = 0.
*        out->write( ls_join_6 ).
*      ELSE.
*        out->write( 'Fallo en el READ' ).
*      ENDIF.
*    ELSE.
*      out->write( 'Fallo en el JOIN' ).
*    ENDIF.
" Ahora con la CDS

    SELECT FROM zcds_ejercicio_6
        FIELDS *
        ORDER BY suma DESCENDING
        INTO TABLE @DATA(lt_cds_6).
    IF sy-subrc = 0.

      READ TABLE lt_cds_6 INTO DATA(ls_cds_6) INDEX 1.
      IF sy-subrc = 0.
        out->write( ls_cds_6-nombre ).
      ELSE.
        out->write( 'Fallo en el READ' ).
      ENDIF.
    ELSE.
      out->write( 'Fallo en el JOIN' ).
    ENDIF.



"--------------------------------------------------------------------

"### 7️ "Cambia de ciudad a todos los clientes de Huelva"

"Actualiza el campo ciudad de todos los clientes que vivan actualmente en 'Huelva' para que pasen a 'Sevilla'.

"Después, comprueba con una consulta que combine ZCLIENTE_XX + ZPEDIDO_XX que esos clientes siguen teniendo
"  todos sus pedidos intactos (que el UPDATE no ha tocado nada que no debía).

*    SELECT FROM zcliente_09
*    fields *
*    where ciudad = 'Huelva'
*    INTO TABLE @lt_pedidos.
*
*    LOOP AT lt_pedidos into ls_pedido.
*        ls_pedido-ciudad = 'Sevilla'.
*        UPDATE zcliente_09 from @ls_pedido.
*    ENDLOOP.

"--------------------------------------------------------------------
"### 8️ "El producto más pedido"
"Sin darte más pistas: dinos cuál es el producto que más veces aparece en ZPEDIDO_XX, y cuántas veces se ha pedido.



"--------------------------------------------------------------------
"### 9️ "Borra un pedido y comprueba el rastro"
"Elige un pedido_id de ZPEDIDO_XX,
"  bórralo,
"y luego construye una consulta que demuestre que el cliente al que pertenecía ese pedido
"  sigue existiendo en ZCLIENTE_XX,
"  aunque ese pedido concreto ya no esté.

"Piensa bien qué tablas necesitas relacionar y con qué claves.




"--------------------------------------------------------------------
"### 🔟 "El resumen completo de un cliente"
"Elige un cliente cualquiera y construye,
"tú solo, la consulta que junte:
"nombre del cliente,
"ciudad,
" todos sus pedidos (producto, importe, fecha),
"  y el total gastado. Tienes que decidir si necesitas uno
"   o varios pasos, y con qué claves relacionar las tablas.



"--------------------------------------------------------------------
  ENDMETHOD.
ENDCLASS.
