CLASS zcl_chiringuitos_bebidas_09 DEFINITION
  PUBLIC
  INHERITING FROM zcl_chiringuito_09
  FINAL
  CREATE PUBLIC .

  "Vende bebidas, y tiene una regla especial de venta:
  " *no puede vender por debajo de 1,50€* (es el precio mínimo de cualquier bebida,
  "   así que una venta de menos de eso no tiene sentido y debe rechazarse).
  "   Por lo demás, cuando la venta sí es válida, se suma igual que en el padre.
*Debe *redefinir vender, añadiendo esa condición mínima antes de aceptar la venta.
  " Si el importe es menor de 1,50€, no se suma nada y
  " el método debe devolver (RETURNING) un abap_bool indicando si la venta se realizó o no.
  "  *(Ojo: esto implica que también tenéis que cambiar la firma con RETURNING respecto al padre —
  "    pensad si eso es posible o no con REDEFINITION,
  "    y si hace falta ajustar el método del padre desde el principio para que ya lleve
  "    ese RETURNING desde el diseño original.)
*No toca calcular_comision_ayuntamiento — hereda la del 10% tal cual.
*Añade además un método propio, anadir_hielo,
  "  sin parámetros ni lógica obligatoria (podéis dejarlo vacío o con un simple out->write).
  PUBLIC SECTION.
    METHODS:
      vender REDEFINITION,
      anadir_hielo.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_chiringuitos_bebidas_09 IMPLEMENTATION.


  METHOD vender.
    IF iv_importe <= '1.5'.
      rv_importe_ok =  abap_false.
    ELSE.
      rv_importe_ok = super->vender( iv_importe ).
    ENDIF.

  ENDMETHOD.

  METHOD anadir_hielo. "lo dejo vacio ya que no tine un main para poner texto.

  ENDMETHOD.

ENDCLASS.
