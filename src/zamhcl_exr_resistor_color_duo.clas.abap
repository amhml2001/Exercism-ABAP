CLASS zamhcl_exr_resistor_color_duo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS value
      IMPORTING
        colors        TYPE string_table
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_RESISTOR_COLOR_DUO IMPLEMENTATION.


  METHOD value.
    "Implement solution
* V1 - USANDO LOOP PARA PEGAR O INDICE E SWITCH AND COND PARA DETERMINAR O VALOR A SER SOMADO
*    LOOP AT colors ASSIGNING FIELD-SYMBOL(<fs_color>) .
*      IF sy-tabix > 2.
*        EXIT.
*      ENDIF.
*
*      result = SWITCH #( to_lower( <fs_color> ) WHEN 'brown'  THEN result + ( 1 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'red'    THEN result + ( 2 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'orange' THEN result + ( 3 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'yellow' THEN result + ( 4 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'green'  THEN result + ( 5 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'blue'   THEN result + ( 6 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'violet' THEN result + ( 7 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'grey'   THEN result + ( 8 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                WHEN 'white'  THEN result + ( 9 * COND #( WHEN sy-tabix = 1 THEN 10 ELSE 1 ) )
*                                                ELSE result + 0
*                                                ).
*    ENDLOOP.

* V2 - PEGANDO PELO INDEX DA TABELA
    DATA(vl_c1) = SWITCH #( colors[ 1 ]  WHEN 'brown'  THEN 10
                                                      WHEN 'red'    THEN 20
                                                      WHEN 'orange' THEN 30
                                                      WHEN 'yellow' THEN 40
                                                      WHEN 'green'  THEN 50
                                                      WHEN 'blue'   THEN 60
                                                      WHEN 'violet' THEN 70
                                                      WHEN 'grey'   THEN 80
                                                      WHEN 'white'  THEN 90
                                                      ELSE 0 ).

      DATA(vl_c2) = SWITCH #( colors[ 2 ] WHEN 'brown'  THEN 1
                                                      WHEN 'red'    THEN 2
                                                      WHEN 'orange' THEN 3
                                                      WHEN 'yellow' THEN 4
                                                      WHEN 'green'  THEN 5
                                                      WHEN 'blue'   THEN 6
                                                      WHEN 'violet' THEN 7
                                                      WHEN 'grey'   THEN 8
                                                      WHEN 'white'  THEN 9
                                                      ELSE 0 ).
    result = vl_c1 + vl_c2.
  ENDMETHOD.
ENDCLASS.
