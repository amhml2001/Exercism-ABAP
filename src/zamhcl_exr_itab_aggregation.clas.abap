CLASS zamhcl_exr_itab_aggregation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.
    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.
    METHODS perform_aggregation
      IMPORTING
        initial_numbers        TYPE initial_numbers
      RETURNING
        VALUE(aggregated_data) TYPE aggregated_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_ITAB_AGGREGATION IMPLEMENTATION.


  METHOD perform_aggregation.
    LOOP AT initial_numbers INTO DATA(aux) GROUP BY ( group = aux-group
                                               size = GROUP SIZE )
  ASCENDING REFERENCE INTO DATA(groups).
      APPEND INITIAL LINE TO aggregated_data REFERENCE INTO DATA(aggregated).
      aggregated->group = groups->group.
      aggregated->count = groups->size.
      aggregated->min = 9999999.
      LOOP AT GROUP groups ASSIGNING FIELD-SYMBOL(<fs_groups>).
        aggregated->sum += <fs_groups>-number.
        aggregated->max = nmax( val1 = aggregated->max
                                val2 = <fs_groups>-number ).
        aggregated->min = nmin( val1 = aggregated->min
                                val2 = <fs_groups>-number ).
      ENDLOOP.
      aggregated->average = aggregated->sum / groups->size.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
