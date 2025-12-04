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
    " RESOLVER ISSO USANDO REGEX!!!
    " val recebe o valor da string
    " pcre indicamos o regex
    " case indica se é case sensitive
    result = count( val = input pcre = '[AEIOULNRST]' case = abap_false ) * 1 +
             count( val = input pcre = '[DG]' case = abap_false ) * 2 +
             count( val = input pcre = '[BCMP]' case = abap_false ) * 3 +
             count( val = input pcre = '[FHVWY]' case = abap_false ) * 4 +
             count( val = input pcre = '[K]' case = abap_false ) * 5 +
             count( val = input pcre = '[JX]' case = abap_false ) * 8 +
             count( val = input pcre = '[QZ]' case = abap_false ) * 10.
  ENDMETHOD.
ENDCLASS.
