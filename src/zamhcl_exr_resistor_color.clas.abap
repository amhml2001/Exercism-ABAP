CLASS zamhcl_exr_resistor_color DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS resistor_color
      IMPORTING
        color_code   TYPE string
      RETURNING
        VALUE(value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_RESISTOR_COLOR IMPLEMENTATION.


  METHOD resistor_color.
* add solution here
    value = SWITCH #( to_lower( color_code )
                      WHEN 'black' THEN '0'
                      WHEN 'brown' THEN '1'
                      WHEN 'red' THEN '2'
                      WHEN 'orange' THEN '3'
                      WHEN 'yellow' THEN '4'
                      WHEN 'green' THEN '5'
                      WHEN 'blue' THEN '6'
                      WHEN 'violet' THEN '7'
                      WHEN 'grey' THEN '8'
                      WHEN 'white' THEN '9' ).
  ENDMETHOD.
ENDCLASS.
