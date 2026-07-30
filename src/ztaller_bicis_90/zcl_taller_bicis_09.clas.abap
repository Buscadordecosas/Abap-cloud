CLASS zcl_taller_bicis_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .



  PUBLIC SECTION.

    METHODS:
      registrar_reparacion IMPORTING iv_cliente              TYPE ztabla_taller_09-client  " O el tipo de dato de tu tabla
                                     iv_averia               TYPE ztabla_taller_09-averia
                           RETURNING VALUE(rv_id_reparacion) TYPE ztabla_taller_09-id_reparacion,        " O el tipo de dato de tu ID
      consultar_reparacion IMPORTING iv_id_reparacion     TYPE ztabla_taller_09-id_reparacion
                           EXPORTING ev_cliente           TYPE ztabla_taller_09-client
                                     ev_averia            TYPE ztabla_taller_09-averia
                                     ev_estado_reparacion TYPE ztabla_taller_09-estado,
      cambiar_estado      IMPORTING iv_id_reparacion       TYPE ztabla_taller_09-id_reparacion
                                    iv_nuevo_estado        TYPE ztabla_taller_09-estado
                          RETURNING VALUE(rv_exito_estado) TYPE abap_boolean,
      eliminar_repacion   IMPORTING iv_id_reparacion         TYPE ztabla_taller_09-id_reparacion
                          RETURNING VALUE(rv_exito_eliminar) TYPE abap_boolean.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_taller_bicis_09 IMPLEMENTATION.


  METHOD registrar_reparacion.
    " ----------------------------------------------------
    " 1. REGISTRAR REPARACION (INSERT)
    " ----------------------------------------------------

    " Busca el ID maximo en tu tabla ztabla_taller_09
    SELECT MAX( id_reparacion )
    FROM ztabla_taller_09
    INTO @DATA(lv_max_id).

    IF sy-subrc = 0.
      rv_id_reparacion = lv_max_id + 1.
    ELSE.
      rv_id_reparacion = 1.
    ENDIF.

    DATA(ls_reparacion) = VALUE ztabla_taller_09( id_reparacion = rv_id_reparacion
                                                  cliente       = iv_cliente
                                                  averia        = iv_averia
                                                  estado        = '01' ).

    INSERT ztabla_taller_09 FROM @ls_reparacion.



  ENDMETHOD.

  METHOD consultar_reparacion.
    " ----------------------------------------------------
    " 2. CONSULTAR REPARACION (READ)
    " ----------------------------------------------------

    " Consulta sobre tu tabla ztabla_taller_09
    SELECT SINGLE FROM ztabla_taller_09
    FIELDS
        cliente,
        averia,
        estado
    WHERE id_reparacion = @iv_id_reparacion
    INTO @DATA(ls_reparacion).

    IF sy-subrc = 0.
      ev_cliente           = ls_reparacion-cliente.
      ev_averia            = ls_reparacion-averia.
      ev_estado_reparacion = ls_reparacion-estado.
    ENDIF.


  ENDMETHOD.

  METHOD cambiar_estado.
    UPDATE ztabla_taller_09 SET estado = @iv_nuevo_estado
    WHERE id_reparacion = @iv_id_reparacion.

    IF sy-subrc = 0.
      rv_exito_estado = abap_true.
    ELSE.
      rv_exito_estado = abap_false.
    ENDIF.

  ENDMETHOD.

  METHOD eliminar_repacion.
    DELETE from ztabla_taller_09 where id_reparacion = @iv_id_reparacion.
    IF sy-subrc = 0.
      rv_exito_eliminar = abap_true.
    ELSE.
      rv_exito_eliminar = abap_false.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
