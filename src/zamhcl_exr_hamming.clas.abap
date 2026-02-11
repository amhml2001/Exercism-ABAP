CLASS zamhcl_exr_hamming DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS hamming_distance
      IMPORTING
        first_strand  TYPE string
        second_strand TYPE string
      RETURNING
        VALUE(result) TYPE i
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_HAMMING IMPLEMENTATION.


  METHOD hamming_distance.
    " add solution here
    DATA: lv_index TYPE i VALUE 0.

    IF strlen( first_strand ) <> strlen( second_strand ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    WHILE lv_index < strlen( first_strand ).
      result = COND #( WHEN substring( val = first_strand len = 1 off = lv_index ) <>
                            substring( val = second_strand len = 1 off = lv_index )
                            THEN result + 1
                            ELSE result ).
      lv_index += 1.
    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
