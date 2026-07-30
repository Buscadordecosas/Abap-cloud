CLASS zcl_test_chiringuito_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_chiringuito_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*Debe, en este orden, mostrando el resultado de cada paso por consola:
*-----------------------------------------------------------------------------------------------------------------
*1. Crear un chiringuito de bebidas.
*-----------------------------------------------------------------------------------------------------------------
    DATA(lo_chringito) = NEW zcl_chiringuito_09( iv_nombre = 'Chiringuito_Camaron' ).
    DATA(lo_chringito_bebidas) = NEW zcl_chiringuitos_bebidas_09( iv_nombre = 'Chiringuito_Camaron' ).
*-----------------------------------------------------------------------------------------------------------------
*2. Intentar vender por 1,00€ (debería rechazarse, por debajo del mínimo).
*-----------------------------------------------------------------------------------------------------------------
    DATA(lv_vender) = lo_chringito_bebidas->vender( iv_importe = 1 ). "vender 1€
    out->write( |Ejercicio 2. ¿Ha sido vendido? { lv_vender } | ).
*-----------------------------------------------------------------------------------------------------------------
*3. Vender por 3,50€ (debería aceptarse).
*-----------------------------------------------------------------------------------------------------------------
    lv_vender = lo_chringito_bebidas->vender( iv_importe = '3.5' ). "vender 3.5€
    out->write( |Ejercicio 3. ¿Ha sido vendido? { lv_vender } | ).
*-----------------------------------------------------------------------------------------------------------------
*4. Consultar y mostrar su recaudación y su comisión (debería salir el 10%, heredado sin cambios).
*-----------------------------------------------------------------------------------------------------------------
    DATA(lv_recaudacion) = lo_chringito_bebidas->consultar_recaudacion(  ).
    out->write( |Ejercicio 4. Recaudacion: { lv_recaudacion } €| ).

    DATA(lv_comision) = lo_chringito_bebidas->calcular_comision_ayuntamiento(  ).
    out->write( |Ejercicio 4. Comision: { lv_comision } €| ).
*-----------------------------------------------------------------------------------------------------------------
*5. Crear una comision alquiler de hamacas.
*-----------------------------------------------------------------------------------------------------------------
    DATA(lo_alquier_hamacas) = NEW zcl_alquiler_hamacas_09( iv_nombre = 'Chiringuito_Camaron' ).
    DATA(lv_comision_hamacas) = lo_alquier_hamacas->calcular_comision_ayuntamiento( ).
    out->write( |Ejercicio 5. Comision de hamacas: { lv_comision_hamacas } €| ).
*-----------------------------------------------------------------------------------------------------------------
*6. Vender (alquilar) por 8,00€
    "       (usando el método heredado sin redefinir, debería aceptarse sin ninguna condición especial de mínimo).
*-----------------------------------------------------------------------------------------------------------------
    DATA(lv_alquilar) = lo_alquier_hamacas->vender( 8 ).
    out->write( |Ejercicio 6. ¿Ha sido alquilado? { lv_alquilar } | ).
*-----------------------------------------------------------------------------------------------------------------
*7. Consultar y mostrar su recaudación y su comisión —
    "       aquí debería verse claramente que sale el *20%*,
    "       distinto al chiringuito de bebidas, a pesar de ser el mismo método heredado del mismo padre.
*-----------------------------------------------------------------------------------------------------------------
    DATA(lv_alquiler_hamacas) = lo_alquier_hamacas->consultar_recaudacion( ).
    out->write( |Ejercicio 7. Recaudacion: { lv_alquiler_hamacas } €| ).

    lv_alquiler_hamacas = lo_alquier_hamacas->calcular_comision_ayuntamiento( ).
    out->write( |Ejercicio 7. Comision: { lo_alquier_hamacas->calcular_comision_ayuntamiento( ) } €| ).

*    lv_comision_hamacas = lo_alquier_hamacas->calcular_comision_ayuntamiento( ).
*    out->write( |Ejercicio 7. Comision: { lv_comision_hamaca } â¬| ).
*### Puntos importantes en los que pensar antes de escribir código

*Diseñad bien la firma del método vender en el padre desde el principio.*
    "       Como una de las hijas necesita que vender devuelva un abap_bool (si se aceptó o no la venta),
    "        y en ABAP REDEFINITION *no permite cambiar la firma del método.





  ENDMETHOD.
ENDCLASS.
