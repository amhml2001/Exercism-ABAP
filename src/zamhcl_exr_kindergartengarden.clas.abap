CLASS zamhcl_exr_kindergartengarden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS plants
      IMPORTING
        diagram        TYPE string
        student        TYPE string
      RETURNING
        VALUE(results) TYPE string_table.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA students TYPE string_table.
ENDCLASS.



CLASS ZAMHCL_EXR_KINDERGARTENGARDEN IMPLEMENTATION.


  METHOD plants.
    " add solution here
    SPLIT to_upper( diagram ) AT '\N' INTO DATA(row1) DATA(row2).

    DATA(order) = SWITCH #( to_upper( student )
                            WHEN 'ALICE' THEN 0
                            WHEN 'BOB' THEN 1
                            WHEN 'CHARLIE' THEN 2
                            WHEN 'DAVID' THEN 3
                            WHEN 'EVE' THEN 4
                            WHEN 'FRED' THEN 5
                            WHEN 'GINNY' THEN 6
                            WHEN 'HARRIET' THEN 7
                            WHEN 'ILEANA' THEN 8
                            WHEN 'JOSEPH' THEN 9
                            WHEN 'KINCAID' THEN 10
                            WHEN 'LARRY' THEN 11 ).
    DATA(off1) = 2 * order.
    DATA(off2) = 2 * order + 1.

    results = VALUE #( ( |{ COND string( WHEN row1+off1(1) = 'V' THEN 'violets'
                                         WHEN row1+off1(1) = 'C' THEN 'clover'
                                         WHEN row1+off1(1) = 'R' THEN 'radishes'
                                         WHEN row1+off1(1) = 'G' THEN 'grass' ) }| )
                       ( |{ COND string( WHEN row1+off2(1) = 'V' THEN 'violets'
                                         WHEN row1+off2(1) = 'C' THEN 'clover'
                                         WHEN row1+off2(1) = 'R' THEN 'radishes'
                                         WHEN row1+off2(1) = 'G' THEN 'grass' ) }| )
                       ( |{ COND string( WHEN row2+off1(1) = 'V' THEN 'violets'
                                         WHEN row2+off1(1) = 'C' THEN 'clover'
                                         WHEN row2+off1(1) = 'R' THEN 'radishes'
                                         WHEN row2+off1(1) = 'G' THEN 'grass' ) }| )
                       ( |{ COND string( WHEN row2+off2(1) = 'V' THEN 'violets'
                                         WHEN row2+off2(1) = 'C' THEN 'clover'
                                         WHEN row2+off2(1) = 'R' THEN 'radishes'
                                         WHEN row2+off2(1) = 'G' THEN 'grass' ) }| ) ).
  ENDMETHOD.
ENDCLASS.
