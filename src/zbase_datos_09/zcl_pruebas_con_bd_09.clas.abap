CLASS zcl_pruebas_con_bd_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_pruebas_con_bd_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.



    DATA: lt_alumnos TYPE TABLE OF zalumnos_09,
          ls_alumno  TYPE zalumnos_09.

    " Preparamos el registro
    CLEAR ls_alumno.
    ls_alumno-client   = sy-mandt.
    ls_alumno-id_curso = 'CURSO1'.
    ls_alumno-dni      = '12345678A'.
    ls_alumno-nombre   = 'Ana García'.
    ls_alumno-edad     = 22.
    ls_alumno-nivel    = 'IN'.
    APPEND ls_alumno TO lt_alumnos.

    " Insertamos en la Base de Datos
    INSERT zalumnos_09 FROM TABLE @lt_alumnos.

    " 3. Comprobación y salida por Consola (Sustituye al WRITE)
    IF sy-subrc = 0.
      out->write( 'Éxito: Los registros se han guardado en ZALUMNOS_09.' ).
    ELSE.
      out->write( 'Error: No se pudieron guardar los registros.' ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
