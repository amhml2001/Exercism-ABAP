CLASS zamhcl_exr_reverse_string DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS reverse_string
      IMPORTING
        input         TYPE string
      RETURNING
        VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_REVERSE_STRING IMPLEMENTATION.


  METHOD reverse_string.
    " Please complete the implementation of the reverse_string method
      result = reverse( input ).
  ENDMETHOD.
ENDCLASS.
