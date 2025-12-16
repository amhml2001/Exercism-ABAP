CLASS zamhcl_exr_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand        TYPE string
        RETURNING
          VALUE(result) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZAMHCL_EXR_RNA_TRANSCRIPTION IMPLEMENTATION.


  METHOD transcribe.
    "Implement solution
    result = strand.

    TRANSLATE result USING 'GCCGTAAU'.
  ENDMETHOD.
ENDCLASS.
