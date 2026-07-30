CLASS zcl_test_deposito_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_deposito_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    data(lo_deposito) = NEW zcl_deposito_09( iv_capacidad = 1000 ).
*    data lv_ok TYPE abap_bool.
*        lo_deposito->respotar_deposito( 700 ).
*        out->write( |Nivel: { lo_deposito->consultar_nivel( ) } | ).
*
*        lo_deposito->respotar_deposito( 500 ).
*        out->write( |Nivel tras respostar: { lo_deposito->consultar_nivel( ) } | ).
*
*        lo_deposito->despachar_combustible( 200 ).
*        out->write( |Despachar combustible: { lv_ok } | ).
*
*        out->write( |Nivel final: { lo_deposito->consultar_nivel( ) } | ).

    DATA(lo_deposito) = NEW zcl_deposito_00( 1000 ).
    out->write( | Creo un deposito de { lo_deposito->consultar_nivel(  ) } L| ).

    lo_deposito->repostar_deposito( 700 ).
    out->write( | Tras repostar 700 tengo { lo_deposito->consultar_nivel(  ) } L| ).

    lo_deposito->repostar_deposito( 500 ).
    out->write( | Tras repostar 500 tengo { lo_deposito->consultar_nivel(  ) } L| ).

    IF lo_deposito->despachar_combustible( 500 ).
      out->write( | Se han consumido 500. Ahora tengo { lo_deposito->consultar_nivel(  ) } L| ).
    ELSE.
      out->write( | NO se han consumido 500. Ahora tengo { lo_deposito->consultar_nivel(  ) } L| ).
    ENDIF.

    IF lo_deposito->despachar_combustible( 5000 ).
      out->write( | Se han consumido 5000. Ahora tengo { lo_deposito->consultar_nivel(  ) } L| ).
    ELSE.
      out->write( | NO se han consumido 5000. Ahora tengo { lo_deposito->consultar_nivel(  ) } L| ).
    ENDIF.



  ENDMETHOD.
ENDCLASS.
