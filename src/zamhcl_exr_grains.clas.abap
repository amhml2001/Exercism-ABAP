CLASS zamhcl_exr_grains DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES type_result TYPE p LENGTH 16 DECIMALS 0.
    METHODS square
      IMPORTING
        input         TYPE i
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
    METHODS total
      RETURNING
        VALUE(result) TYPE type_result
      RAISING
        cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_GRAINS IMPLEMENTATION.


  METHOD square.
    " add solution here
    IF input > 0 AND input < 65.
      result = 2 ** input - 1.
    ELSE.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
  ENDMETHOD.


  METHOD total.
    " add solution here

    result = REDUCE #( INIT tot = 0
                       FOR i = 1 THEN i + 1 UNTIL i > 64
                       NEXT tot += square( input = i ) ) .


  ENDMETHOD.
ENDCLASS.
