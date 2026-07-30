CLASS zcl_test_taller_bicis_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_taller_bicis_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    DATA(lo_taller) = NEW zcl_taller_bicis_00( ).
*    lo_taller->registrar_reparacion( iv_cliente = 'Juan'
*                                     iv_averia = 'Sillín torcido' ).

*    clear: lv_cliente, lv_averia, lv_estado.

*    lo_taller->consultar_reparacion(
*            EXPORTING iv_reparacion = 3
*            IMPORTING ev_cliente = DATA(lv_cliente)
*                      ev_averia  = DATA(lv_averia)
*                      ev_estado  = DATA(lv_estado) ).
*    IF lv_cliente IS INITIAL.
*      out->write( 'No se ha encontrado la reparación' ).
*    ELSE.
*      out->write( |{ lv_cliente } - { lv_averia } - { lv_estado }| ).
*    ENDIF.

*    DATA(lv_reparacion) = lo_taller->cambiar_estado( iv_reparacion = 42
*                                                     iv_estado = '03' ).
*    IF lv_reparacion = abap_true.
*      out->write( 'Se ha modificado el estado' ).
*    ELSE.
*      out->write( 'NO se ha modificado el estado' ).
*    ENDIF.

    DATA(lv_reparacion) = lo_taller->eliminar_reparacion( 1 ).
    IF lv_reparacion = abap_true.
      out->write( 'Se ha borrado la reparación' ).
    ELSE.
      out->write( 'NO se ha borrado la reparación' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
