CLASS zamhcl_exr_line_up DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS format IMPORTING name          TYPE string
                             number        TYPE i
                   RETURNING VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_LINE_UP IMPLEMENTATION.


  METHOD format.
    "Implement solution
    DATA: sufix TYPE c LENGTH 2.
    sufix = COND #( WHEN number DIV 10 <> 1 AND number MOD 10 = 1 THEN 'st'
                    WHEN number DIV 10 <> 1 AND number MOD 10 = 2 THEN 'nd'
                    WHEN number DIV 10 <> 1 AND number MOD 10 = 3 THEN 'rd'
                    ELSE 'th' ).
    result = |{ name }, you are the { number }{ sufix } customer we serve today. Thank you!|.
  ENDMETHOD.
ENDCLASS.
