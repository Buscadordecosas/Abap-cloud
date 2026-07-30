CLASS zcl_test_cafetera_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_cafetera_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lo_cafetera) = NEW zcl_cafetera_09( 600 ).
    lo_cafetera->preparar_cafe(  ).
        out->write( |agua restante cuando creo primer la cafetera: { lo_cafetera->consultar_agua( ) } ml | ).
    lo_cafetera->preparar_cafe(  ).
        out->write( |agua restante cuando creo segundo la cafetera: { lo_cafetera->consultar_agua( ) } ml | ).
    lo_cafetera->preparar_cafe(  ).
        out->write( |agua restante cuando creo tercero la cafetera: { lo_cafetera->consultar_agua( ) } ml | ).

  ENDMETHOD.
ENDCLASS.
