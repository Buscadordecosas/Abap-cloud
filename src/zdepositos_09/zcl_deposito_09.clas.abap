CLASS zcl_deposito_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS:
    constructor importing iv_capacidad type i,
    respotar_deposito importing iv_litros type i,     "combustible del tipo litro
    despachar_combustible IMPORTING iv_litros TYPE i  "combustible del tipo litro
        RETURNING VALUE(rv_ok) type abap_boolean,
    consultar_nivel RETURNING VALUE(rv_litro) type i. "combustible del tipo litro

  PRIVATE SECTION.

    data mv_litro_actuales TYPE i.
    data mv_capacidad_maxima type i.

ENDCLASS.


CLASS zcl_deposito_09 IMPLEMENTATION.

METHOD constructor.
    mv_capacidad_maxima = iv_capacidad. "cojo el dato del privado y lo recupero en el publico
    mv_litro_actuales = 0.
endmethod.

        METHOD respotar_deposito.
            if mv_litro_actuales + iv_litros <= mv_capacidad_maxima. "Si el litro actual mas el que vamos a meter es menor o igual que la capacidad max.
                mv_litro_actuales += iv_litros.                      "Si es asi, lo suma al actual.
            else.
                mv_litro_actuales = mv_capacidad_maxima.             "Si no, lo pasa a la capacidad maxima.
            ENDIF.

        ENDMETHOD.

        METHOD despachar_combustible.
            if mv_litro_actuales >= iv_litros..                      "Pregunta: "¿Los litros que tengo guardados en el depósito (mv_litros_actuales) son mayores o iguales a los litros que me está pidiendo el cliente (iv_litros)?"
                mv_litro_actuales -= iv_litros.                      "Si es asi, Le resta a los litros del depósito los litros que acaba de entregar
                rv_ok = abap_true.                                   "rv_ok, verdadero. ---> a quien llamó al método de que el despacho fue exitoso
            else.
                rv_ok = abap_false.                                  "Si no, rv_ok, falso.---> a quien llamó al método de que el despacho no fue exitoso
            ENDIF.

        ENDMETHOD.

        METHOD consultar_nivel.
            rv_litro = mv_litro_actuales.                            "Devuelve el valor a la instancia de litros actuales.
        ENDMETHOD.




ENDCLASS.
