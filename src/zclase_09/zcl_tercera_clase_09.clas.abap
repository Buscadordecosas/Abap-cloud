CLASS zcl_tercera_clase_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tercera_clase_09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*--------------------------------------------------------------------
*_1._(Simple)_—_La_tienda_de_videojuegos
*--------------------------------------------------------------------
*_Declara_con_TYPES/DATA_una_estructura_ty_videojuego_con_los_campos:
*   titulo_(texto)
*   precio_(decimal)
*_y_su_tabla_lt_videojuego.
*--------------------------------------------------------------------

Types: BEGIN OF ty_videojuego,
        titulo type string,
        precio type p LENGTH 5 DECIMALS 2,
       END OF ty_videojuego.

    DATA: ls_videojuego TYPE ty_videojuego,
          lt_videojuego TYPE TABLE of ty_videojuego.

*Añade_4_videojuegos_con_APPEND.
*--------------------------------------------------------------------

    ls_videojuego-titulo = 'Rocket league'.
    ls_videojuego-precio = 10.
    APPEND ls_videojuego to lt_videojuego.


    ls_videojuego-titulo = 'FIFA 2019'.
    ls_videojuego-precio = 50.
    APPEND ls_videojuego to lt_videojuego.

    ls_videojuego-titulo = 'CSGO'.
    ls_videojuego-precio = 15.
    APPEND ls_videojuego to lt_videojuego.

    ls_videojuego-titulo = 'ARK'.
    ls_videojuego-precio = 60.
    APPEND ls_videojuego to lt_videojuego.

*--------------------------------------------------------------------
*_Usando_LOOP_AT_..._ASSIGNING:
*_ _Recorre_la_tabla_y_aplica_una_rebaja_del_20%_al_precio "20% de descuento de 100% es el 80% a pagar que es (0.80).
*_ _directamente_sobre_la_fila_original_(sin_usar_INTO).
*--------------------------------------------------------------------

    LOOP AT lt_videojuego ASSIGNING FIELD-SYMBOL(<fs_videojuego>). " FIELD-SYMBOL(<fs_videojuego>) es como un DATA(). solo un nombre
        <fs_videojuego>-precio = <fs_videojuego>-precio * '0.80'.  " <fs_videojuego>-precio le añades el -precio para que entienda el type demimals
    ENDLOOP.

*--------------------------------------------------------------------
*_Al_terminar,_usando_un_segundo_LOOP_AT_(con_INTO_o_inline):
*_ _Muestra_con_out->write( )_y_pipes_el_título_y_el_nuevo_precio.
*--------------------------------------------------------------------
    LOOP AT lt_videojuego into ls_videojuego.
        out->write( |Aplicado el 20% al { ls_videojuego-titulo }, el precio final es _{ ls_videojuego-precio }_. | ).
    ENDLOOP.

*--------------------------------------------------------------------
*_2._(Intermedio)_—_El_equipo_de_una_expedición
*--------------------------------------------------------------------
*_Declara_con_TYPES/DATA_una_estructura_ty_expedicionario_con_los_campos:
*_ _nombre_(texto)
*_ _oxigeno_restante_(entero)
*_ _estado_(texto)
*_y_su_tabla_lt_expedicion.
*--------------------------------------------------------------------
Types: BEGIN OF ty_expedicionario,
        nombre type string,
        oxigeno_restante type i,
        Estado type string,
       END OF ty_expedicionario.

    DATA: ls_expedicionario TYPE ty_expedicionario,
          lt_expedicionario TYPE TABLE of ty_expedicionario.

*_Añade_5_miembros_con_distintos_valores_de_oxigeno_restante,
*_dejando_estado_vacío.
*--------------------------------------------------------------------
ls_expedicionario-nombre = 'David'.
    ls_expedicionario-oxigeno_restante = 100.
    ls_expedicionario-estado = ''.
    APPEND ls_expedicionario to lt_expedicionario.

    ls_expedicionario-nombre = 'Pablo'.
    ls_expedicionario-oxigeno_restante = 80.
    ls_expedicionario-estado = ''.
    APPEND ls_expedicionario to lt_expedicionario.

    ls_expedicionario-nombre = 'Jose'.
    ls_expedicionario-oxigeno_restante = 60.
    ls_expedicionario-estado = ''.
    APPEND ls_expedicionario to lt_expedicionario.

    ls_expedicionario-nombre = 'Antonio'.
    ls_expedicionario-oxigeno_restante = 40.
    ls_expedicionario-estado = ''.
    APPEND ls_expedicionario to lt_expedicionario.

    ls_expedicionario-nombre = 'Jesus'.
    ls_expedicionario-oxigeno_restante = 18.
    ls_expedicionario-estado = ''.
    APPEND ls_expedicionario to lt_expedicionario.

*_Usando_LOOP_AT_..._ASSIGNING:
*_ _Si_oxigeno_restante_<_20,_estado='RETIRADA_INMEDIATA'.
*_ _Si_no,_estado='CONTINUA'.
*_Actualizando_directamente_la_fila_original.
*--------------------------------------------------------------------
    LOOP AT lt_expedicionario ASSIGNING FIELD-SYMBOL(<fs_expedicionario>).
        IF <fs_expedicionario>-oxigeno_restante < 20.
            <fs_expedicionario>-estado = 'RETIRADA_INMEDIATA'.
        ELSE.
            <fs_expedicionario>-estado = 'CONTINUA'.
        ENDIF.
    ENDLOOP.

*_Después,_usando_READ_TABLE_inline:
*_ _Busca_un_expedicionario_por_nombre.
*_ _Muestra_su_estado_actualizado_con_pipes.
*--------------------------------------------------------------------
    READ TABLE lt_expedicionario WITH KEY nombre = 'Jesus' ASSIGNING <fs_expedicionario>.
    out->write( |El estado de Jesus es { <fs_expedicionario>-estado }| ).

*_Ahora,_usando_LOOP_AT_..._normal:
*_ _Muestra_el_nombre_y_el_estado_con_pipes.
*--------------------------------------------------------------------
    LOOP AT lt_expedicionario ASSIGNING <fs_expedicionario>.
        out->write( |{ <fs_expedicionario>-nombre } - { <fs_expedicionario>-estado }| ).
    ENDLOOP.


*--------------------------------------------------------------------
*_3._(Difícil)_—_Sistema_de_facturación_del_taller_mecánico
*--------------------------------------------------------------------
*_Declara_con_TYPES/DATA_una_estructura_ty_reparacion_con_los_campos:
*_ _id_reparacion_(entero)
*_ _coste_(decimal)
*_ _prioridad_(texto)
*_y_su_tabla_lt_reparaciones.
*--------------------------------------------------------------------

*_Usando_DO_8_TIMES:
*_ _id_reparacion_=_(número_de_vuelta)
*_ _coste_=_(número_de_vuelta_*_35.80)
*_ _prioridad_se_calcula_con_CASE_sobre_(vuelta_MOD_3):
*_ _ _0_=>_'URGENTE'
*_ _ _1_=>_'NORMAL'
*_ _ _2_=>_'BAJA'
*_Añade_cada_registro_con_APPEND.
*--------------------------------------------------------------------

*_Usando_LOOP_AT_..._ASSIGNING_con_WHERE_prioridad='URGENTE':
*_ _Aplica_un_recargo_del_15%_al_coste_directamente_sobre_la_fila.
*--------------------------------------------------------------------

*_Finalmente,_recorre_la_tabla_con_LOOP_AT_normal:
*_ _Muestra_id,_coste_final_y_prioridad_con_pipes.
*_ _Cuenta_cuántas_reparaciones_quedan_con_prioridad_'URGENTE'.
*--------------------------------------------------------------------




*--------------------------------------------------------------------
*_4._(Muy_muy_muy_difícil)_—_Centro_de_control_de_la_carrera_de_relevos
*--------------------------------------------------------------------
*_Declara_con_TYPES/DATA_una_estructura_ty_corredor_con_los_campos:
*_ _dorsal_(entero)
*_ _tiempo_vuelta_(decimal)
*_ _equipo_(texto)
*_ _estado_(texto)
*_y_su_tabla_lt_corredores.
*--------------------------------------------------------------------

*_Usando_DO_10_TIMES:
*_ _dorsal_=_(número_de_vuelta)
*_ _tiempo_vuelta_=_(50_-_(vuelta_*_1.25))
*_ _equipo_se_calcula_con_CASE_sobre_(dorsal_MOD_2):
*_ _ _0_=>_'ROJO'
*_ _ _1_=>_'AZUL'
*_ _estado_vacío
*_Añade_cada_corredor_con_APPEND.
*--------------------------------------------------------------------

*_Usando_LOOP_AT_..._ASSIGNING_(sin_filtro):
*_ _Si_tiempo_vuelta_<_40_Y_equipo='ROJO':
*_ _ _estado='CLASIFICADO'
*_ _Si_tiempo_vuelta_<_40_Y_equipo='AZUL':
*_ _ _Antes_de_clasificar,_hacer_READ_TABLE_inline:
*_ _ _ _Buscar_un_corredor_'ROJO'_con_mejor_tiempo_(menor).
*_ _ _Si_existe_=>_'DESCALIFICADO_POR_EQUIPO'
*_ _ _Si_no_=>_'CLASIFICADO'
*_ _En_cualquier_otro_caso_=>_'ELIMINADO'
*--------------------------------------------------------------------

*_Al_terminar,_recorrer_con_LOOP_AT_..._WHERE_estado='CLASIFICADO':
*_ _Mostrar_dorsal,_tiempo,_equipo_con_pipes.
*_ _Contar_clasificados_por_equipo_'ROJO'_y_'AZUL'.
*--------------------------------------------------------------------





  ENDMETHOD.
ENDCLASS.
