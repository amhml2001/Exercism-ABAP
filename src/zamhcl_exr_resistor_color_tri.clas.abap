CLASS zamhcl_exr_resistor_color_tri DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS label
      IMPORTING
        colors        TYPE string_table
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_RESISTOR_COLOR_TRI IMPLEMENTATION.


  METHOD label.
    "Implement solution
    DATA aux TYPE int8.
    DATA(vl_c1) = SWITCH #( to_lower( colors[ 1 ] ) WHEN 'brown'  THEN 10
                                                    WHEN 'red'    THEN 20
                                                    WHEN 'orange' THEN 30
                                                    WHEN 'yellow' THEN 40
                                                    WHEN 'green'  THEN 50
                                                    WHEN 'blue'   THEN 60
                                                    WHEN 'violet' THEN 70
                                                    WHEN 'grey'   THEN 80
                                                    WHEN 'white'  THEN 90
                                                    ELSE 0 ).

    DATA(vl_c2) = SWITCH #( to_lower( colors[ 2 ] ) WHEN 'brown'  THEN 1
                                                    WHEN 'red'    THEN 2
                                                    WHEN 'orange' THEN 3
                                                    WHEN 'yellow' THEN 4
                                                    WHEN 'green'  THEN 5
                                                    WHEN 'blue'   THEN 6
                                                    WHEN 'violet' THEN 7
                                                    WHEN 'grey'   THEN 8
                                                    WHEN 'white'  THEN 9
                                                    ELSE 0 ).

    DATA(vl_c3) = SWITCH #( to_lower( colors[ 3 ] ) WHEN 'brown'  THEN 1
                                                    WHEN 'red'    THEN 2
                                                    WHEN 'orange' THEN 3
                                                    WHEN 'yellow' THEN 4
                                                    WHEN 'green'  THEN 5
                                                    WHEN 'blue'   THEN 6
                                                    WHEN 'violet' THEN 7
                                                    WHEN 'grey'   THEN 8
                                                    WHEN 'white'  THEN 9
                                                    ELSE 0 ).
    aux = vl_c1 + vl_c2.

    DO vl_c3 TIMES.
      aux = aux * 10.
    ENDDO.
    DATA(format) = CONV string( aux ).
    CONDENSE format NO-GAPS.

    DATA(lv_count) = count( val = format pcre = '0' ).

    IF lv_count >= 3.
      DATA(i) = strlen( format ) - lv_count + ( lv_count MOD 3 ).
      format = format(i).

      DATA(vl_prefix) = SWITCH string( lv_count DIV 3 WHEN 1 THEN 'kilo'
                                                      WHEN 2 THEN 'mega'
                                                      WHEN 3 THEN 'giga' ).
    ENDIF.

    CONDENSE vl_prefix NO-GAPS.

    result = |{ format } { vl_prefix }ohms|.
  ENDMETHOD.
ENDCLASS.
