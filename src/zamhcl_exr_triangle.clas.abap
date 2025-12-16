CLASS zamhcl_exr_triangle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      is_equilateral
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_isosceles
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid,
      is_scalene
        IMPORTING
          side_a        TYPE f
          side_b        TYPE f
          side_c        TYPE f
        RETURNING
          VALUE(result) TYPE abap_bool
        RAISING
          cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_TRIANGLE IMPLEMENTATION.


  METHOD is_equilateral.
    "Implement solution
    IF ( side_a + side_b ) < side_c OR
       ( side_c + side_a ) < side_b OR
       ( side_b + side_c ) < side_a OR
       side_a <= 0 OR
       side_b <= 0 OR
       side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    result = COND #( WHEN side_a = side_b AND
                          side_a = side_c AND
                          side_b = side_c THEN abap_true
                          ELSE abap_false ).
  ENDMETHOD.


  METHOD is_isosceles.
    "Implement solution
    IF ( side_a + side_b ) < side_c OR
       ( side_c + side_a ) < side_b OR
       ( side_b + side_c ) < side_a OR
       side_a <= 0 OR
       side_b <= 0 OR
       side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    result = COND #( WHEN side_a = side_b OR
                          side_a = side_c OR
                          side_b = side_c THEN abap_true
                          ELSE abap_false ).
  ENDMETHOD.


  METHOD is_scalene.
    "Implement solution
    IF ( side_a + side_b ) < side_c OR
       ( side_c + side_a ) < side_b OR
       ( side_b + side_c ) < side_a OR
       side_a <= 0 OR
       side_b <= 0 OR
       side_c <= 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    result = COND #( WHEN side_a <> side_b AND
                          side_a <> side_c AND
                          side_b <> side_c THEN abap_true
                          ELSE abap_false ).
  ENDMETHOD.
ENDCLASS.
