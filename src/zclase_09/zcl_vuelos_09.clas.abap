CLASS zcl_vuelos_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vuelos_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* ===1.-
*Selecciona todos los campos y todos los registros de la
*tabla /DMO/FLIGHT. Muéstralos por pantalla.

*    DATA: lt_vuelo TYPE TABLE OF /DMO/FLIGht.
**
**    SELECT * from /DMO/FLIGHT  into table @lt_vuelo.

*2️ Selecciona solo los campos CARRIER_ID, CONNECTION_ID y
*PRICE de todos los vuelos.

*    select from /DMO/FLIGHT
*    fields CARRIER_ID,
*            CONNECTION_ID,
*            PRICE into table @data(lt_vuelo).


*3️ Selecciona todos los vuelos de la compañía (CARRIER_ID)
* 'LH'. Muestra CARRIER_ID, CONNECTION_ID, FLIGHT_DATE y PRICE.

*    select  * from  /dmo/flight where CARRIER_ID = 'LH' into TABLE @lt_vuelo.

*4️ Selecciona los vuelos cuyo precio (PRICE) sea superior
*a 5000. Muestra CARRIER_ID, CONNECTION_ID y PRICE.

*    TYPES: BEGIN OF ty_eje7,
*             carrier_id    TYPE /dmo/flight-carrier_id,
*             connection_id TYPE /dmo/flight-connection_id,
*             price         TYPE /dmo/flight-price,
*           END OF ty_eje7.
*
*    DATA lt_eje7 TYPE TABLE OF ty_eje7.

*    SELECT FROM /dmo/flight
*        FIELDS carrier_id, connection_id, price, plane_type_id
*        WHERE price > 5000
*        INTO TABLE @data(lt_eje7).

*5️ Selecciona los vuelos que usen el avión (PLANE_TYPE_ID)
*'A380-800'. Muestra CARRIER_ID, CONNECTION_ID, PLANE_TYPE_ID
*y SEATS_MAX.

*    SELECT FROM /dmo/flight FIELDS carrier_id, connection_id, plane_type_id, seats_max
*    WHERE plane_type_id = 'A380-800' INTO TABLE @DATA(lt_tabla).

*6️ Selecciona los vuelos de la compañía 'AA' cuyo precio
*sea inferior a 1000. Muestra todos los campos.

*    SELECT FROM /dmo/flight FIELDS * WHERE carrier_id = 'AA' AND price < 1000 INTO TABLE @lt_vuelo.
*
*7️ Selecciona los vuelos cuyo número de asientos ocupados
*(SEATS_OCCUPIED) sea superior al 90% de SEATS_MAX (pista:
*puedes comparar SEATS_OCCUPIED > SEATS_MAX * '0.9'). Muestra
*D.

*    SELECT carrier_id, connection_id, seats_max, seats_occupied FROM /dmo/flight
*    WHERE seats_occupied > ( seats_max * division( 9, 10, 1 ) ) INTO TABLE  @lt_vuelo.
*
*    IF sy-subrc EQ 0.
*      out->write( lt_vuelo ).
*    ENDIF.

*
*8️ Selecciona los vuelos cuya moneda (CURRENCY_CODE) sea
*'EUR' o 'USD', ordenados de mayor a menor precio (ORDER BY
*PRICE DESCENDING).

*    SELECT * FROM /dmo/flight
*    WHERE currency_code IN ( 'EUR', 'USD' ) ORDER BY price DESCENDING INTO TABLE @lt_vuelo.
*
*    IF sy-subrc EQ 0.
*      out->write( lt_vuelo ).
*    ENDIF.

*9️ Selecciona los vuelos de las compañías 'SQ', 'UA' o 'LH'
*que vuelen con el avión '767-200', ordenados por CARRIER_ID
*ascendente y luego por PRICE descendente.

*    Select from /dmo/flight fields * where carrier_id in ( 'SQ', 'UA', 'LH' ) and plane_type_id = '767-200'
*    order by CARRIER_ID descending into table @lt_vuelo.

*    SELECT FROM /dmo/flight FIELDS * WHERE carrier_id IN ( 'SQ', 'UA', 'LH' ) AND plane_type_id = '767-200'
*    order by price ascending into table @lt_vuelo.
*🔟 Selecciona los vuelos cuyo precio esté entre 2000 y 6000
*(BETWEEN), que no sean de la compañía 'AA', y que tengan más
*de 200 asientos máximos (SEATS_MAX). Muestra CARRIER_ID,
*CONNECTION_ID, FLIGHT_DATE, PRICE y SEATS_MAX, ordenados por
*PRICE ascendente.

*  SELECT FROM /dmo/flight
*  FIELDS carrier_id, connection_id, flight_date, price, seats_max
*  WHERE price BETWEEN 2000 AND 6000
*    AND carrier_id <> 'AA'
*    AND seats_max > 200
*  ORDER BY price ASCENDING
*  INTO TABLE @DATA(lt_vuelos_filtrados).
*
*IF sy-subrc = 0.
*  out->write( lt_vuelos_filtrados ).
*ELSE.
*  out->write( 'No se encontraron vuelos que cumplan con el criterio.' ).
*ENDIF.

*        out->write( lt_vuelo ).
*    out->write( '----------------------------------------------------------------------------------------------------------------' ).
*--------------------------------------------------------------------------------------------*
*    " A partir de las claves de una reserva hay que obtener el tipo avión
*
*    " Recupero los datos de la reserva con los valores de prueba
*    SELECT SINGLE FROM /dmo/booking
*    FIELDS carrier_id, connection_id, flight_date
*    WHERE travel_id = '0000'
*        AND booking_id = '0002'
*    INTO @DATA(ls_reserva).
*    IF sy-subrc = 0.
**      out->write( ls_reserva ).
*
*      " Recupero los valores del vuelo con los datos de la reserva
*      "         obtenido anteriormente
*      SELECT SINGLE FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = @ls_reserva-carrier_id
*          AND connection_id = @ls_reserva-connection_id
*          AND flight_date = @ls_reserva-flight_date
*      INTO @DATA(ls_vuelo).
*      IF sy-subrc = 0.
*        out->write( |El avión es { ls_vuelo-plane_type_id }| ).
*      ELSE.
*        out->write( 'Vuelo no encontrada' ).
*      ENDIF.
*
*    ELSE.
*      out->write( 'Reserva no encontrada' ).
*    ENDIF.
*-----------------------------------------------------------------*
*    " Dado el nombre de una compañia dame todos sus vuelos
*    SELECT SINGLE FROM /dmo/carrier
*        FIELDS carrier_id
*        WHERE name = 'LCa Airlines Limited'
*        INTO @DATA(lv_carrier).
*
*    IF sy-subrc = 0.
*
*      " He recuperado el ID de la compañia
*      SELECT FROM /dmo/flight
*      FIELDS *
*      WHERE carrier_id = @lv_carrier
*      INTO TABLE @DATA(lt_vuelos).
*      IF sy-subrc = 0.
*        out->write( lt_vuelos ).
*      ELSE.
*        out->write( |No hay vuelos para la compañia { lv_carrier }| ).
*      ENDIF.
*
*    ELSE.
*      out->write( 'La compañia no existe' ).
*    ENDIF.
*--------------------------------------------------------------------------------*
**    SELECT SINGLE FROM /dmo/travel_m fields agency_id where travel_id = '00000005' into @data(lv_agency).
**
**    IF sy-subrc = 0.
**
**    select single from /dmo/agency fields name where agency_id = @lv_agency into @DATA(lv_name).
**
**    out->write( lv_name ).
**    ELSE.
**      out->write( |No hay vuelos de esta agencia { lv_name }| ).
**    ENDIF.

        "ejemplo de ejercicio:

****    " Quiero una tabla con los campos:
****    "   Nombre de Compañia | ID Conexion | Fecha de Vuelo | Precio | Moneda
****
****    " Definir mi tabla de salida
****    TYPES: BEGIN OF ty_salida,
****             name          TYPE /dmo/carrier-name,
****             connection_id TYPE /dmo/flight-connection_id,
****             flight_date   TYPE /dmo/flight-flight_date,
****             price         TYPE /dmo/flight-price,
****             currency_code TYPE /dmo/flight-currency_code,
****           END OF ty_salida.
****
****    DATA ls_salida TYPE ty_salida.
****    DATA lt_salida TYPE TABLE OF ty_salida.
****
****    " Recuperar los datos de la BD
****    SELECT FROM /dmo/flight
****        FIELDS  carrier_id,
****                connection_id,
****                flight_date,
****                price,
****                currency_code
****        INTO TABLE @DATA(lt_flight).
****
****    SELECT FROM /dmo/carrier
****        FIELDS carrier_id, name
****        INTO TABLE @DATA(lt_carrier).
****
        " Recorrer_las_tablas y a_montar_mi tabla_de_salida
****    LOOP AT lt_flight INTO DATA(ls_flight).
****
****      READ TABLE lt_carrier INTO DATA(ls_carrier)
****          WITH KEY carrier_id = ls_flight-carrier_id.
****      IF sy-subrc = 0.
****        ls_salida-name = ls_carrier-name.
****        ls_salida-connection_id = ls_flight-connection_id.
****        ls_salida-flight_date = ls_flight-flight_date.
****        ls_salida-price = ls_flight-price.
****        ls_salida-currency_code = ls_flight-currency_code.
****        APPEND ls_salida TO lt_salida.
****
****      ENDIF.
****
****    ENDLOOP.
****
****    out->write( lt_salida ).

"1.-Define un tipo de salida `ty_salida` con estos campos:
    "first_name de /dmo/customer-first_name
    "last_name de /dmo/customer-last_name
    "travel_id de /dmo/travel-travel_id
    "begin_date de /dmo/travel-begin_date
    "total_price de /dmo/travel-total_price
    "currency_code de /dmo/travel-currency_code


    types: BEGIN OF ty_salida,
            first_name type /dmo/customer-first_name,
            last_name TYPE /dmo/customer-last_name,
            travel_id TYPE /dmo/travel-travel_id,
            begin_date TYPE /dmo/travel-begin_date,
            total_price TYPE /dmo/travel-total_price,
            currency_code TYPE /dmo/travel-currency_code,
            END OF ty_salida.

     DATA ls_salida type ty_salida.
     DATA lt_salida TYPE TABLE of ty_salida.

"2.-Recupera **todos** los viajes de `/DMO/TRAVEL` (campos: `customer_id`, `travel_id`,
"     `begin_date`, `total_price`, `currency_code`) en una tabla interna `lt_travel`.

    select from /DMO/TRAVEL
        FIELDS customer_id,
               travel_id,
               begin_date,
               total_price,
               currency_code into table @data(lt_travel).

 "3.-Recupera **todos** los clientes de `/DMO/CUSTOMER` (campos: `customer_id`, `first_name`, `last_name`)
 "     en una tabla interna `lt_customer`.

     select from /DMO/CUSTOMER
        FIELDS customer_id,
               first_name,
               last_name into table @data(lt_customer).


 "4.-Recorre lt_travel con un LOOP, y por cada viaje busca (READ TABLE ... WITH KEY) el cliente correspondiente en lt_customer usando customer_id.

      LOOP AT lt_travel into  data(ls_travel).

****      READ TABLE lt_carrier INTO DATA(ls_carrier) WITH KEY carrier_id = ls_flight-carrier_id.

          Read table lt_customer into data(ls_customer) WITH KEY customer_id = ls_travel-customer_id.

" 5.-Si lo encuentra (sy-subrc = 0), monta la fila de salida y añádela a la tabla final con APPEND.

          if sy-subrc = 0.
            ls_salida-first_name = ls_customer-first_name.
            ls_salida-last_name = ls_customer-last_name.
            ls_salida-travel_id = ls_travel-travel_id.
            ls_salida-begin_date = ls_travel-begin_date.
            ls_salida-total_price = ls_travel-total_price.
            ls_salida-currency_code = ls_travel-currency_code.

            APPEND  ls_salida to lt_salida.

          ENDIF.

       ENDLOOP.

 " 6.-Muestra el resultado con out->write( ).

                out->write( lt_salida ).


  ENDMETHOD.
ENDCLASS.
