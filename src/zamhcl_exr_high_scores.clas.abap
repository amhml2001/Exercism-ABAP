CLASS zamhcl_exr_high_scores DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES integertab TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    METHODS constructor
      IMPORTING
        scores TYPE integertab.

    METHODS list_scores
      RETURNING
        VALUE(result) TYPE integertab.

    METHODS latest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personalbest
      RETURNING
        VALUE(result) TYPE i.

    METHODS personaltopthree
      RETURNING
        VALUE(result) TYPE integertab.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA scores_list TYPE integertab.
ENDCLASS.



CLASS ZAMHCL_EXR_HIGH_SCORES IMPLEMENTATION.


  METHOD constructor.
    me->scores_list = scores.
  ENDMETHOD.


  METHOD latest.
    " add solution here
    result = scores_list[ lines( scores_list ) ].
  ENDMETHOD.


  METHOD list_scores.
    " add solution here
    result = scores_list.
    SORT result DESCENDING.
  ENDMETHOD.


  METHOD personalbest.
    " add solution here
    result = REDUCE #( INIT max = VALUE #( )
                       FOR s_score IN scores_list
                       NEXT max = COND #( WHEN s_score > max THEN s_score ELSE max ) ).
  ENDMETHOD.


  METHOD personaltopthree.
    " add solution here
    DATA(temp) = scores_list.
    SORT temp DESCENDING.
    DELETE temp FROM 4.
    result = temp.
  ENDMETHOD.
ENDCLASS.
