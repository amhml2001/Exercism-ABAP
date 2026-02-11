CLASS zamhcl_exr_clock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        !hours   TYPE i
        !minutes TYPE i DEFAULT 0.
    METHODS get
      RETURNING
        VALUE(result) TYPE string.
    METHODS add
      IMPORTING
        !minutes TYPE i.
    METHODS sub
      IMPORTING
        !minutes TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: time TYPE t.
ENDCLASS.



CLASS ZAMHCL_EXR_CLOCK IMPLEMENTATION.


  METHOD add.
    time += minutes * 60.
  ENDMETHOD.


  METHOD constructor.
*    DATA: h TYPE n LENGTH 2,
*          m TYPE n LENGTH 2.
*
*    DATA(aux) = hours.
*    DATA(aux2) = minutes.
*
*    WHILE aux2 < 0.
*      aux2 += 60.
*      aux -= 1.
*    ENDWHILE.
*
*    WHILE aux2 >= 60.
*      aux2 -= 60.
*      aux += 1.
*    ENDWHILE.
*
*    WHILE aux < 0.
*      aux += 24.
*    ENDWHILE.
*
*    WHILE aux >= 24.
*      aux -= 24.
*    ENDWHILE.
*
*    h = aux.
*    m = aux2.
*
*    time = |{ h }{ m }00|.

* COMO VIMOS NO MÉTODO DE ADICIONAR E SUBTRAIR, SE TRANSFORMARMOS
* OS VALORES EM SEGUNDOS A VARIÁVEL DO TIPO T VAI FAZER TODO A LÓGICA
    time = hours * 60 * 60 + minutes * 60.
  ENDMETHOD.


  METHOD get.
    result = |{ time(2) }:{ time+2(2) }|.
  ENDMETHOD.


  METHOD sub.
    time -= minutes * 60.
  ENDMETHOD.
ENDCLASS.
