CLASS zamhcl_exr_scrabblescore DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS score
      IMPORTING
        input         TYPE string OPTIONAL
      RETURNING
        VALUE(result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_SCRABBLESCORE IMPLEMENTATION.


  METHOD score.
    DATA: r_1  TYPE RANGE OF c,
          r_2  TYPE RANGE OF c,
          r_3  TYPE RANGE OF c,
          r_4  TYPE RANGE OF c,
          r_5  TYPE RANGE OF c,
          r_8  TYPE RANGE OF c,
          r_10 TYPE RANGE OF c.

    r_1 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'A' )
                   ( low = 'E' )
                   ( low = 'I' )
                   ( low = 'O' )
                   ( low = 'U' )
                   ( low = 'L' )
                   ( low = 'N' )
                   ( low = 'R' )
                   ( low = 'S' )
                   ( low = 'T' ) ).
    r_2 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'D' )
                   ( low = 'G' ) ).
    r_3 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'B' )
                   ( low = 'C' )
                   ( low = 'M' )
                   ( low = 'P' ) ).
    r_4 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'F' )
                   ( low = 'H' )
                   ( low = 'V' )
                   ( low = 'W' )
                   ( low = 'Y' ) ).
    r_5 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'K' ) ).
    r_8 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'J' )
                   ( low = 'X' ) ).
    r_10 = VALUE #( sign = 'I'
                   option = 'EQ'
                   ( low = 'Q' )
                   ( low = 'Z' ) ).

    DATA(temp) = to_upper( input ).
    WHILE temp IS NOT INITIAL.
      RESULT = COND #( WHEN temp+0(1) IN r_1 THEN result + 1
                       WHEN temp+0(1) IN r_2 THEN result + 2
                       WHEN temp+0(1) IN r_3 THEN result + 3
                       WHEN temp+0(1) IN r_4 THEN result + 4
                       WHEN temp+0(1) IN r_5 THEN result + 5
                       WHEN temp+0(1) IN r_8 THEN result + 8
                       WHEN temp+0(1) IN r_10 THEN result + 10 ).
      SHIFT temp.
    ENDWHILE.
  ENDMETHOD.
ENDCLASS.
