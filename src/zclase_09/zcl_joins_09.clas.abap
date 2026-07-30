CLASS zcl_joins_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_joins_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

**  ## 📋 Ejercicio 1 — Guiado (como el anterior)
**
****"Vuelos con su avión y su aerolínea"**
**
**Con un único `SELECT ... INNER JOIN` entre `/dmo/flight` (alias `f`) y `/dmo/carrier` (alias `c`),
**  muestra: nombre de la aerolínea, connection_id, flight_date, price, currency_code y plane_type_id.
**  Empareja las tablas por `carrier_id`. Guarda el resultado en una tabla interna, comprueba `sy-subrc` y
**  muéstralo con `out->write( )`.
**
***Reto extra:* añade `WHERE f~price > 5000` y `ORDER BY f~price DESCENDING`.
**

***    SELECT FROM /DMO/FLIGHT AS F INNER JOIN /DMO/CARRIER AS C ON F~carrier_id  = C~carrier_id
***        FIELDS  c~name,
***                f~connection_id,
***                f~flight_date,
***                f~price,
***                f~currency_code,
***                plane_type_id WHERE f~price > 5000 ORDER BY f~price DESCENDING into table @data(lt_vuelo).
***
***                if sy-subrc = 0.
***                 out->write( lt_vuelo ).
***                endif.
***

**
**## 📋 Ejercicio 2 — Semi-abierto
**
****"¿Quién reservó cada vuelo?"**
**
**Tienes las tablas `/DMO/BOOKING` y `/DMO/CUSTOMER`. Muestra, para cada reserva, el nombre y apellido del cliente j
*   unto con el `travel_id`, `booking_id` y `booking_date`.
**
**Tú decides: qué alias usar, qué campo es la clave de unión entre ambas tablas
    "(pista: no es `travel_id`), y si necesitas algún `WHERE` para que el resultado tenga sentido.

*        SELECT from /dmo/booking as b inner join /dmo/customer as c on b~customer_id = c~customer_id
*        fields c~first_name,
*               c~last_name,
*               b~travel_id,
*               b~booking_id,
*               b~booking_date into table @DATA(lt_booking).
*
*        if sy-subrc = 0.
*        out->write( lt_booking ).
*        endif.
***
***## 📋 Ejercicio 3 — Abierto
***
*****"El itinerario completo de una reserva"**
***
***Un `BOOKING` no te dice directamente qué avión ni qué aerolínea vuela —
***  solo tiene claves. Usando las tablas que hemos visto hoy (`/DMO/BOOKING`, `/DMO/FLIGHT`, `/DMO/CARRIER`),
**    construye un SELECT con **dos JOIN encadenados** que muestre, para cada reserva: nombre de la aerolínea,
**    connection_id, flight_date, plane_type_id y booking_id.
***
***No te doy los `ON`: tienes que averiguar tú qué campos conectan cada par de tablas mirando sus claves en Data Preview o
**  en la definición de la tabla (pestaña *Foreign Keys*).
***
*        select from /DMO/BOOKING as b INNER join /DMO/FLIGHT as f
*            on b~carrier_id = f~carrier_id
*            and b~connection_id = f~connection_id
*            and b~flight_date = f~flight_date
*        INNER JOIN /DMO/CARRIER as c on f~carrier_id = c~carrier_id
*
*        fields
*            c~name,
*            f~connection_id,
*            f~flight_date,
*            f~plane_type_id,
*            b~booking_id into table @data(lt_reserva_1).
*
*             IF sy-subrc = 0.
*      out->write( |Tiene { lines( lt_reserva_1 ) } lineas | ).
*      out->write( lt_reserva_1 ).
*    ENDIF.


**
****Nota para ti:** en el ejercicio 3, si algún grupo se atasca,
*   la pista mínima que puedes soltar es "¿qué claves necesita FLIGHT para identificarse de forma única?
*   Esas son las que tenéis que buscar en BOOKING".

*   Eso ya les reconecta con el ejercicio manual (LOOP + READ TABLE) que hicisteis antes,
*    y verán que el JOIN encadenado no es más que "lo mismo pero con dos ON en vez de dos READ TABLE".

"Partiendo de ID de reserva y del ID de aerolinea
"Dime que agencia de viaje vendió esa reserva

"Tablas implicadas, /dmo/agency /dmo/booking /dmo/travel

*        select from /dmo/agency as a INNER JOIN /dmo/travel as t
*            on a~agency_id = t~agency_id
*        INNER JOIN /dmo/booking as b
*            on t~travel_id = b~travel_id
*            fields
*            a~name,
*            b~booking_id,
*            b~booking_date
*            WHERE b~customer_id = '000555'
*            and b~connection_id = '0322' into table @data(lt_reserva_2).
*
*             IF sy-subrc = 0.
*      out->write( lt_reserva_2 ).
*     endif.

" me tiene que dar un unico resultado. lo ha dicho poniendo de la misma tabla b~

"📋_Ejercicio_1_—_Dificultad_baja
"¿Quién_gestionó_cada_viaje?
"Muestra,_para_cada_viaje_registrado,
"el_nombre_de_la_agencia_que_lo_gestionó
"junto_con_el travel_id,
"begin_date y overall_status.


*    SELECT from /dmo/travel as t INNER join /dmo/agency as a
*    on t~agency_id = a~agency_id fields
*        a~name,
*        t~travel_id,
*        t~begin_date,
*        t~status into table @DATA(lt_agencia).
*
*        IF sy-subrc = 0.
*          out->write( lt_agencia ).
*        endif.


"📋_Ejercicio_2_—_Dificultad_media
"Ruta_completa_de_cada_vuelo
"Muestra,_para_cada_vuelo,
"el_nombre_y_ciudad_del_aeropuerto_de_origen_y
"el_nombre_y_ciudad_del_aeropuerto_de_destino,
"junto_con_el connection_id,
"flight_date_y price.

*   select from /dmo/flight as f inner join /dmo/connection as c
*        on  f~carrier_id = c~carrier_id
*        and f~connection_id = c~connection_id
*    inner JOIN /dmo/airport as ori              "ori de aeropuerto_de_origen
*        on c~airport_from_id = ori~airport_id
*    inner JOIN /dmo/airport as des              "des de aeropuerto_de_destino
*        on c~airport_to_id = des~airport_id
*     fields
*       ori~name as nombre_origen,
*       ori~city as ciudad_origen,
*       des~name as nombre_destino,
*       des~city as ciudad_destino,
*       f~connection_id,
*       f~flight_date,
*       f~price into table @data(lt_vuelo_2).
*
*       IF sy-subrc = 0.
*            out->write( lt_vuelo_2 ).
*       ENDIF.



"📋_Ejercicio_3_—_Dificultad_alta
"El_extra_que_pidió_cada_cliente
"Muestra,_para_cada_suplemento_reservado_(booking_supplement),
"el_nombre_y_apellido_del_cliente_que_lo_pidió,
"el_nombre_de_la_categoría/tipo_de_suplemento,
"su_precio,
"y_el travel_id_y booking_id_correspondientes.

    select from /dmo/booksuppl_m as bs inner join /dmo/supplement as su
        on bs~supplement_id = su~supplement_id
    inner join /dmo/booking as b
        on bs~booking_id = b~booking_id
    inner join /dmo/customer as c
        on b~customer_id = c~customer_id
    fields
        c~first_name,
        c~last_name,
        bs~supplement_id,
  "     su~name,
        su~price,
        b~travel_id,
        b~booking_id into table @data(lt_cliente).

        IF sy-subrc = 0.
            out->write( lt_cliente ).
        ENDIF.

**
  ENDMETHOD.
ENDCLASS.
