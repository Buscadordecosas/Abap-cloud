CLASS zcl_primera_clase_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_primera_clase_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*types: BEGIN OF ty_pedido, " estos la estructura begin of hasta end of y ty_ segigo de ls_(lo que pida).
*        id_pedido type i,
*        importe type p length 5 decimals 2,
*        tipo_cliente type string,
*       END OF ty_pedido.
*                                                    "ls_pedido es y una variable y ty_pedido es un tipo.
*        Data: ls_pedido type ty_pedido.             "ls_(lo que pida) variable por typo ty_.
*        Data: lt_pedidos type TABLE OF ty_pedido.   "lt_(ty_"estructura") tipo tabla of del ty_"tipo"
*        Data: lv_contador type i .              "la variable contador que que incremente y su valor es 1 "por que es una vuelta".
*
*        DO 5 TIMES.
*            lv_contador += 1.
*            ls_pedido-id_pedido = lv_contador.        "ls_pedido es la estructura y cojes "-id_pedido" porque te lo pide es contador.
*            ls_pedido-importe = lv_contador * '120.75'. "importe multiplicar por el número de vuelta () por 120.75.
*
*            DATA(lv_resto) = lv_contador MOD 2. "Declaracion en linea
*
*            CASE lv_resto.                  "el resltado de la vuelta lo divides entre 2 tipo i "da 0 o 1".
*                when 0. " Par
*                    ls_pedido-tipo_cliente = 'PREMIUM'.
*                when 1. " impar
*                    ls_pedido-tipo_cliente = 'ESTANDAR'.
*            endcase.
*
*            APPEND ls_pedido to lt_pedidos.
*        enddo.
*
*        OUT->WRITE( lt_pedidos ).

**## Ejercicio: 3 enunciados con LOOP AT

*1. (Simple)*
*Define con TYPES una estructura ty_producto con los campos nombre (texto)
*  y precio (decimal), y una tabla tt_productos de ese tipo.
*Declara las variables correspondientes con DATA.

* Añade 3 productos a la tabla con APPEND. Usando LOOP AT, recorre la tabla y
*  muestra con out->write( ) el nombre de cada producto.
    types:BEGIN OF ty_producto,
            nombre type string,
            precio type p length 10 decimals 2,
            END OF ty_producto.

            DATA: ls_producto type ty_producto.
            Data: lt_producto type TABLE OF ty_producto.

            ls_producto-nombre = 'Teclado'.
            ls_producto-precio = '49.99'.
             APPEND ls_producto to lt_producto.

            ls_producto-nombre = 'Raton'.
            ls_producto-precio = '29.99'.
             APPEND ls_producto to lt_producto.

            ls_producto-nombre = 'Alfombrilla'.
            ls_producto-precio = '9.99'.
             APPEND ls_producto to lt_producto.

            LOOP AT lt_producto into ls_producto.
            OUT->WRITE( ls_producto-nombre ).
            ENDLOOP.

            "Pinta una linea en blanco en la consola
           "  OUT->WRITE( '' ).




*2. (Intermedio)*
*Define con TYPES una estructura ty_empleado con los campos nombre (texto)
*  y salario (decimal), y una tabla tt_empleados de ese tipo.
*Añade 4 empleados a la tabla con salarios distintos.
*Usando LOOP AT, recorre la tabla y, con un IF dentro del bucle, muestra con out->write( )
* únicamente el nombre de los empleados cuyo salario sea mayor que 2000.

*    TYPES: BEGIN OF ty_empleado,
*        nombre type string,
*        salario type p LENGTH 10 DECIMALS 2,
*        END OF ty_empleado.
*
*        data: ls_empleado type ty_empleado,
*              lt_empleado type table of ty_empleado.
*
*        ls_empleado-nombre = 'Luis'.
*        ls_empleado-salario = '1000.00'.
*        APPEND ls_empleado to lt_empleado.
*
*        ls_empleado-nombre = 'Julio'.
*        ls_empleado-salario = '1500.00'.
*        APPEND ls_empleado to lt_empleado.
*
*        ls_empleado-nombre = 'Antonio'.
*        ls_empleado-salario = '2500.00'.
*        APPEND ls_empleado to lt_empleado.
*
*        ls_empleado-nombre = 'Julian'.
*        ls_empleado-salario = '4500.00'.
*        APPEND ls_empleado to lt_empleado.
*
*        LOOP AT lt_empleado into ls_empleado.
*         if  ls_empleado-salario < 2000.
*            out->write( ls_empleado-nombre ).
*            endif.
*        ENDLOOP.

*3. (Difícil)*
*Define con TYPES una estructura ty_pedido con los campos id_pedido (entero),
*importe (decimal) y estado (texto), y una tabla tt_pedidos de ese tipo.

*Usando un DO 6 TIMES, genera pedidos donde id_pedido sea el número de vuelta,
* importe sea el resultado de multiplicar el número de vuelta por 45.30,
*y estado se calcule con CASE sobre el resto de dividir el número de vuelta entre 3:

*si el resto es 0, 'ENVIADO'; si es 1, 'PENDIENTE';
*si es 2, 'CANCELADO'. Añade cada pedido a la tabla con APPEND.
*Después, usando LOOP AT, recorre toda la tabla y muestra con out->write( ) solo los pedidos cuyo estado sea 'PENDIENTE',
* junto con su importe. Al terminar el bucle,
*muestra también con out->write( ) cuántos pedidos en total quedaron 'PENDIENTE' (usa un contador que incrementes dentro del IF).

*    types:BEGIN OF ty_pedido,
*          id_pedido TYPE i,
*          importe TYPE p LENGTH 10 DECIMALS 2,
*          estado type string,
*          END OF ty_pedido.
*
*          data: ls_pedido type ty_pedido,
*                lt_pedido TYPE TABLE OF ty_pedido.
*
*          DATA lv_resto type i.
*
*          DO 6 times.
*            ls_pedido-id_pedido += 1.
*            ls_pedido-importe = ls_pedido-id_pedido * '45.30'.
*            lv_resto = ls_pedido-id_pedido mod 3.
*
*            case lv_resto.
*            when 0.
*                ls_pedido-estado = 'ENVIADO'.
*            when 1.
*                ls_pedido-estado = 'EPENDIENTE'.
*
*            when 2.
*                ls_pedido-estado = 'CANCELADO'.
*
*                ENDCASE.
*
*                APPEND ls_pedido to lt_pedido.
*
*          ENDDO.
*
*      LOOP AT lt_pedido into ls_pedido.
*        if ls_pedido-estado = 'PENDIENTE'.
*            out->write( | el ID es { ls_pedido-id_pedido } y el importe { ls_pedido-importe }| ).
*        ENDIF.
*      ENDLOOP.


*## Ejercicio: 3 enunciados con READ TABLE

*1. (Fácil)*
*Declara con TYPES/DATA una estructura ty_producto con los campos nombre (texto)
*  y precio (decimal), y su correspondiente tabla lt_producto.

*Añade 4 productos con APPEND.
*Usando READ TABLE, busca el producto que ocupa la *posición 2* de la tabla (INDEX).
* Comprueba sy-subrc y, si lo encuentra, muestra con out->write( )
*y pipes su nombre y precio; si no lo encuentra, muestra un mensaje indicándolo.

*        TYPES:BEGIN OF ty_producto,
*               nombre type  string,
*               precio type length 5 decimals 2,
*               END OF ty_producto.
*
*        DATA: ls_producto type ty_producto,
*              lt_producto type TABLE OF ty_producto.
*
*
*              ls_producto-nombre = 'Teclado'.
*              ls_producto-precio = '29.99'.
*              APPEND ls_producto to lt_producto.
*
*              "repite las instrucciones anteriores  con distintos valores
*              ls_producto-nombre = 'Raton'.
*              ls_producto-precio = '15.99'.
*              APPEND ls_producto to lt_producto.
*
*              ls_producto-nombre = 'Sobre'.
*              ls_producto-precio = '1.99'.
*              APPEND ls_producto to lt_producto.
*
*              ls_producto-nombre = 'Jamon'.
*              ls_producto-precio = '49.99'.
*              APPEND ls_producto to lt_producto.
*
*              READ TABLE lt_producto INTO ls_producto.
*                index   2.
*              if sy-subrc = 0. " Ha ido bien
*                out->write( | { ls_producto-nombre } --> { ls_producto-precio } | ).
*              else.
*                out->write( 'No encontrado el prodcto.' ).
*              ENDIF.

*2. (Intermedio)*
*Declara con TYPES/DATA una estructura ty_empleado con los campos id_empleado (entero),
*nombre (texto) y departamento (texto),
* y su tabla lt_empleado.

*Añade 5 empleados con distintos id_empleado y departamento (por ejemplo 'VENTAS', 'IT', etc.).
* Usando READ TABLE con WITH KEY,
*busca el empleado cuyo id_empleado sea 3.

* Comprueba sy-subrc: si lo encuentra, muestra su nombre y departamento con out->write( );
* si no lo encuentra, muestra un aviso de que no existe ese empleado.

    types: BEGIN OF ty_empleado,
            id_empleado TYPE i,
            nombre type string,
            departamento TYPE string,
           END OF ty_empleado.

    Data: ls_empleado TYPE ty_empleado,
          lt_empleado TYPE table of ty_empleado.

          ls_empleado-id_empleado = 1.
          ls_empleado-nombre = 'CARLOS'.
          ls_empleado-departamento = 'VENTAS'.

          APPEND ls_empleado to lt_empleado. " Control + alt y para abajo para copiar lalinea hacia abajo.

          ls_empleado-id_empleado = 2.
          ls_empleado-nombre = 'JESUS'.
          ls_empleado-departamento = 'JEFATURA'.

          APPEND ls_empleado to lt_empleado.

          ls_empleado-id_empleado = 3.
          ls_empleado-nombre = 'DAVID'.
          ls_empleado-departamento = 'MECANICA'.

          APPEND ls_empleado to lt_empleado.

          ls_empleado-id_empleado = 4.
          ls_empleado-nombre = 'ANTONIO'.
          ls_empleado-departamento = 'RRHH'.

          APPEND ls_empleado to lt_empleado.

          READ TABLE lt_empleado INTO ls_empleado with key id_empleado = 3.

            if sy-subrc = 0.
                out->write( | El empleado { ls_empleado-nombre } trabaja en { ls_empleado-departamento }| ).
            else.
                out->write( 'NO SE ENCONTRO A ESE EMPLEADO' ).
            endif.


*3. (Difícil)*
*Declara con TYPES/DATA una estructura ty_pedido con los campos id_pedido (entero),
* importe (decimal) y estado (texto), y su tabla lt_pedido.

* Usando un DO 6 TIMES, genera pedidos donde id_pedido sea el número de vuelta,
* importe sea el número de vuelta multiplicado por 50.25,
* y estado se calcule con CASE sobre el resto de dividir el número de vuelta entre 2:

* 'ENVIADO' si es par,
*'PENDIENTE' si es impar.

* Añade cada uno con APPEND. Después,
* declara una variable entera lv_id_buscado con el valor 4,
* y usando READ TABLE con WITH KEY,
* busca el pedido cuyo id_pedido coincida con lv_id_buscado
* *y además* cuyo estado sea 'PENDIENTE' (combina ambas condiciones en la misma cláusula WITH KEY).


* Comprueba sy-subrc: si lo encuentra,
* muestra su importe con out->write( );
*si no lo encuentra, muestra un mensaje indicando que no hay ningún pedido pendiente con ese ID.


*
*    types: BEGIN OF ty_pedido,  "|| esto se llama pipes.
*            id_prdido TYPE i,
*            nombre type string,
*            estado TYPE string,
*           END OF ty_pedido.
*
*    Data: ls_pedido TYPE ty_pedido,
*          lt_pedido TYPE table of ty_pedido.
*
*          do 6 times.









  ENDMETHOD.
ENDCLASS.
