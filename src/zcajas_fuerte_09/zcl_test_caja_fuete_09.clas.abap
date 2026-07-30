CLASS zcl_test_caja_fuete_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_caja_fuete_09 IMPLEMENTATION.



  METHOD if_oo_adt_classrun~main.

      DATA(lo_caja) = NEW zcl_caja_fuerte_00( i_codigo = '9876' ).

    out->write( 'Creamos la caja' ).
    IF lo_caja->esta_bloqueada( ) = abap_true.
      out->write( 'La caja está bloqueada' ).
    ELSE.
      out->write( 'La caja NO está bloqueada' ).
    ENDIF.

    out->write( 'Primer intento' ).
    IF lo_caja->abrir( i_codigo = '1' ) = abap_true.
      out->write( 'La caja está abierta' ).
    ELSE.
      out->write( 'La caja está cerrada' ).
    ENDIF.

    IF lo_caja->esta_bloqueada( ) = abap_true.
      out->write( 'La caja está bloqueada' ).
    ELSE.
      out->write( 'La caja NO está bloqueada' ).
    ENDIF.

    out->write( 'Segundo intento' ).
    IF lo_caja->abrir( i_codigo = '2' ) = abap_true.
      out->write( 'La caja está abierta' ).
    ELSE.
      out->write( 'La caja está cerrada' ).
    ENDIF.

    IF lo_caja->esta_bloqueada( ) = abap_true.
      out->write( 'La caja está bloqueada' ).
    ELSE.
      out->write( 'La caja NO está bloqueada' ).
    ENDIF.

    out->write( 'Tercer intento' ).
    IF lo_caja->abrir( i_codigo = '9876' ) = abap_true.
      out->write( 'La caja está abierta' ).
    ELSE.
      out->write( 'La caja está cerrada' ).
    ENDIF.

    IF lo_caja->esta_bloqueada( ) = abap_true.
      out->write( 'La caja está bloqueada' ).
    ELSE.
      out->write( 'La caja NO está bloqueada' ).
    ENDIF.

    out->write( 'Cuarto intento' ).
    IF lo_caja->abrir( i_codigo = '1' ) = abap_true.
      out->write( 'La caja está abierta' ).
    ELSE.
      out->write( 'La caja está cerrada' ).
    ENDIF.

    IF lo_caja->esta_bloqueada( ) = abap_true.
      out->write( 'La caja está bloqueada' ).
    ELSE.
      out->write( 'La caja NO está bloqueada' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
