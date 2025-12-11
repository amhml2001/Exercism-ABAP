CLASS zamhcl_exr_leap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS leap
      IMPORTING
        year          TYPE i
      RETURNING
        VALUE(result) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_LEAP IMPLEMENTATION.


  METHOD leap.
* add solution here
    result = COND #( WHEN year MOD 4 = 0 AND year MOD 100 <> 0  THEN abap_true
                      WHEN year MOD 4 = 0 AND year MOD 100 = 0 AND year MOD 400 = 0 THEN abap_true
                      ELSE abap_false ).
  ENDMETHOD.
ENDCLASS.
